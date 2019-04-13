/* normal join with equality*/
select pet.id, pet.name, pet.age, pet.dead
	from pet, person_pet, person 
	where
	pet.id = person_pet.id and
	person_pet.person_id = person.id and
	person.first_name = 'Pierre';

/*using sub-select */
select pet.id, pet.name, pet.age, pet.dead
from pet
where pet.id in
(
select pet_id from person_pet, person
where person_pet.person_id = person.id
and person.first_name = 'Pierre'
);


#ex6.sql:10
#The exact same start to the SELECT as on line 2.
#ex6.sql:11
#However, we only want data from the pet table in the "master select" because we'll be using the IN keyword to start a sub-select to get the pet.id values we need.
#ex6.sql:12
#The WHERE clause then says pet.id IN which tells SQLite3 that we are going to take the pet.id values we need from another SQL query.
#ex6.sql:13
#I then start this sub-select for the IN with a parenthesis.
#ex6.sql:14
#I now need to only get the right pet_id values from person and person_pet using a simpler join. Just like with any SELECT I list out the columns I want and what tables they are FROM.
#ex6.sql:15
#I need a where clause that sets the equality needed, but I only need to worry about person.id being matched up with person_pet.person_id.
#ex6.sql:16
#AND finally my name "Zed" to get just the animals I own.
#ex6.sql:17
#Then we close off this sub-select with ) and end the whole SQL statement with ;.