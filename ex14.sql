begin;
/* Add a dead column to person that's like the one in pet. */
ALTER TABLE person ADD COLUMN dead INTEGER;

/* Add a phone_number column to person. */
ALTER TABLE person ADD COLUMN phone_number INTEGER;

/* Add a salary column to person that is float. */
ALTER TABLE person ADD COLUMN salary FLOAT;

/* Add a dob column to both person and pet that is a DATETIME. */
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;

/* Add a purchased_on column to person_pet of type DATETIME. */
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

/* Add a parent column to pet that's an INTEGER and holds the id for this pet's parent. */
ALTER TABLE pet ADD COLUMN parent INTEGER;
rollback;
/* Update the existing database records with the new column data using UPDATE statements.
   Don't forget about the purchased_on column in person_pet relation table to inidicate 
   when that person bought the pet. */
UPDATE person SET dead = 0 WHERE id = 0;
UPDATE person SET phone_number = 5556666 WHERE id = 0;
UPDATE person SET salary = 123456.78 WHERE id = 0;
UPDATE person SET dob = datetime("1978-01-01") WHERE id = 0;
UPDATE pet SET dob = datetime("1999-12-12") WHERE id = 0;
UPDATE pet SET dob = datetime("1998-11-11") WHERE id = 1;
UPDATE pet SET parent = 1 WHERE id = 0;
UPDATE person_pet SET purchased_on = datetime("2000-01-01") WHERE person_id IN (
	SELECT person.id
	FROM person
	WHERE
	person.first_name = "Zed"
);

/* Add 4 more people and 5 more pets and assign their ownership and parents. */
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (1, "Zombie", "Ned", 49, 1, 0001111, 1000.23, datetime("1909-02-03"));
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (2, "Pirate", "Steve", 36, 0, 2223333, 999.99, datetime("1492-04-05"));
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (3, "Mister", "Donut", 1, 0, 4445555, 200.00, datetime("1980-06-07"));
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (4, "Doctor", "Nick", 40, 0, 7778888, 1.99, datetime("1960-08-09"));
INSERT INTO pet (id, name, breed, age, dead, dob)
	VALUES (2, "Snuggles", "Polar Bear", 2, 0, datetime("1990-01-01"));
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (3, "Snuggles Jr.", "Baby Polar Bear", 0, 0, datetime("1992-02-02"), 2);
INSERT INTO pet (id, name, breed, age, dead, dob)
	VALUES (4, "Bigfoot", "Kangaroo", 3, 0, datetime("1989-03-03"));
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (5, "Little Bigfoot", "Baby Kangaroo", 0, 0, datetime("1992-05-05"), 4);
INSERT INTO pet (id, name, breed, age, dead, dob)
	VALUES (6, "Tweetie", "Bird", 5, 0, datetime("1987-08-08"));
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (1, 2, datetime("1999-09-09"));
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (2, 6, datetime("2005-10-10"));
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (3, 3, datetime("1993-05-05"));
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (4, 4, datetime("1992-05-05"));
INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (4, 5, datetime("2004-05-05"));

/* Write a query that can find all the names of pets and their owners bought after 2004.
   Key to this is to map the person_pet based on the purchased_on column to the pet and
   parent */
SELECT person.first_name, person.last_name, pet.name
	FROM person, pet, person_pet
	WHERE
	person.id = person_pet.person_id AND
	pet.id = person_pet.pet_id AND
	person_pet.purchased_on > datetime("2004-01-01");

/* Write a query that can find the pets that are children of a given pet.  Again look
   at the pet.parent to do this.  It's actually easy so don't over think it. */
SELECT name FROM pet WHERE pet.parent = 4;

