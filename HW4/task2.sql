USE pet_database;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

INSERT IGNORE INTO petPet (petname, owner, species, gender, birth, death) 
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '2020-10-15', 'birth', '5 kittens, 2 male');

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

UPDATE petPet 
SET death = '2020-09-01' 
WHERE petname = 'Puffball';

DELETE FROM petPet 
WHERE owner = 'Harold' AND species = 'dog';

SET SQL_SAFE_UPDATES = 1;
