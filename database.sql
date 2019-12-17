CREATE TABLE "person" (
	id SERIAL PRIMARY KEY,
	name VARCHAR(25)
);

CREATE TABLE "hobby" (
	id SERIAL PRIMARY KEY,
	description VARCHAR(100)
);


-- JUNCTION TABLE, makes a replationship between both data sets
CREATE TABLE "person_hobby" (
	id SERIAL PRIMARY KEY,
	person_id INT REFERENCES "person", 
	hobby_id INT REFERENCES "hobby",
	skill INT
);

-- ADD SOME people
INSERT INTO "person" ("name")
VALUES ('Allen'),
	('Luke'),
	('Travis'),
	('Lucas'),
	('Josh'),
	('Dane'),
	('Myron');
	
-- ADD SOME hobbies
INSERT INTO "hobby" ("description")
VALUES ('Reading'),
	('Gaming'),
	('Sports'),
	('Singing'),
	('Duck Hunting'),
	('Deer Hunting'),
	('Bass Fishing'),
	('Poker'),
	('Song Writing'),
	('Bee Keeping'),
	('Rock Climbing'),
	('Falconry');
	
INSERT INTO "hobby" ("description")
VALUES ('Chewing Gum'),
	('Writing Code');
	
-- ADD RELATIONSHIPS
INSERT INTO "person_hobby" ("person_id", "hobby_id")
VALUES (1, 12),
	(1, 2),
	(1, 1),
	(2, 3),
	(2, 4),
	(2, 8),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 12),
	(4, 9),
	(4, 10),
	(5, 26),
	(5, 1),
	(5, 2),
	(6, 26),
	(6, 8),
	(6, 2),
	(7, 2),
	(7, 12),
	(7, 11);
	
SELECT "name" FROM "person";

SELECT * FROM "person_hobby";

-- MATCH PERSON and JUNCTION table
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id";

-- MATCH PERSON, JUNCTION, and HOBBY tables 
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id";

-- FILTER FOR A SINGLE PERSON
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id"
WHERE "person_hobby"."person_id" = 4;

-- FIND ALL THE BEE KEEPERS
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id"
WHERE "person_hobby"."hobby_id" = 10;

SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id"
WHERE "hobby"."id" = 10;

-- WHAT HAPPENS WHEN THERE IS NO MATCH
SELECT * FROM "person"
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id"
WHERE "hobby"."id" = 25;

-- AGGREGATES
SELECT count(*) FROM "person";
SELECT count(*) as "total_people" FROM "person";

-- Minimum
SELECT MIN("skill") FROM "person_hobby";

-- Maximum
SELECT MAX("skill") FROM "person_hobby";

-- Average Skill level
SELECT AVG("skill") FROM "person_hobby";


-- Sum of Skill level
SELECT SUM("skill") FROM "person_hobby";


-- Min and Max of Skill level
SELECT MIN("skill"), MAX("skill") FROM "person_hobby";
SELECT MIN("skill"), MAX("skill"), AVG("skill") FROM "person_hobby";

-- How many people have each hobby?
SELECT "hobby".description, count("person_hobby".hobby_id) FROM "hobby"
JOIN "person_hobby" ON "hobby".id = "person_hobby".hobby_id
GROUP BY "hobby".description;

