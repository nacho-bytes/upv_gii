const zmq = require('zeromq')
let cli=[], req=[], workers=0
let sc = zmq.socket('router') // frontend
let sb = zmq.socket('push') // lo que envia a broker2
let sw = zmq.socket('pull') // lo que reb de broker2

sc.bind('tcp://*:' + process.argv[2])
sb.connect('tcp://localhost:8002') // Enviar a broker2
sw.bind('tcp://*:8003') // Rebre de broker2

sc.on('message', (c,sep,m) => {
	console.log(c + ': ' + m)
	if(workers == 0) {
		cli.push(c)
		req.push(m)
	}
	else {
		if(cli.length == 0) {sb.send([c,'',m]); return} 
		sb.send([cli.shift(),'',req.shift()])
		cli.push(c)
		req.push(m)
	}
})

sw.on('message', (w,sep,c,sep2,r) => {
	console.log(w + ': ' + c + ' ' + r)
	if (c=='') {
		if(cli.length>0) {
			sb.send([cli.shift(),'',req.shift()])
		}
		else workers++
		return
	}
	sc.send([c,'',r])
})