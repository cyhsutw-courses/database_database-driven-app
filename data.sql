BEGIN;
INSERT INTO hospital (id,name,city,country)
VALUES(1,'A_hospital','Taipei','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(2,'B_hospital','Taipei','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(3,'D_hospital','Tainan','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(4,'C_hospital','Tainan','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(5,'^_^_hospital','Taichung','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(6,'T T_hospital','Taichung','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(7,'Orz_hospital','Hsinchu','Taiwan');
INSERT INTO hospital (id,name,city,country)
VALUES(8,'><_hospital','Hsinchu','Taiwan');

INSERT INTO birth (id, given_name)
VALUES (0, 'NULL');
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(1,'Belle','1987-03-31 03:00:00',1,NULL,0);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(2,'Belle','1988-03-31 04:10:00',8,NULL,0);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(3,'Yvette','1989-05-31 05:02:11',5,1,2);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(4,'Vicky','1990-02-25 06:20:02',3,1,2);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(5,'Mary','1990-01-31 07:00:00',2,2,1);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(6,'Belle','1991-02-21 03:22:10',7,1,3);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(7,'Sandy','1991-02-11 03:00:00',6,1,2);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(8,'Ruby','1992-02-21 08:05:00',3,2,1);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(9,'Susan','1993-05-31 11:06:00',1,1,3);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(10,'Linda','1994-07-14 12:00:00',8,2,4);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(11,'Lydia','1994-08-31 03:08:00',3,3,5);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(12,'Leo','1994-10-17 03:10:00',2,3,6);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(13,'John','1995-12-25 22:00:41',1,1,8);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(14,'Harry','1995-12-24 12:12:00',4,2,9);
INSERT INTO birth (id,given_name,birthday,hospital_id,doctor_id,mother_id)
VALUES(15,'Abel','1995-12-21 14:00:00',6,1,10);

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(1, 1, 'DISEASE', '2014-05-01 12:01:00', 'Taipei', 'MORGUE', TRUE, 11, 'Mother');

INSERT INTO death (id, person_id, death, time, place, status, confirmed)
VALUES(2, 2, 'MURDER', '2014-05-02 11:34:00', 'Hsinchui', 'BURIED', FALSE);

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(3, 3, 'ACCIDENT', '2014-05-03 07:03:00', 'Taichung', 'CREMATED', TRUE, 12, 'Father');

INSERT INTO death (id, person_id, death, time, place, status, confirmed)
VALUES(4, 4, 'DISEASE', '2014-05-04 12:56:00', 'Tainan', 'MORGUE', FALSE);

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(5, 5, 'MURDER', '2014-05-05 08:26:00', 'Taipei', 'BURIED', TRUE, 13, 'Brother');

INSERT INTO death (id, person_id, death, time, place, status, confirmed)
VALUES(6, 6, 'ACCIDENT', '2014-05-06 11:25:00', 'Hsinchu', 'CREMATED', FALSE);

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(7, 7, 'DISEASE', '2014-05-07 12:00:00', 'Taichung', 'MORGUE', TRUE, 14, 'Mother');

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(8, 8, 'MURDER', '2014-05-08 12:00:00', 'Tainan', 'BURIED', TRUE, 15, 'Mother');

INSERT INTO death (id, person_id, death, time, place, status, confirmed)
VALUES(9, 9, 'ACCIDENT', '2014-05-09 12:00:00', 'Taipei', 'CREMATED', FALSE);

INSERT INTO death (id, person_id, death, time, place, status, confirmed, identifier_id, relationship)
VALUES(10, 10, 'DISEASE', '2014-05-10 12:00:00', 'Hsinchu', 'MORGUE', TRUE, 15, 'Father');

INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(1, 'CAR', 1, '2009-11-25', '2015-11-24');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(1, 'TRUCK', 2, '2014-10-19', '2020-10-18');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(2, 'CAR', 3, '2010-01-22', '2016-01-21');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(2, 'TRUCK', 4, '2012-10-25', '2018-10-24');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(2, 'MOTORCYCLE', 5, '2009-08-26', '2015-08-25');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(3, 'CAR', 6, '2010-03-25', '2016-03-24');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(4, 'MOTORCYCLE', 7, '2011-12-25', '2017-12-24');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(5, 'CAR', 8, '2012-07-29', '2018-07-28');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(6, 'CAR', 9, '2013-11-23', '2019-11-22');
INSERT INTO driver_license (owner_id, license_type, license_id, registration_date, expiration_date)
VALUES(7, 'TRUCK', 10, '2014-06-12', '2020-06-11');


INSERT INTO incident (id, victim_id, time, place, perpetrator_id, type, solved)
VALUES( 1, 11, '2002-06-14', 'Taipei', 13, 'KILLED', 'true' );
INSERT INTO incident (id, victim_id, time, place, perpetrator_id, type, solved)
VALUES( 2, 12, '2003-06-14', 'Taipei', 13, 'KILLED', 'true' );
INSERT INTO incident (id, victim_id, time, place, perpetrator_id, type, solved)
VALUES( 3, 2, '2014-06-09', 'Hsinchu', 15, 'STOLEN/ROBBED', 'true' );
INSERT INTO incident (id, victim_id, time, place, perpetrator_id, type, solved)
VALUES( 4, 1, '2013-08-22', 'Hsinchu', 14, 'STOLEN/ROBBED', 'true' );
INSERT INTO incident (id, victim_id, time, place, perpetrator_id, type, solved)
VALUES( 5, 14, '2014-02-17',  'Chiayi', 12, 'ATTACKED', 'false' );

INSERT INTO witness (incident_id, witness_id)
VALUES( 1, 14 );
INSERT INTO witness (incident_id, witness_id)
VALUES( 2, 14 );
INSERT INTO witness (incident_id, witness_id)
VALUES( 2, 15 );
INSERT INTO witness (incident_id, witness_id)
VALUES( 3, 1 );
INSERT INTO witness (incident_id, witness_id)
VALUES( 4, 13 );
INSERT INTO witness (incident_id, witness_id)
VALUES( 5, 2 );


INSERT INTO criminal (id, person_id, type, date, place, outcome, status, closing_date)
VALUES( 1, 13, 'MURDER', '2002-06-14','Taipei', 'true', 'FINISHED JAIL TIME', '2014-01-01' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status, closing_date)
VALUES( 2, 13, 'MURDER', '2003-06-14', 'Taipei', 'true', 'FINISHED JAIL TIME', '2014-01-01' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status)
VALUES( 3, 15, 'ROBBERY', '2014-06-09', 'Hsinchu', 'true', 'IN JAIL' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, closing_date)
VALUES( 4, 10, 'THEFT', '2013-06-12', 'Yunlin', 'false', '2013-06-30' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status, closing_date)
VALUES( 5, 14, 'THEFT', '2013-08-22', 'Hsinchu', 'true', 'PAID FINE', '2013-09-25' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status)
VALUES( 6, 13, 'MURDER', '2014-01-11', 'Yilan', 'true', 'IN JAIL' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status)
VALUES( 7, 12, 'THEFT', '2014-06-13', 'Taichung', 'true', 'IN JAIL' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status)
VALUES( 8, 15, 'THEFT', '2014-06-14', 'Taichung', 'true', 'IN JAIL' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, closing_date)
VALUES( 9, 14, 'ROBBERY', '2014-03-30', 'Chiayi', 'false', '2014-04-05' );
INSERT INTO criminal (id, person_id, type, date, place, outcome, status)
VALUES( 10, 11, 'ROBBERY', '2014-05-27', 'Taoyuan', 'true', 'IN JAIL' );

INSERT INTO victim (crime_id, victim_id)
VALUES( 1, 11 );
INSERT INTO victim (crime_id, victim_id)
VALUES ( 2, 12 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 3, 2 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 4, 8 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 5, 10 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 6, 15 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 7, 5 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 8, 6 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 9, 7 );
INSERT INTO victim (crime_id, victim_id)
VALUES( 10, 9 );
COMMIT;
