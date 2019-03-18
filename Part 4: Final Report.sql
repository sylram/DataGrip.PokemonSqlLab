-- #Directions: Write a query that returns the following columns:
-- #Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type

select #pokemon_trainer.pokemon_id,
       pokemon.pokemons.id,
       pokemons.name as Pokemon,
       trainers.trainername as Trainer_Name,
       pokemon_trainer.pokelevel as Level,
       #pokemons.primary_type,
      types.name as Primary_Type,
      # pokemons.secondary_type,
       tys.name as Secondary_Type
from pokemon.pokemon_trainer
left outer join pokemon.pokemons on pokemons.id=pokemon_trainer.pokemon_id
left outer join pokemon.trainers on pokemon_trainer.trainerID =trainers.trainerID
left outer join pokemon.types on pokemons.primary_type = types.id
left outer join pokemon.types as tys on pokemons.secondary_type= tys.id
order by Primary_Type desc;



#where pokemon_trainer.trainerID = trainers.trainerID;

# where pokemon.pokemons.id = pokemon_trainer.pokemon_id
# and pokemon_trainer.trainerID = trainers.trainerID;

     #secondary_type=types.id;

