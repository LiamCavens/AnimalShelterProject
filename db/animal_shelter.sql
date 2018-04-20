DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE trainers;
DROP TABLE owners;


CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE trainers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    fav_species VARCHAT(255)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    species VARCHAR(255),
    breed VARCHAR(255),
    age INT,
    adoptable BOOLEAN,
    picture VARCHAR(255)
);

CREATE TABLE adoptions (
    id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id) ON DELETE CASCADE,
    owner_id  INT REFERENCES owners(id) ON DELETE CASCADE,
    date VARCHAR(255)
);

