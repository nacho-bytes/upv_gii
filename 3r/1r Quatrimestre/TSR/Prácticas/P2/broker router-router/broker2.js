const zmq = require('zeromq')
let workers=[]
let sw = zmq.socket('router') // frontend
let sb = zmq.socket('push') // lo que envia a broker1
let sc = zmq.socket('pull') // lo que reb de broker1

sw.bind('tcp://*:' + process.argv[2])
sb.connect('tcp://localhost:8003') //
sc.bind('tcp://*:8002')

sw.on('message', (w,sep,c,sep2,r) => {
	if (c=='') workers.push(w)
	sb.send([w,sep,c,sep2,r])
})

sc.on('message', (c,sep,m) => {
	sw.send([workers.shift(),'',c,'',m])
})