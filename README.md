# Universe-DB.sql
I have build a database of celestial bodies using PostgreSQL in a virtual Linux machine using Gitpod. 

In this Database Universe, I have created 5 tables named galaxy, star, planet, moon and spacecraft_mission. Each table have a primary key that will automatically increment follow the naming convention table_name_id. 

GALAXY
                                                Table "public.galaxy"
|             Column              |          Type          | Collation | Nullable |                  Default                  |
|---------------------------------|------------------------|-----------|----------|-------------------------------------------|
| galaxy_id                       | integer                |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                            | character varying(50)  |           | not null |                                           |
| galaxy_type                     | character varying(30)  |           |          |                                           |
| description                     | character varying(200) |           |          |                                           |
| distance_in_million_light_years | numeric                |           |          |                                           |
| constellation                   | text                   |           |          |                                           |

Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

PLANET
                                               Table "public.planet"
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

Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

STAR
                                              Table "public.star"

|        Column         |         Type          | Collation | Nullable |                Default                |
|-----------------------|-----------------------|-----------|----------|---------------------------------------|
| star_id               | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name                  | character varying(50) |           | not null |                                       |
| distance_from_earth   | numeric               |           |          |                                       |
| temperature_in_kelvin | integer               |           |          |                                       |
| galaxy_id             | integer               |           |          |                                       |
 
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

MOON
                                           Table "public.moon"

|     Column      |         Type          | Collation | Nullable |                Default                |
|-----------------|-----------------------|-----------|----------|---------------------------------------|
| moon_id         | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name            | character varying(50) |           | not null |                                       |
| year_discovered | integer               |           |          |                                       |
| mean_radius     | numeric               |           |          |                                       |
| planet_id       | integer               |           |          |                                       |

Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

SPACECRAFT_MISSION
                                                      Table "public.spacecraft_mission"
|        Column         |          Type          | Collation | Nullable |                              Default                              |
|-----------------------|------------------------|-----------|----------|-------------------------------------------------------------------|
| spacecraft_mission_id | integer                |           | not null | nextval('spacecraft_mission_spacecraft_mission_id_seq'::regclass) |
| name                  | character varying(50)  |           | not null |                                                                   |
| launch_date           | date                   |           |          |                                                                   |
| launch_vehicle        | character varying(100) |           |          |                                                                   |
| orbit_type            | character varying(50)  |           |          |                                                                   |
| application           | character varying(70)  |           |          |                                                                   |

Indexes:
    "spacecraft_mission_pkey" PRIMARY KEY, btree (spacecraft_mission_id)
    "spacecraft_mission_name_key" UNIQUE CONSTRAINT, btree (name)

# Student-db.sql



To rebuild the database:
psql -U postgres < students.sql
