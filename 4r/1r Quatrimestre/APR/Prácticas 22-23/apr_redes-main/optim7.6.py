def train_loop(dataloader, model, loss_fn, optimizer):
  size = len(dataloader.dataset)
  for batch, (X, y) in enumerate(dataloader):
    pred = model(X); loss = loss_fn(pred, y)
    optimizer.zero_grad(); loss.backward(); optimizer.step() # backprop
    if batch % 100 == 0:
      loss, current = loss.item(), batch * len(X)
      print(f"trloss: {loss:>7f}  [{current:>5d}/{size:>5d}]")

def test_loop(dataloader, model, loss_fn):
  size = len(dataloader.dataset); nbatches = len(dataloader)
  teloss, correct = 0, 0
  with torch.no_grad():
    for X, y in dataloader:
      pred = model(X); teloss += loss_fn(pred, y).item()
      correct += (pred.argmax(1) == y).type(torch.float).sum().item()
  teloss /= nbatches; correct /= size
  print(f"teacc: {(100*correct):>0.1f}%, teloss: {teloss:>8f} \n")

loss_fn = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(model.parameters(), lr=learning_rate)
epochs = 10
for t in range(epochs):
  print(f"Epoch {t+1}\n-------------------------------")
  train_loop(train_dataloader, model, loss_fn, optimizer)
  test_loop(test_dataloader, model, loss_fn)
print("Done!")
