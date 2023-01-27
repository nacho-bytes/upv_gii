import torch
from torch import nn
from torch.utils.data import DataLoader
from torchvision import datasets
from torchvision.transforms import ToTensor
import numpy as np
import sys

if len(sys.argv)!=6:
  print('Usage: %s <batchs> <layers> <npl> <lrs> <epochs>' % sys.argv[0])
  sys.exit(1)

batchs=np.fromstring(sys.argv[1], dtype=int, sep=" ")
layers=np.fromstring(sys.argv[2], dtype=int, sep=" ")
neurons_per_layer=np.fromstring(sys.argv[3], dtype=int, sep=" ")
learning_rates=np.fromstring(sys.argv[4], dtype=float, sep=" ")
epochs=np.fromstring(sys.argv[5], dtype=int, sep=" ")

# Load data
training_data = datasets.FashionMNIST(root="data", train=True,
  download=True, transform=ToTensor())
training_data.data.to(torch.device('cuda'))
training_data.targets.to(torch.device('cuda'))
test_data = datasets.FashionMNIST(root="data", train=False,
  download=True, transform=ToTensor())
test_data.data.to(torch.device('cuda'))
test_data.targets.to(torch.device('cuda'))

class NeuralNetwork(nn.Module):
  def __init__(self, input_size, layers: list, num_classes):
    super(NeuralNetwork, self).__init__()
    self.flatten = nn.Flatten()
    self.layers = nn.ModuleList()
    self.input_size = input_size
    for output_size, activation_function in layers:
      self.layers.append(nn.Linear(input_size, output_size))
      input_size = output_size
      self.layers.append(activation_function)
    self.layers.append(nn.Linear(input_size, num_classes))
  def forward(self, x):
    x = self.flatten(x).to('cuda')
    for layer in self.layers:
      x = layer(x)
    return x

def train_loop(dataloader, model, loss_fn, optimizer):
  size = len(dataloader.dataset)
  results = []
  for batch, (X, y) in enumerate(dataloader):
    pred = model(X); loss = loss_fn(pred, y.to('cuda'))
    optimizer.zero_grad(); loss.backward(); optimizer.step() # backprop
    if batch % 100 == 0:
      loss, current = loss.item(), batch * len(X)
      print(f"trloss: {loss:>7f}  [{current:>5d}/{size:>5d}]")
      results.append((f"{loss:>7f}", f"{current:>5d}", f"{size:>5d}"))
  return results
        

def test_loop(dataloader, model, loss_fn):
  size = len(dataloader.dataset); nbatches = len(dataloader)
  teloss, correct = 0, 0
  with torch.no_grad():
    for X, y in dataloader:
      pred = model(X); teloss += loss_fn(pred, y.to('cuda')).item()
      correct += (pred.argmax(1) == y.to('cuda')).type(torch.float).sum().item()
  teloss /= nbatches; correct /= size
  print(f"teacc: {(100*correct):>0.1f}%, teloss: {teloss:>8f} \n")
  return (f"{(100*correct):>0.1f}", f"{teloss:>8f}")

# DataLoader
torch.manual_seed(23)

with open('mlp.out', 'w') as fh:
  fh.write("%g %g %g %g %g\n" % (len(batchs), len(layers), len(neurons_per_layer), len(learning_rates), epochs[0]))

for batch in batchs:

  train_dataloader = DataLoader(training_data, batch_size=int(batch),
    shuffle=True)
  test_dataloader = DataLoader(test_data, batch_size=int(batch),
    shuffle=True)


  # Instalation
  torch.manual_seed(23)
  C = 10
  N,H,W = training_data.data.shape; D = H*W
  
  for layer in layers:
    for neuron_per_layer in neurons_per_layer:
      layer_list = []
      for i in range(layer):
        layer_list.append((neuron_per_layer, nn.ReLU()))
      model = NeuralNetwork(D, layer_list, C)
      model = model.to('cuda')

      for learning_rate in learning_rates:
        loss_fn = nn.CrossEntropyLoss()
        optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)
        with open('mlp_train/b' + str(batch) + '_l' + str(layer) + '_n' + str(neuron_per_layer) + '_lr' + str(learning_rate) + '_e' + str(epochs[0]) + '.out', 'w') as fh:
          for t in range(epochs[0]):
            print(f"Epoch {t+1}\n-------------------------------")
            
            trresults = train_loop(train_dataloader, model, loss_fn, optimizer)
            fh.write(f"Epoch {t+1}\n-------------------------------\n")
            for lost, current, size in trresults:
              fh.write(lost + ' ' + current + ' ' + size + '\n')

            tacc, tloss = test_loop(test_dataloader, model, loss_fn)
            with open('mlp.out', 'a') as fhr:
              fhr.write(str(batch) + ' ' + str(layer) + ' ' + str(neuron_per_layer) + ' ' \
                + str(learning_rate) + ' ' + str(t+1) + ' ' + tacc + ' ' + tloss + '\n') 
          print("Done!")