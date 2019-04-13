delete from pet where id in(
	select pet.id
	from pet, person_pet, person_pet
	where
	person.id = person_pet.person_id and
	pet.id = person_pet.pet_id and
	person.first_name = 'Zed'
	);

select * from pet;
select * from  person_pet;

delete from person_pet
	where pet_id not in(
		select id from pet
	);

	select * from person_pet;