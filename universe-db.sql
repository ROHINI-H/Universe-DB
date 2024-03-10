--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(30),
    description character varying(200),
    distance_in_million_light_years numeric,
    constellation text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_discovered integer,
    mean_radius numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    distance_from_sun numeric,
    mass numeric,
    have_moon boolean,
    age_in_billion_years numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft_mission (
    spacecraft_mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_date date,
    launch_vehicle character varying(100),
    orbit_type character varying(50),
    application character varying(70)
);


ALTER TABLE public.spacecraft_mission OWNER TO freecodecamp;

--
-- Name: spacecraft_mission_spacecraft_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_mission_spacecraft_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_mission_spacecraft_mission_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_mission_spacecraft_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_mission_spacecraft_mission_id_seq OWNED BY public.spacecraft_mission.spacecraft_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric,
    temperature_in_kelvin integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft_mission spacecraft_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft_mission ALTER COLUMN spacecraft_mission_id SET DEFAULT nextval('public.spacecraft_mission_spacecraft_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral Galaxy', 'It is one of the few visible to the unaided eye, appearing as a milky blur', 2.6, 'Andromeda');
INSERT INTO public.galaxy VALUES (2, 'Black eye Galaxy', 'Spiral Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus.', 17, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 'Spiral Galaxy', 'The galaxy is large and very bright.', 12, 'Ursa Major');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 'Lenticular ring Galaxy', 'It is one of the most complicated structures', 500, 'Sculptor');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'Starburst Galaxy', 'It is five times brighter than the whole Milky Way', 12, 'Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Cygnus A', 'Elliptical Galaxy', 'This is the second brightest radio source in the entire sky.', 730, 'Cygnus');
INSERT INTO public.galaxy VALUES (7, 'Hercules A', 'Supergiant Elliptical Galaxy', 'It is a bright astronomical radio source in the constellation.', 2100, 'Hercules');
INSERT INTO public.galaxy VALUES (8, 'ARP-MADORE', 'Peculiar Galaxy', 'It is a rare example of an interacting galaxy pair in the southern hemisphere.', 297, NULL);
INSERT INTO public.galaxy VALUES (9, 'Milky way', 'Barred spiral galaxy', ' The Milky Way is one of the largest galaxies in the group, second to the Andromeda Galaxy.', 2, 'Sagittarius');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1609, 1738, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 11.267, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 6.2, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 1821.6, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 1560.8, 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 1892, 83.5, 5);
INSERT INTO public.moon VALUES (7, 'Himalia', 1904, 69.8, 5);
INSERT INTO public.moon VALUES (8, 'Ananke', 1951, 14, 5);
INSERT INTO public.moon VALUES (9, 'Leda', 1974, 10, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 1979, 49.3, 5);
INSERT INTO public.moon VALUES (11, 'Themisto', 1975, 4, 5);
INSERT INTO public.moon VALUES (12, 'Euporie', 2001, 1, 5);
INSERT INTO public.moon VALUES (13, 'Hegemone', 2003, 1.5, 5);
INSERT INTO public.moon VALUES (14, 'Carpo', 2003, 1.5, 5);
INSERT INTO public.moon VALUES (15, 'Dia', 2000, 2, 5);
INSERT INTO public.moon VALUES (16, 'Valetudo', 2016, 0.5, 5);
INSERT INTO public.moon VALUES (17, 'Pandia', 2017, 1.5, 5);
INSERT INTO public.moon VALUES (18, 'Ersa', 2018, 1.5, 5);
INSERT INTO public.moon VALUES (19, 'Mimas', 1789, 198.2, 6);
INSERT INTO public.moon VALUES (20, 'Dione', 1684, 561.4, 6);
INSERT INTO public.moon VALUES (21, 'Rhea', 1672, 763.8, 6);
INSERT INTO public.moon VALUES (22, 'Titan', 1655, 2574.73, 6);
INSERT INTO public.moon VALUES (23, 'Iapetus', 1671, 735.6, 6);
INSERT INTO public.moon VALUES (24, 'Phoebe', 1898, 106.5, 6);
INSERT INTO public.moon VALUES (25, 'Helene', 1980, 17.6, 6);
INSERT INTO public.moon VALUES (26, 'Atlas', 1980, 15.1, 6);
INSERT INTO public.moon VALUES (27, 'Pandora', 1980, 40.7, 6);
INSERT INTO public.moon VALUES (28, 'Pan', 1981, 14.2, 6);
INSERT INTO public.moon VALUES (29, 'Skathi', 2000, 4, 6);
INSERT INTO public.moon VALUES (30, 'Daphnis', 2005, 3.8, 6);
INSERT INTO public.moon VALUES (31, 'Bestla', 2004, 3.5, 6);
INSERT INTO public.moon VALUES (32, 'Beli', 2004, 3, 6);
INSERT INTO public.moon VALUES (33, 'Ariel', 1851, 578.9, 7);
INSERT INTO public.moon VALUES (34, 'Titania', 1787, 788.9, 7);
INSERT INTO public.moon VALUES (35, 'Oberon', 1787, 761.4, 7);
INSERT INTO public.moon VALUES (36, 'Miranda', 1948, 235.8, 7);
INSERT INTO public.moon VALUES (37, 'Juliet', 1986, 46.8, 7);
INSERT INTO public.moon VALUES (38, 'Rosalind', 1986, 36, 7);
INSERT INTO public.moon VALUES (39, 'Belinda', 1986, 40.3, 7);
INSERT INTO public.moon VALUES (40, 'Triton', 1846, 1353.4, 8);
INSERT INTO public.moon VALUES (41, 'Thalassa', 1989, 41, 8);
INSERT INTO public.moon VALUES (42, 'Larissa', 1981, 97, 8);
INSERT INTO public.moon VALUES (43, 'Sao', 2002, 22, 8);
INSERT INTO public.moon VALUES (44, 'Hippocamp', 2013, 17.4, 8);
INSERT INTO public.moon VALUES (45, 'PA-99-N2 C Moon', 1999, 63, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0.39, 0.06, false, 4.503, 8);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0.72, 0.82, false, 3, 8);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 1, true, 4.543, 8);
INSERT INTO public.planet VALUES (4, 'Mars', false, 1.52, 0.11, true, 4.603, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 5.20, 317.89, true, 4.603, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 9.54, 95.15, true, 4.503, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 19.2, 14.54, true, 4.5, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 30.06, 17.23, true, 4.503, 8);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', false, 2185247, 2015.5, true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'SWEEPS-11', true, 27723.3, 3082.820, false, 5.3, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', true, 4.25, 1.07, false, 4.853, 2);
INSERT INTO public.planet VALUES (12, 'COCONUTS-2b', false, 35.5, 2034, false, 0.8, 9);
INSERT INTO public.planet VALUES (13, 'Pollux b', false, 33.78, 731.2, false, 0.724, 10);


--
-- Data for Name: spacecraft_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft_mission VALUES (1, 'INSAT-3DS', '2024-02-17', 'GSLV-F14/INSAT-3DS Mission', 'GTO', 'Climate and Environment');
INSERT INTO public.spacecraft_mission VALUES (2, 'XPoSat', '2024-01-01', 'PSLV-C58/XPoSat Mission', 'Low-inclination circular orbit', 'X-ray Astronomy');
INSERT INTO public.spacecraft_mission VALUES (3, 'Chandrayaan-3', '2023-07-14', 'LVM3 M4 / Chandrayaan-3 Mission', 'Lunar', 'Planetary Observation');
INSERT INTO public.spacecraft_mission VALUES (4, 'NVS-01', '2023-05-29', 'GSLV-F12/NVS-01 Mission', NULL, 'Navigation');
INSERT INTO public.spacecraft_mission VALUES (5, 'RISAT-2B', '2019-05-22', 'PSLV-C46 Mission', 'LEO', 'Disaster Management System');
INSERT INTO public.spacecraft_mission VALUES (6, 'Microsat', '2018-01-12', 'PSLV-C40/Cartosat-2 Series Satellite Mission', 'SSPO', 'Experimental');
INSERT INTO public.spacecraft_mission VALUES (7, 'Astrosat', '2015-09-28', 'PSLV-C30/AstroSat MISSION', NULL, 'Space Science');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mirach', 199, 3842, 1);
INSERT INTO public.star VALUES (2, 'Ross 248', 10.8, 2799, 1);
INSERT INTO public.star VALUES (3, 'Deneb', 2616, 8525, 6);
INSERT INTO public.star VALUES (4, 'Albireo', 433.8, 4383, 6);
INSERT INTO public.star VALUES (5, 'Delta Cygni', 166.3, 10500, 6);
INSERT INTO public.star VALUES (6, 'Epsilon herculis', 154.9, 10200, 7);
INSERT INTO public.star VALUES (7, 'NGC 6181', 102272855.35, NULL, 7);
INSERT INTO public.star VALUES (8, 'Sun', 1, 5772, 9);
INSERT INTO public.star VALUES (9, 'L 34-26', 35, 2439, 2);
INSERT INTO public.star VALUES (10, 'Pollux', 33.72, 4865, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 45, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: spacecraft_mission_spacecraft_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_mission_spacecraft_mission_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft_mission spacecraft_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft_mission
    ADD CONSTRAINT spacecraft_mission_name_key UNIQUE (name);


--
-- Name: spacecraft_mission spacecraft_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft_mission
    ADD CONSTRAINT spacecraft_mission_pkey PRIMARY KEY (spacecraft_mission_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
