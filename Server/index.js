var pg = require('pg');
//or native libpq bindings
//var pg = require('pg').native

var conString = "postgres://maroon5:misery@140.114.77.19/Group8";

var client = new pg.Client(conString);
client.connect(function(err) {
  if(err) {
    return console.error('could not connect to postgres', err);
  }


  client.query('INSERT INTO birth (given_name) VALUES ($1)', ['hello'], function(err, result) {
    if(err) {
      return console.error('error running query', err);
    }
    console.log(result.rows.length);
    //output: Tue Jan 15 2013 19:12:47 GMT-600 (CST)
    client.end();
  });
});
