/* Add a dead column to person that's like the one in pet. */
/*ALTER TABLE person ADD COLUMN dead INTEGER;*/

/* Add a phone_number column to person. */
ALTER TABLE person ADD COLUMN phone_number INTEGER;

/* Add a salary column to person that is float. */
ALTER TABLE person ADD COLUMN salary float;

/* Add a dob column to both person and pet that is a DATETIME. */
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;

/* Add a purchased_on column to person_pet of type DATETIME. */
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

/* Add a parent column to pet that's an INTEGER and holds the id for this pet's parent. */
ALTER TABLE pet ADD COLUMN parent INTEGER;
