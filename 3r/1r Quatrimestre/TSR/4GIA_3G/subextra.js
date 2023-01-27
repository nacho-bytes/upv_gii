// subextra.js
var zmq = require('zeromq')
var subscriber = zmq.socket('sub')

// Check how many arguments have been received.
if (process.argv.length != 4) {
  console.error("Format is 'node subextra URL topics+'")
  console.error("Example: 'node subextra localhost:9999 deporte'")
  process.exit(1)
}
// Get the connection URL.
var url = process.argv[2]
// Get topics
var topic = process.argv[3]
subscriber.on('message', function(data) {
  console.log('Received '+data)
})

subscriber.connect(url)
subscriber.subscribe(topic)