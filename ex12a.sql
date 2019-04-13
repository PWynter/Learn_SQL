/* only drop if table exists. */
drop table if exists person;

/* create again to work with it */
create table person(
	id integer primary key,
	first_name text,
	last_name text,
	age integer
);

/* rename the table to peoples */
alter table person rename to peoples;

/* add a hatred column to peoples */
alter table peoples add column hatred integer;

/* rename peoples back to person. */
alter table peoples rename to person;

/* add height and column to person. */
alter table person add column height integer;

/* add weight and column to person. */
alter table person add column weight integer;

.schema person

/* we dont need that */
drop table person;