const fs = require('fs')
const net = require('net')

const server = net.createServer(
    function(c){
        console.log('server: client connected');
        c.on('end',
            function() {
                console.log('server: client disconnected');
                process.exit()
            });
        c.on('data',
            function(data) {
                console.log('server: ipClient ' + data.toString() );
				c.write( server.address().toString() );
				c.write( getLoad().toString() );
            });
    });

function getLoad(){
    data=fs.readFileSync("/proc/loadavg"); //requereix fs
    var tokens = data.toString().split(' ');
    var min1 = parseFloat(tokens[0])+0.01;
    var min5 = parseFloat(tokens[1])+0.01;
    var min15 = parseFloat(tokens[2])+0.01;
    return min1*10+min5*2+min15;
    };

server.listen(58720,
    function() { //listening listener
        console.log('server bound');
    });