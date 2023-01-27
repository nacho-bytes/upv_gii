const ev = require('events')
const emitter = new ev.EventEmitter()
const e1='e1', e2='e2'
let inc=0, t

// Tornar valors aleatoris en el rang[2000, 5000) 
function rand(){ 
    return Math.floor((Math.random() * 3000) + 2000)
}

function handler (e,n) { // e és l'esdeveniment, n és el valor associat
    return (inc) => {   // el "listener" rep un valor (inc)
        n+=inc
        console.log(e + ':' + n)
    } 
}

emitter.on(e1, handler(e1,0))
emitter.on(e2, handler(e2,''))

function etapa() {
    emitter.emit(e1, inc) // emit event
    emitter.emit(e2, inc) // emit event
    inc++
    console.log('duracion ' + t)
}

setInterval(() => {setTimeout(etapa,t=rand())}, 1000) 