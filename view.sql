CREATE VIEW birth_record AS
  SELECT p.id AS person_id,
         p.given_name AS given_name,
         p.birthday AS date_of_birth,
         h.country AS country_of_birth,
         m.given_name AS mother_name
  FROM birth p, hospital h, birth m
  WHERE p.mother_id = m.id AND p.hospital_id = h.id ORDER BY p.id ASC;

CREATE VIEW death_certificate AS
  SELECT d.person_id AS person_id,
         d.time AS date_of_death,
         d.confirmed AS death_confirmed
  FROM death d;

CREATE VIEW criminal_record AS
  SELECT c.person_id AS person_id,
         c.date AS date_of_crime,
         c.outcome AS legal_outcome,
         c.status AS legal_status,
         c.closing_date AS date_of_closing_crime
  FROM criminal c;
