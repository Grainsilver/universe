--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    visible_from_earth boolean NOT NULL,
    has_zodiac_status boolean NOT NULL,
    number_of_stars integer,
    distance_indicator numeric
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_active_black_hole boolean NOT NULL,
    is_visible_from_earth boolean NOT NULL,
    num_stars integer,
    num_planets_estimate integer
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
    is_spherical boolean,
    has_atmosphere boolean,
    radius_km integer,
    orbital_period_days integer,
    composition text,
    age_in_millions integer,
    is_tidally_locked boolean
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
    planet_type text NOT NULL,
    distance_from_star numeric NOT NULL,
    radius_km integer,
    mass_earths integer,
    has_life boolean,
    is_spherical boolean,
    number_of_moons integer
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
    star_type text NOT NULL,
    mass numeric NOT NULL,
    age_in_millions integer,
    is_main_sequence boolean NOT NULL,
    has_planets boolean NOT NULL,
    temperature integer,
    luminosity integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 1, true, false, 7, 1344);
INSERT INTO public.constellation VALUES (2, 'Cassiopeia', 1, true, false, 5, 2300);
INSERT INTO public.constellation VALUES (3, 'Scorpius', 1, true, true, 10, 900);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, true, true, 250000, 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, true, true, 1000000000, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000, false, true, 40000000, 30000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 13000, 29000000, true, false, 80000000, 70000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 10000, 23000000, true, false, 50000000, 60000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 11000, 21000000, false, false, 100000000, 90000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, false, 1737, 27, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, false, 11, 0, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, false, 6, 1, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, false, 1821, 2, 'Volcanic', 4500, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, true, 1560, 4, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, true, 2634, 7, 'Ice/Rock', 4500, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, false, 2410, 17, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, true, 2575, 16, 'Hydrocarbon', 4500, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, true, false, 763, 5, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, true, false, 734, 79, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, true, true, 252, 1, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (12, 'Triton', 8, true, true, 1353, 6, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (13, 'Charon', 8, true, false, 606, 6, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, true, false, 198, 1, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, true, false, 578, 3, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, true, false, 584, 4, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (17, 'Titania', 7, true, false, 788, 9, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, true, false, 761, 14, 'Ice', 4500, true);
INSERT INTO public.moon VALUES (19, 'Naiad', 8, false, false, 33, 0, 'Rocky', 4500, true);
INSERT INTO public.moon VALUES (20, 'Thalassa', 8, false, false, 40, 0, 'Rocky', 4500, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1, 6371, 1, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 1.52, 3389, 0, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 0.72, 6051, 1, false, true, 0);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 'Terrestrial', 0.39, 2439, 0, false, true, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 5.2, 69911, 318, false, true, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 9.5, 58232, 95, false, true, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 19.8, 25362, 14, false, true, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 30.1, 24622, 17, false, true, 14);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 'Super Earth', 0.85, 15000, 10, true, true, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 6, 'Terrestrial', 0.05, 7000, 1, true, true, 1);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 6, 'Super Earth', 0.15, 9000, 3, true, true, 2);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 2, 'Hot Jupiter', 0.047, 96000, 220, false, true, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 1.0, 4600, true, true, 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-Type', 2.1, 300, true, true, 9940, 25);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 20.0, 10, false, true, 3500, 126000);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'Blue Supergiant', 21.0, 8, false, true, 12100, 120000);
INSERT INTO public.star VALUES (5, 'Vega', 3, 'A-Type', 2.3, 455, true, true, 9602, 40);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'Red Dwarf', 0.12, 4500, true, true, 3042, 0);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

