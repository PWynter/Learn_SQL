/* this would fil because 0 is already taken */
insert into person (id, first_name, last_name, age)
	values (0, 'Frank', 'Smith', 100);

/* we can force it by doing an insert or replace */
insert or replace into person (id, first_name, last_name, age)
	values (0,'Frank', 'Smith', 100);

select * from person;

/* and shorthand for that is just replace.  */
replace into person  ( is, first_name, last_name, age)
	values(0, 'Zed', 'Shaw', 37);

	/*now you can see im back */
select * from person;
