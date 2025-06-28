CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

--1 number Problem
INSERT INTO rangers (ranger_id,name, region)
VALUES (4,'Derek Fox', 'Coastal Plains'); 

SELECT * FROM rangers;





CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,           
    common_name VARCHAR(100) NOT NULL,      
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE,                  
    conservation_status VARCHAR(50)          
);
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
SELECT * FROM species;

-- DROP TABLE species;


--2 number Problems
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;




CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,             
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id),
    species_id INT NOT NULL REFERENCES species(species_id),
    sighting_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    location VARCHAR(150) NOT NULL,      
    notes TEXT     -- Optional additional observations
);
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge',        '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area',     '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings;

--3 Number Problems
SELECT location FROM sightings WHERE location LIKE '%Pass%' ;


--4 Number Problems
SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sightings
FROM rangers
LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name
ORDER BY rangers.name;


--5 Number Problems
SELECT species.common_name FROM species
LEFT JOIN sightings on species.species_id = sightings.species_id
 WHERE sightings.species_id IS NULL;

 --6 Number Problems
 SELECT species.common_name, sightings.sighting_time, rangers.name 
 FROM sightings

 JOIN species ON sightings.species_id = species.species_id
 JOIN rangers on sightings.ranger_id = rangers.ranger_id

 ORDER BY sightings.sighting_time DESC
 LIMIT 2;



--7 number Problems
UPDATE species 
SET status = 'Historic'
WHERE YEAR(discovery_date)=< 1800;

UPDATE species 
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;


--8 number Problems
SELECT 
  sighting_id,
  CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) >= 12 AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;

--9 number Problems
DELETE FROM rangers
WHERE ranger_id NOT IN (
  SELECT DISTINCT ranger_id FROM sightings
);

