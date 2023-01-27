const zmq = require('zeromq')
let pub = zmq.socket('pub')
let msg = []

pub.bind(process.argv[2])
for (let i = 4; i < process.argv.length; i++) {
    msg.push(process.argv[i])
}

function emite(n) {
    let m = msg[0]
    pub.send(m  + " " + Math.trunc(n))
    console.log(m  + " " + Math.trunc(n))

    msg.shift()
    msg.push(m)
}

for(let i = 1; i <= process.argv[3]; i++) {
    var n = ((i - 1) / msg.length) + 1
    setTimeout(emite, 1000 * i, n)
}