/* Populate database with sample data. */

-------------------------------------------
-- 1st task
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, true, '10.23');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, true, '8');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, false, '15.04');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, '11');

-------------------------------------------
-- 2nd task
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 8, 2020', 0, false, '11');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, true, '-5.7');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 2, 1993', 3, false, '-12.13');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, true, '-45');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 7, 2005', 7, true, '20.4');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, true, '17');
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
('Ditto', 'May 14, 2022', 4, true, '22');

-------------------------------------------
-- 3rd task
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 34);

INSERT INTO species (name)
VALUES ('Pokemon');
INSERT INTO species (name)
VALUES ('Digimon');

-- Update species column to digimon for all animals that name ends in "mon".
UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon';
-- Update species column to pokemon for all animals without species.
UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon';

-- Update owners column with given values.
-- Sam Smith owns Agumon.
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon';
UPDATE animals
SET owner_id = 2
WHERE name = 'Pikachu';
-- Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon';
UPDATE animals
SET owner_id = 3
WHERE name = 'Plantmon';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander';
UPDATE animals
SET owner_id = 4
WHERE name = 'Squirtle';
UPDATE animals
SET owner_id = 4
WHERE name = 'Blossom';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon';
UPDATE animals
SET owner_id = 5
WHERE name = 'Boarmon';

-------------------------------------------
-- 4th task
-- populate vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Jack Harkness', 38, 'Jun 8, 2008');
-- populate specializations tale
INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1);
INSERT INTO specializations (vet_id, species_id)
VALUES (3, 1);
INSERT INTO specializations (vet_id, species_id)
VALUES (3, 2);
INSERT INTO specializations (vet_id, species_id)
VALUES (4, 2);

-- populate visits tale
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (1, 4, 'May 24, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (3, 4, 'Jul 22, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (4, 1, 'Feb 2, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 2, 'Jan 5, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 2, 'Mar 8, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 2, 'May 14, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 3, 'May 4, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (4, 11, 'Feb 24, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 5, 'Dec 21, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (1, 5, 'Aug 10, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 5, 'Apr 7, 2021');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (3, 6, 'Sep 29, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (4, 7, 'Oct 3, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (4, 7, 'Nov 4, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 8, 'Jan 24, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 8, 'May 15, 2019');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 8, 'Feb 27, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (2, 8, 'Aug 3, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (3, 9, 'May 24, 2020');
INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES (1, 9, 'Jan 11, 2021');