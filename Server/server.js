var express = require('express');
var app = express();

var bodyParser = require('body-parser');
app.use(bodyParser());


var pg = require('pg');

var police_dbms = "postgres://maroon5:misery@140.114.77.19/Group8";
var police_db_client = new pg.Client(police_dbms);

police_db_client.connect(function(err){
  if(err){
    console.error('could not connect to postgres', err);
  }
});

var family_dbms;
var family_db_client;

app.use(express.static(__dirname));

var server = app.listen(8080, function() {
    console.log('Listening on port %d', server.address().port);
});

var rollback = function(client) {
  //terminating a client connection will
  //automatically rollback any uncommitted transactions
  //so while it's not technically mandatory to call
  //ROLLBACK it is cleaner and more correct
  client.query('ROLLBACK', function() {
    client.end();
  });
};

app.get('/birth', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM birth',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/criminal', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM criminal',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/death', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM death',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/hospital', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM hospital',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/victim', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM victim',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/license', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM driver_license',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/incident', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM incident',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.get('/witness', function(req, res){
  var response = {};
  police_db_client.query(
    'SELECT * FROM witness',
    function(err, result){
      if(err){
        res.send('500');
      }else{
        res.send(result.rows);
      }
    }
  );
});

app.post('/server', function(req, res){
  var user = req.param('user');
  var passwd = req.param('passwd');
  var host = req.param('host');
  var db_name = req.param('db');

  family_dbms = "postgres://"+user+":"+passwd+"@"+host+"/"+db_name;
  family_db_client = new pg.Client(family_dbms);

  family_db_client.connect(function(err){
    if(err){
      console.error('could not connect to postgres', err);
      res.send('500');
    }else{
      res.send(family_dbms);
    }
  });



});


app.post('/license', function(req, res){
  var owner_id = req.param('owner_id');
  var type = req.param('type');
  var mid_degree = req.param('deg');

  family_db_client.query(
    'SELECT graduated_or_not AS "applicable" FROM educational_record WHERE person_id = $1 AND degree = $2',
    [owner_id, 'Middle school'],
    function(err, result){
      if(err){
        res.send(err);
      }else{
        console.log(result.rows);
        if(result.rows.length<=0){
          res.send('Too young to do so!');
        }else{
          if(result.rows[0].applicable){
            var d = new Date();
            police_db_client.query(
              'INSERT INTO driver_license (owner_id, license_type, registration_date) VALUES ($1, $2, $3)',
              [owner_id, type, d.toUTCString()],
              function(err2, result2){
                  if(err2){
                    res.send(err2);
                  }else{
                    res.send('done');
                  }
                });
            }else{
              res.send('Too young to do so!');
            }
        }
      }
    });
});


app.get('/incident', function(req, res){
  police_db_client.query('SELECT * FROM incident', function(err, result) {
    if(err) {
      console.error('error running query', err);
    }
    res.send(result.rows); // dump all data
  });
});

app.post('/incident', function(req, res){
  var type = req.param('type');
  var person_id = parseInt(req.param('owner_id'));
  var time = req.param('time');
  var place = req.param('place');

  var perpetrator_id = parseInt(req.param('perpetrator_id'));

  if(type == 'STOLEN/ROBBED'){

    var params;
    var queryString;

    var property_id = parseInt(req.param('property_id'));
    var property_type = req.param('p_type');
    var purchase = req.param('purchase_time');

    if(property_type == 'House/Apartment'){
      var address = req.param('address');
      queryString = 'SELECT * FROM pro WHERE person_id=$1 AND property_id=$2 AND time_of_purchase=$3 AND address=$4';
      params = [person_id, property_id, purchase, address];
    }else{
      queryString = 'SELECT * FROM pro WHERE person_id=$1 AND property_id=$2 AND time_of_purchase=$3';
      params = [person_id, property_id, purchase];
    }

    family_db_client.query(
      queryString,
      params,
      function(err, result){
        if(err){
          console.log('select');
          res.send(err);
        }else{
          if(result.rows.length==0){
            res.send('You are a liar, go to jail!');
          }else{
            police_db_client.query(
              'INSERT INTO incident (victim_id, time, place, perpetrator_id, type) VALUES ($1, $2, $3, $4, $5)',
              [person_id, time, place, perpetrator_id, type],
              function(err, result){
                  if(err){
                    console.log('insert');
                    res.send(err);
                  }else{
                    res.send('done');
                  }
              }
            );

          }
        }
      }
    );

  }else{
    police_db_client.query(
      'INSERT INTO incident (victim_id, time, place, perpetrator_id, type) VALUES ($1, $2, $3, $4, $5)',
      [person_id, time, place, perpetrator_id, type],
      function(err, result){
          if(err){
            console.log('haha');
            res.send(err);
          }else{
            res.send('done');
          }
      }
    );
  }




});

app.get('/criminal', function(req, res){
  police_db_client.query('SELECT * FROM criminal', function(err, result) {
    if(err) {
      console.error('error running query', err);
    }
    res.send(result.rows); // dump all data
  });

});

app.post('/criminal', function(req, res){

  var person_id = parseInt(req.param('person_id'));
  var type = req.param('type');
  var date = req.param('date');
  var place = req.param('place');
  var outcome = parseInt(req.param('outcome'));
  var status = req.param('status');
  var closing_date = req.param('closing_date');


  var classmates;

  family_db_client.query('SELECT * FROM death WHERE person_id=$1',
  [person_id],
  function(err, result){
      if(err){
        res.send(err);
      }else{
        if(result.rows.length>0){
          res.send('bye');
        }else{
          family_db_client.query('SELECT classmate_name FROM classmate', function(err, result){
            if(err){
              res.send('500');
            }else{
              classmates = result.rows;
              police_db_client.query('BEGIN', function(err, result){
                if(err){
                  rollback(police_db_client);
                  res.send('tx rollback');
                }
                police_db_client.query(
                  'INSERT INTO criminal (person_id, type, date, place, outcome, status, closing_date) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id',
                  [person_id, type, date, place, outcome, status, closing_date],
                  function(err, result){
                    if(err){
                      rollback(police_db_client);
                      res.send('tx rollback');
                    }else{
                      var c_id = result.rows[0].id;
                      for(var i=0; i<classmates.length; i++){
                        police_db_client.query(
                          'INSERT INTO classmate (classmate_name, criminal_id) VALUES ($1, $2)',
                          [classmates[i], c_id],
                          function(err, result){
                            if(err){
                              rollback(police_db_client);
                              res.send('tx rolled back');
                            }
                          }
                        );
                      }
                    }

                  }
                );
                res.send('done');
              });

            }
          });
        }
      }
  });



});
