select * from pet;

update pet set name = "Zed's pet" where id in(
	select pet.id
	from pet, person_pet, person
	where
	person.id = person_pet.person_id and
	pet.id = person_pet.pet_id and
	person.first_name = 'Zed'
);

select * from pet;