# 👩🏻‍💻 FreeCodeCamp Project: Build a Celestial Bodies Database

## 🗒️Description
This repository contains my solution to the FreeCodeCamp "Build a Celestial Bodies Database" challenge as part of **Relational Database Course**. For this project, I have build a database of celestial bodies using PostgreSQL.

## 🏆FCC Challenge Link
If you want to try this challenge, follow this link:   
https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database

## 📜Instructions
For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering `psql --username=freecodecamp --dbname=postgres` in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

**Don't forget to connect to your database after you create it 😄**

Here's some ideas for other column and table names: `description`, `has_life`, `is_spherical`, `age_in_millions_of_years`, `planet_types`, `galaxy_types`, `distance_from_earth`.

**Notes:**   
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering `pg_dump -cC --inserts -U freecodecamp universe > universe.sql` in a bash terminal (not the psql one). It will save the commands to rebuild your database in `universe.sql`. The file will be located where the command was entered. If it's anything inside the `project` folder, the file will be saved in the VM. You can rebuild the database by entering `psql -U postgres < universe.sql` in a terminal where the `.sql` file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the `universe.sql` file in a public repository and submit the URL to it on freeCodeCamp.org.

### Complete the tasks below
- You should create a database named `universe`
- Be sure to connect to your database with `\c universe`. Then, you should add tables named `galaxy`, `star`, `planet`, and `moon`
- Each table should have a primary key
- Each primary key should automatically increment
- Each table should have a `name` column
- You should use the `INT` data type for at least two columns that are not a primary or foreign key
- You should use the `NUMERIC` data type at least once
- You should use the `TEXT` data type at least once
- You should use the `BOOLEAN` data type on at least two columns
- Each "star" should have a foreign key that references one of the rows in `galaxy`
- Each "planet" should have a foreign key that references one of the rows in `star`
- Each "moon" should have a foreign key that references one of the rows in `planet`
- Your database should have at least five tables
- Each table should have at least three rows
- The `galaxy` and `star` tables should each have at least six rows
- The `planet` table should have at least 12 rows
- The `moon` table should have at least 20 rows
- Each table should have at least three columns
- The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns
- At least two columns per table should not accept `NULL` values
- At least one column from each table should be required to be `UNIQUE`
- All columns named `name` should be of type `VARCHAR`
- Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key column named `moon_id`
- Each foreign key column should have the same name as the column it is referencing

## 🎇Final message after Completion
Congratulations on completing "Celestial Bodies Database"!  
You've reached the end of the road...

# Universe-DB.sql
I have build a database of celestial bodies using PostgreSQL in a virtual Linux machine using Gitpod. 

In this Database Universe, I have created 5 tables named galaxy, star, planet, moon and spacecraft_mission. Each table have a primary key that will automatically increment follow the naming convention table_name_id. 

## GALAXY
                                                Table "public.galaxy"
|             Column              |          Type          | Collation | Nullable |                  Default                  |
|---------------------------------|------------------------|-----------|----------|-------------------------------------------|
| galaxy_id                       | integer                |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                            | character varying(50)  |           | not null |                                           |
| galaxy_type                     | character varying(30)  |           |          |                                           |
| description                     | character varying(200) |           |          |                                           |
| distance_in_million_light_years | numeric                |           |          |                                           |
| constellation                   | text                   |           |          |                                           |

### Indexes:   
    1. "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    2. "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
    
#### Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

## PLANET
                                               `Table "public.planet"`
|        Column        |         Type          | Collation | Nullable |                  Default                  |
|----------------------|-----------------------|-----------|----------|-------------------------------------------|
| planet_id            | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name                 | character varying(50) |           | not null |                                           |
| has_life             | boolean               |           |          |                                           |
| distance_from_sun    | numeric               |           |          |                                           |
| mass                 | numeric               |           |          |                                           |
| have_moon            | boolean               |           |          |                                           |
| age_in_billion_years | numeric               |           |          |                                           |
| star_id              | integer               |           |          |                                           |

### Indexes:   
    1. "planet_pkey" PRIMARY KEY, btree (planet_id)
    2. "planet_name_key" UNIQUE CONSTRAINT, btree (name)
#### Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
#### Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

## STAR
                                              `Table "public.star"`

|        Column         |         Type          | Collation | Nullable |                Default                |
|-----------------------|-----------------------|-----------|----------|---------------------------------------|
| star_id               | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                  | character varying(50) |           | not null |                                       |
| distance_from_earth   | numeric               |           |          |                                       |
| temperature_in_kelvin | integer               |           |          |                                       |
| galaxy_id             | integer               |           |          |                                       |
 
### Indexes:   
    1. "star_pkey" PRIMARY KEY, btree (star_id)
    2. "star_name_key" UNIQUE CONSTRAINT, btree (name)
#### Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
#### Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

## MOON
                                           `Table "public.moon"`

|     Column      |         Type          | Collation | Nullable |                Default                |
|-----------------|-----------------------|-----------|----------|---------------------------------------|
| moon_id         | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name            | character varying(50) |           | not null |                                       |
| year_discovered | integer               |           |          |                                       |
| mean_radius     | numeric               |           |          |                                       |
| planet_id       | integer               |           |          |                                       |

### Indexes:   
    1. "moon_pkey" PRIMARY KEY, btree (moon_id)
    2. "moon_name_key" UNIQUE CONSTRAINT, btree (name)
#### Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

## SPACECRAFT_MISSION
                                                      `Table "public.spacecraft_mission"`
|        Column         |          Type          | Collation | Nullable |                              Default                              |
|-----------------------|------------------------|-----------|----------|-------------------------------------------------------------------|
| spacecraft_mission_id | integer                |           | not null | nextval('spacecraft_mission_spacecraft_mission_id_seq'::regclass) |
| name                  | character varying(50)  |           | not null |                                                                   |
| launch_date           | date                   |           |          |                                                                   |
| launch_vehicle        | character varying(100) |           |          |                                                                   |
| orbit_type            | character varying(50)  |           |          |                                                                   |
| application           | character varying(70)  |           |          |                                                                   |

### Indexes:   
    1. "spacecraft_mission_pkey" PRIMARY KEY, btree (spacecraft_mission_id)
    2. "spacecraft_mission_name_key" UNIQUE CONSTRAINT, btree (name)
    
## 🔏License
This project is licensed under the MIT License.

## 🙇🏻‍♀️Acknowledgments
Special thanks to FreeCodeCamp for providing the challenge and resources to learn relational database.

## 🚀Connect with me
If you'd like to learn more about my work or connect professionally, you can find me on LinkedIn: www.linkedin.com/in/rohini-h
