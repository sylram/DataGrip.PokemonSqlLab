#Part 2: Simple Selects and Counts
#What are all the types of pokemon that a pokemon can have?
SELECT name from pokemon.types;

#What is the name of the pokemon with id 45?
SELECT name from pokemon.pokemons where id=45;
#Eevee

#How many pokemon are there?
SELECT count(name) from pokemon.pokemons;
#656

#How many types are there?
SELECT count(name) from pokemon.types;
#18

#How many pokemon have a secondary type?
select count(name) from pokemon.pokemons where secondary_type is not null;
#316

#Part 3: Joins and Groups
#What is each pokemon's primary type?
select pokemons.id,pokemons.name,pokemons.primary_type,types.name
from pokemon.pokemons
inner join pokemon.types on primary_type=types.id;

#What is Rufflet's secondary type?
select pokemons.name, pokemons.secondary_type,types.name
from pokemon.pokemons,pokemon.types
where pokemon.pokemons.name = 'Rufflet'and secondary_type  = types.id;
#Rufflet	18	Flying

#What are the names of the pokemon that belong to the trainer with trainerID 303?
select pokemon_trainer.trainerID,
       pokemon_trainer.pokemon_id,pokemons.name
from pokemon.pokemon_trainer,pokemon.pokemons
where pokemon_trainer.trainerID = 303 and
      pokemon_trainer.pokemon_id=pokemons.id;
#2	Wailord and 3	Vileplume

#How many pokemon have a secondary type Poison
select count(pokemons.secondary_type),types.name
from pokemon.pokemons,pokemon.types
where pokemon.types.name = 'Poison' and secondary_type  = types.id;
#31

#What are all the primary types and how many pokemon have that type?
select count(pokemons.id),pokemon.types.name
from pokemon.pokemons
left join pokemon.types on primary_type = types.id
group by pokemon.types.name;
#How many pokemon at level 100 does each trainer with at
  # least one level 100 pokemone have?
  # (Hint: your query should not display a trainer

select distinct pokemon_trainer.trainerID,count(pokemon.pokemon_trainer.pokelevel),
                pokemon_trainer.pokelevel
from pokemon.pokemon_trainer
where pokelevel=100
group by pokemon_trainer.trainerID;
select count(distinct pokemon_trainer.trainerID),pokemon.pokemon_trainer.pokelevel
from pokemon.pokemon_trainer
where pokelevel=100
group by pokemon_trainer.pokelevel;
#194


#How many pokemon only belong to one trainer and no other?
select count(*)
from (
select distinct pokemon.pokemon_trainer.pokemon_id,
               count(distinct pokemon.pokemon_trainer.trainerID)
                 as total_number_of_trainers
from pokemon.pokemon_trainer
group by  pokemon_trainer.pokemon_id
having total_number_of_trainers = 1)
  as pokemons_only_belong_to_one_trainer





