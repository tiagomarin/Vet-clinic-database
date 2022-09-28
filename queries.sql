/*Queries that provide answers to the questions from all projects.*/

-------------------------------------------
-- 1st task
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg> 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-------------------------------------------
-- 2nd task
-- part 1
BEGIN;
-- try rolback
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
-- Update species column to digimon for all animals with name ending in mon.
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
-- Update species column to pokemon for all animals without species.
UPDATE animals
SET species = 'pokemon'
WHERE species = '';
COMMIT;
-- Verify that change was made and persists after commit.
SELECT * FROM animals;

-- part 2
BEGIN;
DELETE FROM animals;
ROLLBACK
SELECT * FROM animals;

-- part 3
BEGIN;
DELETE FROM animals
WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT deletion;
UPDATE animals 
SET weight_kg = weight_kg * -1;
ROLLBACK TO deletion;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- part 4 questions
-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(escape_attempts) 
FROM animals
WHERE escape_attempts != 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(escape_attempts) FROM animals;
-- What is the minimum and maximum weight of each type of animal?
SELECT MAX(escape_attempts)
FROM animals
GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN 'Jan 1,1990' AND 'Dec 31,2000'
GROUP BY species;

-------------------------------------------
-- 3rd task
-- What animals belong to Melody Pond?
SELECT (name) FROM animals
WHERE owner_id = 4;
-- List of all animals that are pokemon (their type is Pokemon).
SELECT (name) FROM animals
WHERE species_id = 2;
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name
FROM owners
FULL JOIN animals
ON owners.id = owner_id
GROUP BY name, full_name;
-- How many animals are there per species?
SELECT species.name, COUNT(animals.name)
FROM species
FULL JOIN animals
ON species.id = species_id
GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
WHERE owner_id = 2;
    --  other solution showing owner's name
        SELECT animals.name, owners.full_name
        FROM animals
        JOIN owners
        ON owners.id = owner_id
        WHERE owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
WHERE owner_id = 5
AND escape_attempts = 0;
    --  other solution showing owner's name
        SELECT animals.name, owners.full_name
        FROM animals
        JOIN owners
        ON owners.id = owner_id
        WHERE owners.full_name = 'Dean Winchester'
        AND escape_attempts = 0;
-- Who owns the most animals?
SELECT full_name, COUNT(full_name) AS owns
FROM owners
JOIN animals
ON owners.id = owner_id
GROUP BY full_name
ORDER BY owns DESC LIMIT 1;

-------------------------------------------
-- 4th task
-- 1) Who was the last animal seen by William Tatcher?
SELECT animals.name FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;
    -- same answer with vet name and date of visit
        SELECT animals.name, vets.name, visits.date_of_visit FROM animals
        JOIN visits ON animals.id = animal_id
        JOIN vets ON visits.vet_id = vets.id
        WHERE vets.name = 'William Tatcher'
        ORDER BY visits.date_of_visit DESC LIMIT 1;

-- 2) How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';
    -- same answer with vet name
    SELECT vets.name, COUNT(animals.name) FROM animals
    JOIN visits ON animals.id = animal_id
    JOIN vets ON visits.vet_id = vets.id
    WHERE vets.name = 'Stephanie Mendez'
    GROUP BY vets.name;

-- 3) List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
FULL JOIN specializations ON vets.id = vet_id
FULL JOIN species ON species_id = species.id
GROUP BY vets.name, species.name;
-- 4) List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
AND date_of_visit BETWEEN 'Apr 1,2020' AND 'Aug 30,2020' ;
-- 5) What animal has the most visits to vets?
SELECT animals.name FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
GROUP BY animals.name
ORDER BY COUNT(date_of_visit) DESC LIMIT 1;
    -- same but with quantity of times at the vet
    SELECT animals.name, COUNT(date_of_visit) AS times_at_vet FROM animals
    JOIN visits ON animals.id = animal_id
    JOIN vets ON visits.vet_id = vets.id
    GROUP BY animals.name
    ORDER BY times_at_vet DESC LIMIT 1;

-- 6) Who was Maisy Smith's first visit?
SELECT animals.name FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1;

-- 7) Details for most recent visit: animal information, vet information, and date of visit.
SELECT visits.date_of_visit, animals.name, animals.date_of_birth, 
animals.escape_attempts, animals.neutered, animals.weight_kg, 
species.name AS species, owners.full_name AS owner, 
owners.age AS owner_age, vets.name AS vet, vets.age AS vet_age, 
vets.date_of_graduation AS vet_graduation_date, 
species.name AS specialization
FROM animals
JOIN visits ON animals.id = animal_id
JOIN vets ON visits.vet_id = vets.id
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

-- 8) How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(visits.date_of_visit) AS visits_to_unspecialized_vet FROM visits
FULL JOIN vets ON vets.id = vet_id
FULL JOIN specializations ON vets.id = specializations.vet_id
FULL JOIN species ON species_id = species.id
WHERE specializations.species_id IS NULL;

-- 9) What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name AS reccomended_specialty FROM species
JOIN animals ON species.id = species_id
JOIN visits ON animals.id = animal_id
JOIN vets ON vets.id = vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.name) DESC LIMIT 1;
    -- same but showing times visited
    SELECT species.name AS reccomended_specialty, COUNT(*) AS times_visited FROM species
    JOIN animals ON species.id = species_id
    JOIN visits ON animals.id = animal_id
    JOIN vets ON vets.id = vet_id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name
    ORDER BY COUNT(*) DESC LIMIT 1;