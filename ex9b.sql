update person set first_name = 'Zed'
	where id=0;

update pet set name = 'Fancy pants'
	where id=0;

select * from person;
select * from pet;

update pet set name = 'Deceased' where dead in(
	where id = 0 
);