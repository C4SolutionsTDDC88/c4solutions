const waitOn = require('wait-on');
const ip = require('ip');

const HOST_IP = ip.address();

console.log(HOST_IP);

const opts = {
  resources: [
    `http://${HOST_IP}:9001`,
  ],
  delay: 1000, // initial delay in ms, default 0
  interval: 100, // poll interval in ms, default 250ms
  timeout: 30000, // timeout in ms, default Infinity
  tcpTimeout: 1000, // tcp timeout in ms, default 300ms
};


console.log('Waiting for services to start...');

waitOn(opts).then(() => {
  console.log('Services are now upp and running...');
  process.exit(0);
}).catch((err) => {
  console.log(err);
  process.exit(1);
});
