
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
       id INTEGER PRIMARY KEY,
       first_name TEXT,
       last_name TEXT,
       age INTEGER,
       dead INTEGER,
       phone_number TEXT,
       salary FLOAT,
       dob DATETIME
);

CREATE TABLE pet (
       id INTEGER PRIMARY KEY,
       name TEXT,
       breed TEXT,
       age INTEGER,
       dead INTEGER,
       dob DATETIME,
       parent INTEGER
);

CREATE TABLE person_pet (
       person_id INTEGER,
       pet_id INTEGER,
       purchased_on DATETIME
);

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
       VALUES (0, "Zed", "Shaw", 37, 0, "1111111111", 13.0, '20000101 00:00:00');
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
       VALUES (0, "Zed", "Thaw", 37, 0, "1111111111", 13.0, '20000101 00:00:00');
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
       VALUES (0, "Zed", "Hhaw", 37, 0, "1111111111", 13.0, '20000101 00:00:00');
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
       VALUES (0, "Zed", "Jhaw", 37, 0, "1111111111", 13.0, '20000101 00:00:00');
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
       VALUES (0, "Zed", "Bhaw", 37, 0, "1111111111", 13.0, '20000101 00:00:00');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
       VALUES (0, "Fluffy", "Unicorn", 1000, 0, '20000101 00:00:00', 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1, '20000101 00:00:00', 0);
INSERT INTO pet VALUES (2, "Jigantor", "Robot", 1, 0, '20000101 00:00:00', 0);
INSERT INTO pet VALUES (3, "Kigantor", "Robot", 1, 0, '20000101 00:00:00', 0);
INSERT INTO pet VALUES (4, "Ligantor", "Robot", 1, 0, '20000101 00:00:00', 0);

INSERT INTO person_pet (person_id, pet_id, purchased_on) VALUES (0, 0, '20000101 00:00:00');
INSERT INTO person_pet VALUES (0, 1, '20000101 00:00:00');
INSERT INTO person_pet VALUES (0, 2, '20000101 00:00:00');
INSERT INTO person_pet VALUES (0, 3, '20000101 00:00:00');
INSERT INTO person_pet VALUES (0, 4, '20000101 00:00:00');

SELECT * FROM person;

SELECT name, age FROM pet;

SELECT name, age FROM pet WHERE dead = 0;

SELECT * FROM person WHERE first_name != "Zed";

SELECT pet.id, pet.name, pet.age, pet.dead
       FROM pet, person_pet, person
       WHERE
       pet.id = person_pet.pet_id AND
       person_pet.person_id = person.id AND
       person.first_name = "Zed";

/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;

/* aww poor robot */
DELETE FROM pet WHERE dead = 1;

/* make sure the robot is gone */
SELECT * FROM pet;

/* let's resurrect the robot */
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0, '20000101 00:00:00', 0);

/* the robot LIVES! */
SELECT * FROM pet;

