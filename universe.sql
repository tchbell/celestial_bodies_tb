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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed integer NOT NULL,
    is_periodic boolean NOT NULL,
    tail_length numeric(10,2),
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer NOT NULL,
    age numeric(10,2),
    has_black_hole boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_tidally_locked boolean NOT NULL,
    radius integer NOT NULL,
    orbit_distance numeric(10,2),
    composition text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    diameter integer NOT NULL,
    gravity numeric(8,2),
    atmosphere text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    mass numeric(15,3),
    is_active boolean NOT NULL,
    type text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 70, true, 24.00, 'Ice and dust');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 52, false, 35.00, 'Ice and rock');
INSERT INTO public.comet VALUES (3, 'Enckes Comet', 69, true, 10.50, 'Ice and dust');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.51, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 10.00, true, 'Nearest spiral galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 12.00, false, 'Third largest in Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 9.00, true, 'Bright, unbarred spiral.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76000, 8.00, false, 'Interacting spiral galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 9.50, false, 'Face-on spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 1737, 384400.00, 'Rock');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 11, 9377.00, 'Rock');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 6, 23460.00, 'Rock');
INSERT INTO public.moon VALUES (4, 'Europa', 5, true, 1560, 670900.00, 'Ice');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, true, 2634, 1070400.00, 'Rock/Ice');
INSERT INTO public.moon VALUES (6, 'Io', 5, true, 1821, 421700.00, 'Sulfur');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 2410, 1883000.00, 'Ice/Rock');
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 2575, 1221870.00, 'Nitrogen');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 252, 237948.00, 'Ice');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 198, 185539.00, 'Ice');
INSERT INTO public.moon VALUES (11, 'Miranda', 8, true, 235, 129390.00, 'Ice/Rock');
INSERT INTO public.moon VALUES (12, 'Ariel', 8, true, 578, 191020.00, 'Ice/Rock');
INSERT INTO public.moon VALUES (13, 'Umbriel', 8, true, 584, 266300.00, 'Ice/Rock');
INSERT INTO public.moon VALUES (14, 'Triton', 7, true, 1353, 354800.00, 'Ice/Nitrogen');
INSERT INTO public.moon VALUES (15, 'Charon', 4, true, 606, 19591.00, 'Ice');
INSERT INTO public.moon VALUES (16, 'Nix', 4, true, 49, 48694.00, 'Ice');
INSERT INTO public.moon VALUES (17, 'Hydra', 4, true, 43, 64738.00, 'Ice');
INSERT INTO public.moon VALUES (18, 'Proxima Centauri b Moon', 9, true, 1000, 384000.00, 'Unknown');
INSERT INTO public.moon VALUES (19, 'Kepler-186f Moon', 10, true, 1500, 500000.00, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Gliese 581g Moon', 12, true, 800, 300000.00, 'Rock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12742, 9.81, 'Nitrogen-Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 6779, 3.71, 'CO2');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 12104, 8.87, 'CO2');
INSERT INTO public.planet VALUES (4, 'Mercury', 1, false, 4879, 3.70, 'None');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 139820, 24.79, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 116460, 10.44, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, false, 49244, 11.15, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (8, 'Uranus', 1, false, 50724, 8.87, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (9, 'Proxima b', 6, false, 11400, 11.20, 'Unknown');
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 2, false, 13000, 9.50, 'Unknown');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, false, 143000, 10.30, 'Hydrogen');
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 2, false, 14700, 12.00, 'CO2');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.000, true, 'G-type main-sequence');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 2.020, true, 'A-type main-sequence');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 11.600, true, 'Red supergiant');
INSERT INTO public.star VALUES (4, 'Rigel', 2, 12100, 21.000, true, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'Vega', 2, 9602, 2.100, true, 'A-type main-sequence');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 3042, 0.123, true, 'Red dwarf');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

