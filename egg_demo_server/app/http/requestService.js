'use strict';

const request = require('request');

const fs = require('fs');

const crypto = require('crypto');
crypto.constants.RSA_PKCS1_OAEP_PADDING;


request('http://www.baidu.com', function(error, response, body) {
  // eslint-disable-next-line eqeqeq
  if (!error && response.statusCode == 200) {
    console.log(body); // Show the HTML for the baidu homepage.
  }
});

request({
  url: 'http://www.baidu.com',
  method: 'POST',
  json: true,
  headers: {
    'content-type': 'application/json',
  },
  body: JSON.stringify({ name: 'Tom', age: '12' }),
// eslint-disable-next-line no-unused-vars
}, function(error, response, body) {
  // eslint-disable-next-line eqeqeq,no-empty
  if (!error && response.statusCode == 200) {
    console.log(body);
  }
});


request.post({ url: 'http://service.com/upload', form: { key: 'value' } }, function(error, response, body) {
  // eslint-disable-next-line eqeqeq,no-empty
  if (!error && response.statusCode == 200) {
    console.log(body);
  }
});


const formData = {
  // Pass a simple key-value pair
  my_field: 'my_value',
  // Pass data via Buffers
  my_buffer: new Buffer([ 1, 2, 3 ]),
  // Pass data via Streams
  my_file: fs.createReadStream(__dirname + '/unicycle.jpg'),
};
request.post({ url: 'http://service.com/upload', formData }, function(error, response, body) {
  // eslint-disable-next-line eqeqeq
  if (!error && response.statusCode == 200) {
    console.log(body);
  }
});
