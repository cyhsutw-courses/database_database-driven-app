BEGIN;

CREATE TABLE hospital (
	id				BIGSERIAL PRIMARY KEY,
	name			VARCHAR(200),
	city			VARCHAR(200),
	country	 VARCHAR(200)
);

CREATE TABLE birth (
	id 			BIGSERIAL PRIMARY KEY,
	given_name 	VARCHAR(200),
	birthday		DATE,
	hospital_id	BIGINT,
	doctor_id		BIGINT,
	mother_id 		BIGINT,
	FOREIGN KEY (hospital_id)	REFERENCES hospital(id),
	FOREIGN KEY (doctor_id)	REFERENCES birth(id),
	FOREIGN KEY (mother_id)	REFERENCES birth(id)
);


CREATE TYPE CRIMINAL_TYPE AS ENUM ('MURDER', 'ROBBERY', 'THEFT');
CREATE TYPE PUNISHMENT_TYPE AS ENUM ('IN JAIL', 'PAID FINE', 'FINISHED JAIL TIME');

CREATE TABLE criminal (
	id		BIGSERIAL PRIMARY KEY,
	person_id	BIGINT,
	type		CRIMINAL_TYPE,
	date		TIMESTAMP,
	place 		VARCHAR(200),
	outcome	BOOLEAN,
	status		PUNISHMENT_TYPE,
	closing_date	TIMESTAMP,
	FOREIGN KEY (person_id) REFERENCES birth(id)
);

CREATE TABLE victim (
	crime_id	BIGINT,
	victim_id	BIGINT,
	FOREIGN KEY (crime_id) 	REFERENCES criminal(id),
	FOREIGN KEY (victim_id)	REFERENCES birth(id),
	PRIMARY KEY (crime_id, victim_id)
);

CREATE TABLE classmate (
	classmate_id 	BIGINT,
	classmate_name VARCHAR(200),
	criminal_id 	BIGINT,
	FOREIGN KEY (classmate_id)	REFERENCES birth(id),
	FOREIGN KEY (criminal_id)		REFERENCES criminal(id),
	PRIMARY KEY (criminal_id, classmate_name)
);

CREATE TYPE DEATH_TYPE AS ENUM ('DISEASE', 'MURDER', 'ACCIDENT');
CREATE TYPE DEATH_STATUS AS ENUM ('MORGUE', 'BURIED', 'CREMATED');

CREATE TABLE death (
	id		BIGSERIAL PRIMARY KEY,
	person_id	BIGINT,
	death		DEATH_TYPE,
	time		TIMESTAMP,
	place		VARCHAR(200),
	status	DEATH_STATUS,
	confirmed	BOOLEAN,
	identifier_id	BIGINT,
	relationship	VARCHAR(200),
	FOREIGN KEY (person_id) REFERENCES birth(id),
	FOREIGN KEY (identifier_id) REFERENCES birth(id)
);

CREATE TYPE VEHICLE_TYPE AS ENUM ('CAR', 'MOTORCYCLE', 'TRUCK');

CREATE TABLE driver_license (
	owner_id			BIGINT,
	license_type		VEHICLE_TYPE,
	license_id			BIGSERIAL,
	registration_date	DATE,
	expiration_date		DATE,
	FOREIGN KEY (owner_id) REFERENCES birth(id),
	PRIMARY KEY (owner_id, license_type)
);

CREATE TYPE INCIDENT_TYPE AS ENUM ('STOLEN/ROBBED', 'ATTACKED', 'KILLED');
CREATE TABLE incident (
	id			BIGSERIAL PRIMARY KEY,
	victim_id		BIGINT,
	time			TIMESTAMP,
	place			VARCHAR(200),
	perpetrator_id	BIGINT,
	type		INCIDENT_TYPE,
	solved		BOOLEAN,
	FOREIGN KEY (victim_id) 		REFERENCES birth(id),
	FOREIGN KEY (perpetrator_id) 	REFERENCES birth(id)
);

CREATE TABLE witness (
	incident_id	BIGINT,
	witness_id		BIGINT,
	FOREIGN KEY (incident_id)	REFERENCES incident(id),
	FOREIGN KEY (witness_id)	REFERENCES birth(id),
	PRIMARY KEY (incident_id, witness_id)
);

COMMIT;
