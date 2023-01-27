const zmq = require('zeromq')
let cli=[], req=[], workers=[], res=[]
let sc = zmq.socket('router') // frontend
let sw = zmq.socket('router') // backend
sc.bind('tcp://*:' + process.argv[2])
sw.bind('tcp://*:' + process.argv[3])
let n = 0;
sc.on('message',(c,sep,m)=> {
	if (workers.length==0) { 
		cli.push(c); req.push(m)
	} else {
		sw.send([workers.shift(),'',c,'',m])
	}
})
sw.on('message',(w,sep,c,sep2,r)=> {
    if (c=='') {workers.push(w); res[w.toString().charAt(1)] = 0; return}
	if (cli.length>0) {
		sw.send([w,'',
			cli.shift(),'',req.shift()])
	} else {
		workers.push(w)
	}
	n++
	res[w.toString().charAt(1)]++
	sc.send([c,'',r + ' ' + n])
})

function stats() {
	console.log('Peticions totals: ' + n)
	res.forEach((e, i) => {
		console.log('\tWorker W' + i + ' ha realitzat: ' + e)
	});
}

setInterval(stats, 5000)