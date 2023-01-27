const http = require('http');

function dd(i) {return (i<10?"0":"")+i;}

const server = http.createServer(
   function (req,res) {
   res.writeHead(200,{'Content-Type':'text/html'});
   res.end('<marquee>Node i Http</marquee>');
   var d = new Date();
   console.log('algú ha accedit a les '+
   d.getHours() +":"+
   dd(d.getMinutes()) +":"+
   dd(d.getSeconds()));
}).listen(58720);
