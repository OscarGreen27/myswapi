--
-- PostgreSQL database dump
--

\restrict 8UDwiNMbKCvzzy7U3Qr5WPADsV3deARInEAjJsnit7iZa8uJtWyVicieGc7jsk0

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: film; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA film;


ALTER SCHEMA film OWNER TO postgres;

--
-- Name: people; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA people;


ALTER SCHEMA people OWNER TO postgres;

--
-- Name: planet; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA planet;


ALTER SCHEMA planet OWNER TO postgres;

--
-- Name: starship; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA starship;


ALTER SCHEMA starship OWNER TO postgres;

--
-- Name: vehicle; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA vehicle;


ALTER SCHEMA vehicle OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: film; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.film (
    id integer CONSTRAINT films_id_not_null NOT NULL,
    title text,
    episode_id integer,
    opening_crawl text,
    director text,
    producer text,
    release_date date
);


ALTER TABLE film.film OWNER TO postgres;

--
-- Name: films_characters; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.films_characters (
    film_id integer NOT NULL,
    character_id integer NOT NULL
);


ALTER TABLE film.films_characters OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: film; Owner: postgres
--

CREATE SEQUENCE film.films_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE film.films_id_seq OWNER TO postgres;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: film; Owner: postgres
--

ALTER SEQUENCE film.films_id_seq OWNED BY film.film.id;


--
-- Name: films_planets; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.films_planets (
    film_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE film.films_planets OWNER TO postgres;

--
-- Name: films_species; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.films_species (
    film_id integer NOT NULL,
    specie_id integer NOT NULL
);


ALTER TABLE film.films_species OWNER TO postgres;

--
-- Name: films_starships; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.films_starships (
    film_id integer NOT NULL,
    starship_id integer NOT NULL
);


ALTER TABLE film.films_starships OWNER TO postgres;

--
-- Name: films_vehicles; Type: TABLE; Schema: film; Owner: postgres
--

CREATE TABLE film.films_vehicles (
    film_id integer NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE film.films_vehicles OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: people; Owner: postgres
--

CREATE TABLE people.people (
    id integer NOT NULL,
    name character varying,
    height character varying,
    mass character varying,
    hair_color character varying,
    skin_color character varying,
    eye_color character varying,
    birth_year character varying,
    gender character varying,
    homeworld_id integer
);


ALTER TABLE people.people OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: people; Owner: postgres
--

CREATE SEQUENCE people.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE people.people_id_seq OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: people; Owner: postgres
--

ALTER SEQUENCE people.people_id_seq OWNED BY people.people.id;


--
-- Name: people_species; Type: TABLE; Schema: people; Owner: postgres
--

CREATE TABLE people.people_species (
    person_id integer NOT NULL,
    specie_id integer NOT NULL
);


ALTER TABLE people.people_species OWNER TO postgres;

--
-- Name: people_starships; Type: TABLE; Schema: people; Owner: postgres
--

CREATE TABLE people.people_starships (
    person_id integer NOT NULL,
    starship_id integer NOT NULL
);


ALTER TABLE people.people_starships OWNER TO postgres;

--
-- Name: people_vehicles; Type: TABLE; Schema: people; Owner: postgres
--

CREATE TABLE people.people_vehicles (
    person_id integer NOT NULL,
    vehicle_id integer NOT NULL
);


ALTER TABLE people.people_vehicles OWNER TO postgres;

--
-- Name: planet; Type: TABLE; Schema: planet; Owner: postgres
--

CREATE TABLE planet.planet (
    id integer CONSTRAINT planets_id_not_null NOT NULL,
    name text,
    rotation_period text,
    orbital_period text,
    diameter text,
    climate text,
    gravity text,
    terrain text,
    surface_water text,
    population text
);


ALTER TABLE planet.planet OWNER TO postgres;

--
-- Name: planet_residents; Type: TABLE; Schema: planet; Owner: postgres
--

CREATE TABLE planet.planet_residents (
    planet_id integer NOT NULL,
    resident_id integer NOT NULL
);


ALTER TABLE planet.planet_residents OWNER TO postgres;

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: planet; Owner: postgres
--

CREATE SEQUENCE planet.planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE planet.planets_id_seq OWNER TO postgres;

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: planet; Owner: postgres
--

ALTER SEQUENCE planet.planets_id_seq OWNED BY planet.planet.id;


--
-- Name: starship; Type: TABLE; Schema: starship; Owner: postgres
--

CREATE TABLE starship.starship (
    id integer CONSTRAINT starships_id_not_null NOT NULL,
    name text,
    model text,
    manufacturer text,
    cost_in_credits text,
    length text,
    max_atmosphering_speed text,
    crew text,
    passengers text,
    cargo_capacity text,
    consumables text,
    hyperdrive_rating text,
    mglt text,
    starship_class text
);


ALTER TABLE starship.starship OWNER TO postgres;

--
-- Name: starships_id_seq; Type: SEQUENCE; Schema: starship; Owner: postgres
--

CREATE SEQUENCE starship.starships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE starship.starships_id_seq OWNER TO postgres;

--
-- Name: starships_id_seq; Type: SEQUENCE OWNED BY; Schema: starship; Owner: postgres
--

ALTER SEQUENCE starship.starships_id_seq OWNED BY starship.starship.id;


--
-- Name: vehicle; Type: TABLE; Schema: vehicle; Owner: postgres
--

CREATE TABLE vehicle.vehicle (
    id integer CONSTRAINT vehicles_id_not_null NOT NULL,
    name text,
    model text,
    manufacturer text,
    cost_in_credits text,
    length text,
    max_atmosphering_speed text,
    crew text,
    passengers text,
    cargo_capacity text,
    consumables text,
    vehicle_class text
);


ALTER TABLE vehicle.vehicle OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: vehicle; Owner: postgres
--

CREATE SEQUENCE vehicle.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE vehicle.vehicles_id_seq OWNER TO postgres;

--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: vehicle; Owner: postgres
--

ALTER SEQUENCE vehicle.vehicles_id_seq OWNED BY vehicle.vehicle.id;


--
-- Name: film id; Type: DEFAULT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film ALTER COLUMN id SET DEFAULT nextval('film.films_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people ALTER COLUMN id SET DEFAULT nextval('people.people_id_seq'::regclass);


--
-- Name: planet id; Type: DEFAULT; Schema: planet; Owner: postgres
--

ALTER TABLE ONLY planet.planet ALTER COLUMN id SET DEFAULT nextval('planet.planets_id_seq'::regclass);


--
-- Name: starship id; Type: DEFAULT; Schema: starship; Owner: postgres
--

ALTER TABLE ONLY starship.starship ALTER COLUMN id SET DEFAULT nextval('starship.starships_id_seq'::regclass);


--
-- Name: vehicle id; Type: DEFAULT; Schema: vehicle; Owner: postgres
--

ALTER TABLE ONLY vehicle.vehicle ALTER COLUMN id SET DEFAULT nextval('vehicle.vehicles_id_seq'::regclass);


--
-- Data for Name: film; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.film (id, title, episode_id, opening_crawl, director, producer, release_date) FROM stdin;
3	Return of the Jedi	6	Luke Skywalker has returned to\\r\\nhis home planet of Tatooine in\\r\\nan attempt to rescue his\\r\\nfriend Han Solo from the\\r\\nclutches of the vile gangster\\r\\nJabba the Hutt.\\r\\n\\r\\nLittle does Luke know that the\\r\\nGALACTIC EMPIRE has secretly\\r\\nbegun construction on a new\\r\\narmored space station even\\r\\nmore powerful than the first\\r\\ndreaded Death Star.\\r\\n\\r\\nWhen completed, this ultimate\\r\\nweapon will spell certain doom\\r\\nfor the small band of rebels\\r\\nstruggling to restore freedom\\r\\nto the galaxy...	Richard Marquand	Howard G. Kazanjian, George Lucas, Rick McCallum	1983-05-25
4	The Phantom Menace	1	Turmoil has engulfed the\nGalactic Republic. The taxation\nof trade routes to outlying star\nsystems is in dispute.\n\nHoping to resolve the matter\nwith a blockade of deadly\nbattleships, the greedy Trade\nFederation has stopped all\nshipping to the small planet\nof Naboo.\n\nWhile the Congress of the\nRepublic endlessly debates\nthis alarming chain of events,\nthe Supreme Chancellor has\nsecretly dispatched two Jedi\nKnights, the guardians of\npeace and justice in the\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19
5	Attack of the Clones	2	There is unrest in the Galactic\nSenate. Several thousand solar\nsystems have declared their\nintentions to leave the Republic.\n\nThis separatist movement,\nunder the leadership of the\nmysterious Count Dooku, has\nmade it difficult for the limited\nnumber of Jedi Knights to maintain \npeace and order in the galaxy.\n\nSenator Amidala, the former\nQueen of Naboo, is returning\nto the Galactic Senate to vote\non the critical issue of creating\nan ARMY OF THE REPUBLIC\nto assist the overwhelmed\nJedi....	George Lucas	Rick McCallum	2002-05-16
6	Revenge of the Sith	3	War! The Republic is crumbling\nunder attacks by the ruthless\nSith Lord, Count Dooku.\nThere are heroes on both sides.\nEvil is everywhere.\n\nIn a stunning move, the\nfiendish droid leader, General\nGrievous, has swept into the\nRepublic capital and kidnapped\nChancellor Palpatine, leader of\nthe Galactic Senate.\n\nAs the Separatist Droid Army\nattempts to flee the besieged\ncapital with their valuable\nhostage, two Jedi Knights lead a\ndesperate mission to rescue the\ncaptive Chancellor....	George Lucas	Rick McCallum	2005-05-19
2	The Empire Strikes Back	5	It is a dark time for the\\r\\nRebellion. Although the Death\\r\\nStar has been destroyed,\\r\\nImperial troops have driven the\\r\\nRebel forces from their hidden\\r\\nbase and pursued them across\\r\\nthe galaxy.\\r\\n\\r\\nEvading the dreaded Imperial\\r\\nStarfleet, a group of freedom\\r\\nfighters led by Luke Skywalker\\r\\nhas established a new secret\\r\\nbase on the remote ice world\\r\\nof Hoth.\\r\\n\\r\\nThe evil lord Darth Vader,\\r\\nobsessed with finding young\\r\\nSkywalker, has dispatched\\r\\nthousands of remote probes into\\r\\nthe far reaches of space....	Irvin Kershner	Gary Kurtz, Rick McCallum	1980-05-17
\.


--
-- Data for Name: films_characters; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.films_characters (film_id, character_id) FROM stdin;
2	1
2	2
2	3
2	4
2	5
2	10
2	13
2	14
2	18
2	20
2	21
2	22
2	23
2	24
2	25
2	26
3	1
3	2
3	3
3	4
3	5
3	10
3	13
3	14
3	16
3	18
3	20
3	21
3	22
3	25
3	27
3	28
3	29
3	30
3	31
3	45
4	2
4	3
4	10
4	11
4	16
4	20
4	21
4	32
4	33
4	34
4	35
4	36
4	37
4	38
4	39
4	40
4	41
4	42
4	43
4	44
4	46
4	47
4	48
4	49
4	50
4	51
4	52
4	53
4	54
4	55
4	56
4	57
4	58
4	59
5	2
5	3
5	6
5	7
5	10
5	11
5	20
5	21
5	22
5	33
5	35
5	36
5	40
5	43
5	46
5	51
5	52
5	53
5	58
5	59
5	60
5	61
5	62
5	63
5	64
5	65
5	66
5	67
5	68
5	69
5	70
5	71
5	72
5	73
5	74
5	75
5	76
5	77
5	78
5	82
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	10
6	11
6	12
6	13
6	20
6	21
6	33
6	35
6	46
6	51
6	52
6	53
6	54
6	55
6	56
6	58
6	63
6	64
6	67
6	68
6	75
6	78
6	79
6	80
6	81
6	82
6	83
\.


--
-- Data for Name: films_planets; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.films_planets (film_id, planet_id) FROM stdin;
6	1
6	2
6	5
6	8
6	9
6	12
6	13
6	14
6	15
6	16
6	17
6	18
6	19
2	4
2	5
2	6
2	27
3	1
3	5
3	7
3	8
3	9
4	1
4	8
4	9
5	1
5	8
5	9
5	10
5	11
\.


--
-- Data for Name: films_species; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.films_species (film_id, specie_id) FROM stdin;
5	1
5	2
5	6
5	12
5	13
5	15
5	28
5	29
5	30
5	31
5	32
5	33
5	34
5	35
6	1
6	2
6	3
6	6
6	15
6	19
6	20
6	23
6	24
6	25
6	26
6	27
6	28
6	29
6	30
6	33
6	34
6	35
6	36
6	37
4	1
4	2
4	6
4	11
4	12
4	13
4	14
4	15
4	16
4	17
4	18
4	19
4	20
4	21
4	22
4	23
4	24
4	25
4	26
4	27
3	1
3	2
3	3
3	5
3	6
3	8
3	9
3	10
3	15
2	1
2	2
2	3
2	6
2	7
\.


--
-- Data for Name: films_starships; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.films_starships (film_id, starship_id) FROM stdin;
2	3
2	10
2	11
2	12
2	15
2	17
2	21
2	22
2	23
3	2
3	3
3	10
3	11
3	12
3	15
3	17
3	22
3	23
3	27
3	28
3	29
4	31
4	32
4	39
4	40
4	41
5	21
5	32
5	39
5	43
5	47
5	48
5	49
5	52
5	58
6	2
6	32
6	48
6	59
6	61
6	63
6	64
6	65
6	66
6	68
6	74
6	75
\.


--
-- Data for Name: films_vehicles; Type: TABLE DATA; Schema: film; Owner: postgres
--

COPY film.films_vehicles (film_id, vehicle_id) FROM stdin;
2	8
2	14
2	16
2	18
2	19
2	20
3	8
3	16
3	18
3	19
3	24
3	25
3	26
3	30
4	33
4	34
4	35
4	36
4	37
4	38
4	42
5	4
5	44
5	45
5	46
5	50
5	51
5	53
5	54
5	55
5	56
5	57
6	33
6	50
6	53
6	56
6	60
6	62
6	67
6	69
6	70
6	71
6	72
6	73
6	76
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: people; Owner: postgres
--

COPY people.people (id, name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld_id) FROM stdin;
1	Luke Skywalker	172	77	blond	fair	blue	19BBY	male	1
2	C-3PO	167	75	n/a	gold	yellow	112BBY	n/a	1
3	R2-D2	96	32	n/a	white, blue	red	33BBY	n/a	8
4	Darth Vader	202	136	none	white	yellow	41.9BBY	male	1
5	Leia Organa	150	49	brown	light	brown	19BBY	female	2
6	Owen Lars	178	120	brown, grey	light	blue	52BBY	male	1
7	Beru Whitesun lars	165	75	brown	light	blue	47BBY	female	1
8	R5-D4	97	32	n/a	white, red	red	unknown	n/a	1
9	Biggs Darklighter	183	84	black	light	brown	24BBY	male	1
10	Obi-Wan Kenobi	182	77	auburn, white	fair	blue-gray	57BBY	male	20
11	Anakin Skywalker	188	84	blond	fair	blue	41.9BBY	male	1
12	Wilhuff Tarkin	180	unknown	auburn, grey	fair	blue	64BBY	male	21
13	Chewbacca	228	112	brown	unknown	blue	200BBY	male	14
14	Han Solo	180	80	brown	fair	brown	29BBY	male	22
15	Greedo	173	74	n/a	green	black	44BBY	male	23
16	Jabba Desilijic Tiure	175	1358	n/a	green-tan, brown	orange	600BBY	hermaphrodite	24
19	Jek Tono Porkins	180	110	brown	fair	blue	unknown	male	26
18	Wedge Antilles	170	77	brown	fair	hazel	21BBY	male	22
83	Tion Medon	206	80	none	grey	black	unknown	male	12
82	Sly Moore	178	48	none	pale	white	unknown	female	60
81	Raymus Antilles	188	79	brown	light	brown	unknown	male	2
80	Tarfful	234	136	brown	brown	blue	unknown	male	14
79	Grievous	216	159	none	brown, white	green, yellow	unknown	male	59
78	Shaak Ti	178	57	none	red, blue, white	black	unknown	female	58
77	San Hill	191	unknown	none	grey	gold	unknown	male	57
76	Wat Tambor	193	48	none	green, grey	unknown	unknown	male	56
75	R4-P17	96	unknown	none	silver, red	red, blue	unknown	female	28
74	Jocasta Nu	167	unknown	white	fair	blue	unknown	female	9
73	Taun We	213	unknown	none	grey	black	unknown	female	10
72	Lama Su	229	88	none	grey	black	unknown	male	10
71	Dexter Jettster	198	102	none	brown	yellow	unknown	male	55
69	Jango Fett	183	79	black	tan	brown	66BBY	male	53
68	Bail Prestor Organa	191	unknown	black	tan	brown	67BBY	male	2
67	Dooku	193	80	white	fair	brown	102BBY	male	52
66	Dormé	165	unknown	brown	light	brown	unknown	female	8
65	Barriss Offee	166	50	black	yellow	blue	40BBY	female	51
64	Luminara Unduli	170	56.2	black	yellow	blue	58BBY	female	51
63	Poggle the Lesser	183	80	none	green	yellow	unknown	male	11
62	Cliegg Lars	183	unknown	brown	fair	blue	82BBY	male	1
61	Cordé	157	unknown	brown	light	brown	unknown	female	8
60	Gregar Typho	185	85	black	dark	brown	unknown	male	8
59	Mas Amedda	196	unknown	none	blue	blue	unknown	male	50
58	Plo Koon	188	80	none	orange	black	22BBY	male	49
57	Yarael Poof	264	unknown	none	white	yellow	unknown	male	48
56	Saesee Tiin	188	unknown	none	pale	orange	unknown	male	47
55	Adi Gallia	184	50	none	dark	blue	unknown	female	9
54	Eeth Koth	171	unknown	black	brown	brown	unknown	male	45
53	Kit Fisto	196	87	none	green	black	unknown	male	44
52	Ki-Adi-Mundi	198	82	white	pale	yellow	92BBY	male	43
51	Mace Windu	188	84	none	dark	brown	72BBY	male	42
50	Ben Quadinaros	163	65	none	grey, green, yellow	orange	unknown	male	41
49	Gasgano	122	unknown	none	white, blue	black	unknown	male	40
48	Dud Bolt	94	45	none	blue, grey	yellow	unknown	male	39
47	Ratts Tyerel	79	15	none	grey, blue	unknown	unknown	male	38
46	Ayla Secura	178	55	none	blue	hazel	48BBY	female	37
45	Bib Fortuna	180	unknown	none	pale	pink	unknown	male	37
44	Darth Maul	175	80	none	red	yellow	54BBY	male	36
42	Quarsh Panaka	183	unknown	black	dark	brown	62BBY	male	8
40	Watto	137	unknown	black	blue, grey	yellow	unknown	male	34
39	Ric Olié	183	unknown	brown	fair	blue	unknown	male	8
38	Rugor Nass	206	unknown	none	green	orange	unknown	male	8
37	Roos Tarpals	224	82	none	grey	orange	unknown	male	8
36	Jar Jar Binks	196	66	none	orange	orange	52BBY	male	8
35	Padmé Amidala	185	45	brown	light	brown	46BBY	female	8
34	Finis Valorum	170	unknown	blond	fair	blue	91BBY	male	9
33	Nute Gunray	191	90	none	mottled green	red	unknown	male	18
32	Qui-Gon Jinn	193	89	brown	fair	blue	92BBY	male	28
31	Nien Nunb	160	68	none	grey	black	unknown	male	33
30	Wicket Systri Warrick	88	20	brown	brown	brown	8BBY	male	7
29	Arvel Crynyd	unknown	unknown	brown	fair	brown	unknown	male	28
28	Mon Mothma	150	unknown	auburn	fair	blue	48BBY	female	32
27	Ackbar	180	83	none	brown mottle	orange	41BBY	male	31
26	Lobot	175	79	none	light	blue	37BBY	male	6
25	Lando Calrissian	177	79	black	dark	brown	31BBY	male	30
24	Bossk	190	113	none	green	red	53BBY	male	29
23	IG-88	200	140	none	metal	red	15BBY	none	28
22	Boba Fett	183	78.2	black	fair	brown	31.5BBY	male	10
21	Palpatine	170	75	grey	pale	yellow	82BBY	male	8
20	Yoda	66	17	white	green	brown	896BBY	male	28
70	Zam Wesell	168	55	blonde	fair, green, yellow	yellow	unknown	female	54
43	Shmi Skywalker	163	unknown	black	fair	brown	72BBY	female	1
41	Sebulba	112	40	none	grey, red	orange	unknown	male	35
\.


--
-- Data for Name: people_species; Type: TABLE DATA; Schema: people; Owner: postgres
--

COPY people.people_species (person_id, specie_id) FROM stdin;
2	2
3	2
8	2
13	3
15	4
16	5
20	6
23	2
24	7
27	8
30	9
31	10
33	11
36	12
37	12
38	12
40	13
41	14
44	22
45	15
46	15
47	16
48	17
49	18
50	19
52	20
53	21
54	22
55	23
56	24
57	25
58	26
59	27
63	28
64	29
65	29
66	1
67	1
68	1
70	30
71	31
72	32
73	32
74	1
76	33
77	34
78	35
79	36
80	3
83	37
\.


--
-- Data for Name: people_starships; Type: TABLE DATA; Schema: people; Owner: postgres
--

COPY people.people_starships (person_id, starship_id) FROM stdin;
1	12
1	22
4	13
9	12
10	48
10	59
10	64
10	65
10	74
11	39
11	59
11	65
13	10
13	22
14	10
14	22
18	12
19	12
22	21
25	10
29	28
31	10
35	39
35	49
35	64
39	40
44	41
58	48
60	39
79	74
\.


--
-- Data for Name: people_vehicles; Type: TABLE DATA; Schema: people; Owner: postgres
--

COPY people.people_vehicles (person_id, vehicle_id) FROM stdin;
1	14
1	30
5	30
10	38
11	44
11	46
13	19
18	14
32	38
44	42
67	55
70	45
79	60
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: planet; Owner: postgres
--

COPY planet.planet (id, name, rotation_period, orbital_period, diameter, climate, gravity, terrain, surface_water, population) FROM stdin;
1	Tatooine	23	304	10465	arid	1 standard	desert	1	200000
2	Alderaan	24	364	12500	temperate	1 standard	grasslands, mountains	40	2000000000
3	Yavin IV	24	4818	10200	temperate, tropical	1 standard	jungle, rainforests	8	1000
4	Hoth	23	549	7200	frozen	1.1 standard	tundra, ice caves, mountain ranges	100	unknown
5	Dagobah	23	341	8900	murky	N/A	swamp, jungles	8	unknown
6	Bespin	12	5110	118000	temperate	1.5 (surface), 1 standard (Cloud City)	gas giant	0	6000000
7	Endor	18	402	4900	temperate	0.85 standard	forests, mountains, lakes	8	30000000
8	Naboo	26	312	12120	temperate	1 standard	grassy hills, swamps, forests, mountains	12	4500000000
9	Coruscant	24	368	12240	temperate	1 standard	cityscape, mountains	unknown	1000000000000
10	Kamino	27	463	19720	temperate	1 standard	ocean	100	1000000000
11	Geonosis	30	256	11370	temperate, arid	0.9 standard	rock, desert, mountain, barren	5	100000000000
12	Utapau	27	351	12900	temperate, arid, windy	1 standard	scrublands, savanna, canyons, sinkholes	0.9	95000000
13	Mustafar	36	412	4200	hot	1 standard	volcanoes, lava rivers, mountains, caves	0	20000
14	Kashyyyk	26	381	12765	tropical	1 standard	jungle, forests, lakes, rivers	60	45000000
15	Polis Massa	24	590	0	artificial temperate 	0.56 standard	airless asteroid	0	1000000
16	Mygeeto	12	167	10088	frigid	1 standard	glaciers, mountains, ice canyons	unknown	19000000
17	Felucia	34	231	9100	hot, humid	0.75 standard	fungus forests	unknown	8500000
18	Cato Neimoidia	25	278	0	temperate, moist	1 standard	mountains, fields, forests, rock arches	unknown	10000000
19	Saleucami	26	392	14920	hot	unknown	caves, desert, mountains, volcanoes	unknown	1400000000
20	Stewjon	unknown	unknown	0	temperate	1 standard	grass	unknown	unknown
21	Eriadu	24	360	13490	polluted	1 standard	cityscape	unknown	22000000000
22	Corellia	25	329	11000	temperate	1 standard	plains, urban, hills, forests	70	3000000000
23	Rodia	29	305	7549	hot	1 standard	jungles, oceans, urban, swamps	60	1300000000
24	Nal Hutta	87	413	12150	temperate	1 standard	urban, oceans, swamps, bogs	unknown	7000000000
25	Dantooine	25	378	9830	temperate	1 standard	oceans, savannas, mountains, grasslands	unknown	1000
26	Bestine IV	26	680	6400	temperate	unknown	rocky islands, oceans	98	62000000
27	Ord Mantell	26	334	14050	temperate	1 standard	plains, seas, mesas	10	4000000000
28	unknown	0	0	0	unknown	unknown	unknown	unknown	unknown
29	Trandosha	25	371	0	arid	0.62 standard	mountains, seas, grasslands, deserts	unknown	42000000
30	Socorro	20	326	0	arid	1 standard	deserts, mountains	unknown	300000000
31	Mon Cala	21	398	11030	temperate	1	oceans, reefs, islands	100	27000000000
32	Chandrila	20	368	13500	temperate	1	plains, forests	40	1200000000
33	Sullust	20	263	12780	superheated	1	mountains, volcanoes, rocky deserts	5	18500000000
34	Toydaria	21	184	7900	temperate	1	swamps, lakes	unknown	11000000
35	Malastare	26	201	18880	arid, temperate, tropical	1.56	swamps, deserts, jungles, mountains	unknown	2000000000
36	Dathomir	24	491	10480	temperate	0.9	forests, deserts, savannas	unknown	5200
37	Ryloth	30	305	10600	temperate, arid, subartic	1	mountains, valleys, deserts, tundra	5	1500000000
38	Aleen Minor	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
39	Vulpter	22	391	14900	temperate, artic	1	urban, barren	unknown	421000000
40	Troiken	unknown	unknown	unknown	unknown	unknown	desert, tundra, rainforests, mountains	unknown	unknown
41	Tund	48	1770	12190	unknown	unknown	barren, ash	unknown	0
42	Haruun Kal	25	383	10120	temperate	0.98	toxic cloudsea, plateaus, volcanoes	unknown	705300
43	Cerea	27	386	unknown	temperate	1	verdant	20	450000000
44	Glee Anselm	33	206	15600	tropical, temperate	1	lakes, islands, swamps, seas	80	500000000
45	Iridonia	29	413	unknown	unknown	unknown	rocky canyons, acid pools	unknown	unknown
46	Tholoth	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
47	Iktotch	22	481	unknown	arid, rocky, windy	1	rocky	unknown	unknown
48	Quermia	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
49	Dorin	22	409	13400	temperate	1	unknown	unknown	unknown
50	Champala	27	318	unknown	temperate	1	oceans, rainforests, plateaus	unknown	3500000000
51	Mirial	unknown	unknown	unknown	unknown	unknown	deserts	unknown	unknown
52	Serenno	unknown	unknown	unknown	unknown	unknown	rainforests, rivers, mountains	unknown	unknown
53	Concord Dawn	unknown	unknown	unknown	unknown	unknown	jungles, forests, deserts	unknown	unknown
54	Zolan	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
55	Ojom	unknown	unknown	unknown	frigid	unknown	oceans, glaciers	100	500000000
56	Skako	27	384	unknown	temperate	1	urban, vines	unknown	500000000000
57	Muunilinst	28	412	13800	temperate	1	plains, forests, hills, mountains	25	5000000000
58	Shili	unknown	unknown	unknown	temperate	1	cities, savannahs, seas, plains	unknown	unknown
59	Kalee	23	378	13850	arid, temperate, tropical	1	rainforests, cliffs, canyons, seas	unknown	4000000000
60	Umbara	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
\.


--
-- Data for Name: planet_residents; Type: TABLE DATA; Schema: planet; Owner: postgres
--

COPY planet.planet_residents (planet_id, resident_id) FROM stdin;
1	1
1	2
1	4
1	6
1	7
1	8
1	9
1	11
1	43
1	62
2	5
2	68
2	81
6	26
7	30
8	3
8	21
8	35
8	36
8	37
8	38
8	39
8	42
8	60
8	61
8	66
9	34
9	55
9	74
10	22
10	72
10	73
11	63
12	83
14	13
14	80
18	33
20	10
21	12
22	14
22	18
23	15
24	16
26	19
28	20
28	23
28	29
28	32
28	75
29	24
30	25
31	27
32	28
33	31
34	40
35	41
36	44
37	45
37	46
38	47
39	48
40	49
41	50
42	51
43	52
44	53
45	54
47	56
48	57
49	58
50	59
51	64
51	65
52	67
53	69
54	70
55	71
56	76
57	77
58	78
59	79
60	82
\.


--
-- Data for Name: starship; Type: TABLE DATA; Schema: starship; Owner: postgres
--

COPY starship.starship (id, name, model, manufacturer, cost_in_credits, length, max_atmosphering_speed, crew, passengers, cargo_capacity, consumables, hyperdrive_rating, mglt, starship_class) FROM stdin;
9	Death Star	DS-1 Orbital Battle Station	Imperial Department of Military Research, Sienar Fleet Systems	1000000000000	120000	n/a	342,953	843,342	1000000000000	3 years	4.0	10	Deep Space Mobile Battlestation
3	Star Destroyer	Imperial I-class Star Destroyer	Kuat Drive Yards	150000000	1,600	975	47,060	n/a	36000000	2 years	2.0	60	Star Destroyer
5	Sentinel-class landing craft	Sentinel-class landing craft	Sienar Fleet Systems, Cyngus Spaceworks	240000	38	1000	5	75	180000	1 month	1.0	70	landing craft
2	CR90 corvette	CR90 corvette	Corellian Engineering Corporation	3500000	150	950	30-165	600	3000000	1 year	2.0	60	corvette
13	TIE Advanced x1	Twin Ion Engine Advanced x1	Sienar Fleet Systems	unknown	9.2	1200	1	0	150	5 days	1.0	105	Starfighter
15	Executor	Executor-class star dreadnought	Kuat Drive Yards, Fondor Shipyards	1143350000	19000	n/a	279,144	38000	250000000	6 years	2.0	40	Star dreadnought
21	Slave 1	Firespray-31-class patrol and attack	Kuat Systems Engineering	unknown	21.5	1000	1	6	70000	1 month	3.0	70	Patrol craft
22	Imperial shuttle	Lambda-class T-4a shuttle	Sienar Fleet Systems	240000	20	850	6	20	80000	2 months	1.0	50	Armed government transport
23	EF76 Nebulon-B escort frigate	EF76 Nebulon-B escort frigate	Kuat Drive Yards	8500000	300	800	854	75	6000000	2 years	2.0	40	Escort ship
27	Calamari Cruiser	MC80 Liberty type Star Cruiser	Mon Calamari shipyards	104000000	1200	n/a	5400	1200	unknown	2 years	1.0	60	Star Cruiser
28	A-wing	RZ-1 A-wing Interceptor	Alliance Underground Engineering, Incom Corporation	175000	9.6	1300	1	0	40	1 week	1.0	120	Starfighter
29	B-wing	A/SF-01 B-wing starfighter	Slayn & Korpil	220000	16.9	950	1	0	45	1 week	2.0	91	Assault Starfighter
31	Republic Cruiser	Consular-class cruiser	Corellian Engineering Corporation	unknown	115	900	9	16	unknown	unknown	2.0	unknown	Space cruiser
32	Droid control ship	Lucrehulk-class Droid Control Ship	Hoersch-Kessel Drive, Inc.	unknown	3170	n/a	175	139000	4000000000	500 days	2.0	unknown	Droid control ship
11	Y-wing	BTL Y-wing	Koensayr Manufacturing	134999	14	1000km	2	0	110	1 week	1.0	80	assault starfighter
12	X-wing	T-65 X-wing	Incom Corporation	149999	12.5	1050	1	0	110	1 week	1.0	100	Starfighter
17	Rebel transport	GR-75 medium transport	Gallofree Yards, Inc.	unknown	90	650	6	90	19000000	6 months	4.0	20	Medium transport
39	Naboo fighter	N-1 starfighter	Theed Palace Space Vessel Engineering Corps	200000	11	1100	1	0	65	7 days	1.0	unknown	Starfighter
40	Naboo Royal Starship	J-type 327 Nubian royal starship	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	unknown	76	920	8	unknown	unknown	unknown	1.8	unknown	yacht
41	Scimitar	Star Courier	Republic Sienar Systems	55000000	26.5	1180	1	6	2500000	30 days	1.5	unknown	Space Transport
43	J-type diplomatic barge	J-type diplomatic barge	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	2000000	39	2000	5	10	unknown	1 year	0.7	unknown	Diplomatic barge
47	AA-9 Coruscant freighter	Botajef AA-9 Freighter-Liner	Botajef Shipyards	unknown	390	unknown	unknown	30000	unknown	unknown	unknown	unknown	freighter
48	Jedi starfighter	Delta-7 Aethersprite-class interceptor	Kuat Systems Engineering	180000	8	1150	1	0	60	7 days	1.0	unknown	Starfighter
49	H-type Nubian yacht	H-type Nubian yacht	Theed Palace Space Vessel Engineering Corps	unknown	47.9	8000	4	unknown	unknown	unknown	0.9	unknown	yacht
52	Republic Assault ship	Acclamator I-class assault ship	Rothana Heavy Engineering	unknown	752	unknown	700	16000	11250000	2 years	0.6	unknown	assault ship
58	Solar Sailer	Punworcca 116-class interstellar sloop	Huppla Pasa Tisc Shipwrights Collective	35700	15.2	1600	3	11	240	7 days	1.5	unknown	yacht
59	Trade Federation cruiser	Providence-class carrier/destroyer	Rendili StarDrive, Free Dac Volunteers Engineering corps.	125000000	1088	1050	600	48247	50000000	4 years	1.5	unknown	capital ship
61	Theta-class T-2c shuttle	Theta-class T-2c shuttle	Cygnus Spaceworks	1000000	18.5	2000	5	16	50000	56 days	1.0	unknown	transport
63	Republic attack cruiser	Senator-class Star Destroyer	Kuat Drive Yards, Allanteen Six shipyards	59000000	1137	975	7400	2000	20000000	2 years	1.0	unknown	star destroyer
64	Naboo star skiff	J-type star skiff	Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated	unknown	29.2	1050	3	3	unknown	unknown	0.5	unknown	yacht
65	Jedi Interceptor	Eta-2 Actis-class light interceptor	Kuat Systems Engineering	320000	5.47	1500	1	0	60	2 days	1.0	unknown	starfighter
66	arc-170	Aggressive Reconnaissance-170 starfighte	Incom Corporation, Subpro Corporation	155000	14.5	1000	3	0	110	5 days	1.0	100	starfighter
68	Banking clan frigte	Munificent-class star frigate	Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries	57000000	825	unknown	200	unknown	40000000	2 years	1.0	unknown	cruiser
74	Belbullab-22 starfighter	Belbullab-22 starfighter	Feethan Ottraw Scalable Assemblies	168000	6.71	1100	1	0	140	7 days	6	unknown	starfighter
75	V-wing	Alpha-3 Nimbus-class V-wing starfighter	Kuat Systems Engineering	102500	7.9	1050	1	0	60	15 hours	1.0	unknown	starfighter
10	Millennium Falcon	YT-1300 light freighter	Corellian Engineering Corporation	100000	34.37	1050	4	6	100000	2 months	0.5	75	Light freighter
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: vehicle; Owner: postgres
--

COPY vehicle.vehicle (id, name, model, manufacturer, cost_in_credits, length, max_atmosphering_speed, crew, passengers, cargo_capacity, consumables, vehicle_class) FROM stdin;
18	AT-AT	All Terrain Armored Transport	Kuat Drive Yards, Imperial Department of Military Research	unknown	20	60	5	40	1000	unknown	assault walker
16	TIE bomber	TIE/sa bomber	Sienar Fleet Systems	unknown	7.8	850	1	0	none	2 days	space/planetary bomber
14	Snowspeeder	t-47 airspeeder	Incom corporation	unknown	4.5	650	2	0	10	none	airspeeder
8	TIE/LN starfighter	Twin Ion Engine/Ln Starfighter	Sienar Fleet Systems	unknown	6.4	1200	1	0	65	2 days	starfighter
7	X-34 landspeeder	X-34 landspeeder	SoroSuub Corporation	10550	3.4 	250	1	1	5	unknown	repulsorcraft
6	T-16 skyhopper	T-16 skyhopper	Incom Corporation	14500	10.4 	1200	1	1	50	0	repulsorcraft
4	Sand Crawler	Digger Crawler	Corellia Mining Corporation	150000	36.8 	30	46	30	50000	2 months	wheeled
42	Sith speeder	FC-20 speeder bike	Razalon	4000	1.5	180	1	0	2	unknown	speeder
19	AT-ST	All Terrain Scout Transport	Kuat Drive Yards, Imperial Department of Military Research	unknown	2	90	2	0	200	none	walker
20	Storm IV Twin-Pod cloud car	Storm IV Twin-Pod	Bespin Motors	75000	7	1500	2	0	10	1 day	repulsorcraft
24	Sail barge	Modified Luxury Sail Barge	Ubrikkian Industries Custom Vehicle Division	285000	30	100	26	500	2000000	Live food tanks	sail barge
25	Bantha-II cargo skiff	Bantha-II	Ubrikkian Industries	8000	9.5	250	5	16	135000	1 day	repulsorcraft cargo skiff
26	TIE/IN interceptor	Twin Ion Engine Interceptor	Sienar Fleet Systems	unknown	9.6	1250	1	0	75	2 days	starfighter
30	Imperial Speeder Bike	74-Z speeder bike	Aratech Repulsor Company	8000	3	360	1	1	4	1 day	speeder
33	Vulture Droid	Vulture-class droid starfighter	Haor Chall Engineering, Baktoid Armor Workshop	unknown	3.5	1200	0	0	0	none	starfighter
44	Zephyr-G swoop bike	Zephyr-G swoop bike	Mobquet Swoops and Speeders	5750	3.68	350	1	1	200	none	repulsorcraft
45	Koro-2 Exodrive airspeeder	Koro-2 Exodrive airspeeder	Desler Gizh Outworld Mobility Corporation	unknown	6.6	800	1	1	80	unknown	airspeeder
46	XJ-6 airspeeder	XJ-6 airspeeder	Narglatch AirTech prefabricated kit	unknown	6.23	720	1	1	unknown	unknown	airspeeder
50	LAAT/i	Low Altitude Assault Transport/infrantry	Rothana Heavy Engineering	unknown	17.4	620	6	30	170	unknown	gunship
51	LAAT/c	Low Altitude Assault Transport/carrier	Rothana Heavy Engineering	unknown	28.82	620	1	0	40000	unknown	gunship
53	AT-TE	All Terrain Tactical Enforcer	Rothana Heavy Engineering, Kuat Drive Yards	unknown	13.2	60	6	36	10000	21 days	walker
54	SPHA	Self-Propelled Heavy Artillery	Rothana Heavy Engineering	unknown	140	35	25	30	500	7 days	walker
55	Flitknot speeder	Flitknot speeder	Huppla Pasa Tisc Shipwrights Collective	8000	2	634	1	0	unknown	unknown	speeder
56	Neimoidian shuttle	Sheathipede-class transport shuttle	Haor Chall Engineering	unknown	20	880	2	6	1000	7 days	transport
57	Geonosian starfighter	Nantex-class territorial defense	Huppla Pasa Tisc Shipwrights Collective	unknown	9.8	20000	1	0	unknown	unknown	starfighter
60	Tsmeu-6 personal wheel bike	Tsmeu-6 personal wheel bike	Z-Gomot Ternbuell Guppat Corporation	15000	3.5	330	1	1	10	none	wheeled walker
62	Emergency Firespeeder	Fire suppression speeder	unknown	unknown	unknown	unknown	2	unknown	unknown	unknown	fire suppression ship
67	Droid tri-fighter	tri-fighter	Colla Designs, Phlac-Arphocc Automata Industries	20000	5.4	1180	1	0	0	none	droid starfighter
69	Oevvaor jet catamaran	Oevvaor jet catamaran	Appazanna Engineering Works	12125	15.1	420	2	2	50	3 days	airspeeder
70	Raddaugh Gnasp fluttercraft	Raddaugh Gnasp fluttercraft	Appazanna Engineering Works	14750	7	310	2	0	20	none	air speeder
71	Clone turbo tank	HAVw A6 Juggernaut	Kuat Drive Yards	350000	49.4	160	20	300	30000	20 days	wheeled walker
72	Corporate Alliance tank droid	NR-N99 Persuader-class droid enforcer	Techno Union	49000	10.96	100	0	4	none	none	droid tank
73	Droid gunship	HMP droid gunship	Baktoid Fleet Ordnance, Haor Chall Engineering	60000	12.3	820	0	0	0	none	airspeeder
76	AT-RT	All Terrain Recon Transport	Kuat Drive Yards	40000	3.2	90	1	0	20	1 day	walker
38	Tribubble bongo	Tribubble bongo	Otoh Gunga Bongameken Cooperative	unknown	15	85	1	2	1600	unknown	submarine
34	Multi-Troop Transport	Multi-Troop Transport	Baktoid Armor Workshop	138000	31	35	4	112	12000	unknown	repulsorcraft
35	Armored Assault Tank	Armoured Assault Tank	Baktoid Armor Workshop	unknown	9.75	55	4	6	unknown	unknown	repulsorcraft
36	Single Trooper Aerial Platform	Single Trooper Aerial Platform	Baktoid Armor Workshop	2500	2	400	1	0	none	none	repulsorcraft
37	C-9979 landing craft	C-9979 landing craft	Haor Chall Engineering	200000	210	587	140	284	1800000	1 day	landing craft
\.


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: film; Owner: postgres
--

SELECT pg_catalog.setval('film.films_id_seq', 15, true);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: people; Owner: postgres
--

SELECT pg_catalog.setval('people.people_id_seq', 84, true);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: planet; Owner: postgres
--

SELECT pg_catalog.setval('planet.planets_id_seq', 64, true);


--
-- Name: starships_id_seq; Type: SEQUENCE SET; Schema: starship; Owner: postgres
--

SELECT pg_catalog.setval('starship.starships_id_seq', 75, false);


--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: vehicle; Owner: postgres
--

SELECT pg_catalog.setval('vehicle.vehicles_id_seq', 76, false);


--
-- Name: films_characters film_characters_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_characters
    ADD CONSTRAINT film_characters_pkey PRIMARY KEY (film_id, character_id);


--
-- Name: films_planets film_planets_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_planets
    ADD CONSTRAINT film_planets_pkey PRIMARY KEY (film_id, planet_id);


--
-- Name: films_starships film_starships_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_starships
    ADD CONSTRAINT film_starships_pkey PRIMARY KEY (film_id, starship_id);


--
-- Name: film films_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.film
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: films_species films_species_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_species
    ADD CONSTRAINT films_species_pkey PRIMARY KEY (film_id, specie_id);


--
-- Name: films_vehicles films_vehicles_pkey; Type: CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_vehicles
    ADD CONSTRAINT films_vehicles_pkey PRIMARY KEY (film_id, vehicle_id);


--
-- Name: people people_pk; Type: CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people
    ADD CONSTRAINT people_pk PRIMARY KEY (id);


--
-- Name: people_species people_species_pkey; Type: CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_species
    ADD CONSTRAINT people_species_pkey PRIMARY KEY (person_id, specie_id);


--
-- Name: people_starships people_starships_pkey; Type: CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_starships
    ADD CONSTRAINT people_starships_pkey PRIMARY KEY (person_id, starship_id);


--
-- Name: people_vehicles people_vehicles_pkey; Type: CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_vehicles
    ADD CONSTRAINT people_vehicles_pkey PRIMARY KEY (person_id, vehicle_id);


--
-- Name: planet_residents planet_residents_pkey; Type: CONSTRAINT; Schema: planet; Owner: postgres
--

ALTER TABLE ONLY planet.planet_residents
    ADD CONSTRAINT planet_residents_pkey PRIMARY KEY (planet_id, resident_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: planet; Owner: postgres
--

ALTER TABLE ONLY planet.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (id);


--
-- Name: starship starships_pkey; Type: CONSTRAINT; Schema: starship; Owner: postgres
--

ALTER TABLE ONLY starship.starship
    ADD CONSTRAINT starships_pkey PRIMARY KEY (id);


--
-- Name: vehicle vehicles_pkey; Type: CONSTRAINT; Schema: vehicle; Owner: postgres
--

ALTER TABLE ONLY vehicle.vehicle
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: films_characters fk_chracter_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_characters
    ADD CONSTRAINT fk_chracter_id FOREIGN KEY (character_id) REFERENCES people.people(id) ON DELETE CASCADE;


--
-- Name: films_characters fk_film_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_characters
    ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES film.film(id) ON DELETE CASCADE;


--
-- Name: films_species fk_film_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_species
    ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES film.film(id) ON DELETE CASCADE;


--
-- Name: films_starships fk_film_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_starships
    ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES film.film(id) ON DELETE CASCADE;


--
-- Name: films_vehicles fk_film_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_vehicles
    ADD CONSTRAINT fk_film_id FOREIGN KEY (film_id) REFERENCES film.film(id) ON DELETE CASCADE;


--
-- Name: films_planets fk_films_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_planets
    ADD CONSTRAINT fk_films_id FOREIGN KEY (film_id) REFERENCES film.film(id) ON DELETE CASCADE;


--
-- Name: films_planets fk_planets_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_planets
    ADD CONSTRAINT fk_planets_id FOREIGN KEY (planet_id) REFERENCES planet.planet(id) ON DELETE CASCADE;


--
-- Name: films_species fk_species_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_species
    ADD CONSTRAINT fk_species_id FOREIGN KEY (specie_id) REFERENCES specie.specie(id) ON DELETE CASCADE;


--
-- Name: films_starships fk_starship_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_starships
    ADD CONSTRAINT fk_starship_id FOREIGN KEY (starship_id) REFERENCES starship.starship(id) ON DELETE CASCADE;


--
-- Name: films_vehicles fk_vehicles_id; Type: FK CONSTRAINT; Schema: film; Owner: postgres
--

ALTER TABLE ONLY film.films_vehicles
    ADD CONSTRAINT fk_vehicles_id FOREIGN KEY (vehicle_id) REFERENCES vehicle.vehicle(id) ON DELETE CASCADE;


--
-- Name: people fk_homeworld; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people
    ADD CONSTRAINT fk_homeworld FOREIGN KEY (homeworld_id) REFERENCES planet.planet(id);


--
-- Name: people_species fk_persone_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_species
    ADD CONSTRAINT fk_persone_id FOREIGN KEY (person_id) REFERENCES people.people(id) ON DELETE CASCADE;


--
-- Name: people_starships fk_persone_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_starships
    ADD CONSTRAINT fk_persone_id FOREIGN KEY (person_id) REFERENCES people.people(id) ON DELETE CASCADE;


--
-- Name: people_vehicles fk_persone_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_vehicles
    ADD CONSTRAINT fk_persone_id FOREIGN KEY (person_id) REFERENCES people.people(id) ON DELETE CASCADE;


--
-- Name: people_species fk_specie_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_species
    ADD CONSTRAINT fk_specie_id FOREIGN KEY (specie_id) REFERENCES specie.specie(id) ON DELETE CASCADE;


--
-- Name: people_starships fk_starship_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_starships
    ADD CONSTRAINT fk_starship_id FOREIGN KEY (starship_id) REFERENCES starship.starship(id) ON DELETE SET NULL;


--
-- Name: people_vehicles fk_vehicle_id; Type: FK CONSTRAINT; Schema: people; Owner: postgres
--

ALTER TABLE ONLY people.people_vehicles
    ADD CONSTRAINT fk_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicle.vehicle(id) ON DELETE SET NULL;


--
-- Name: planet_residents fk_people; Type: FK CONSTRAINT; Schema: planet; Owner: postgres
--

ALTER TABLE ONLY planet.planet_residents
    ADD CONSTRAINT fk_people FOREIGN KEY (resident_id) REFERENCES people.people(id) ON DELETE CASCADE;


--
-- Name: planet_residents fk_planet; Type: FK CONSTRAINT; Schema: planet; Owner: postgres
--

ALTER TABLE ONLY planet.planet_residents
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES planet.planet(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 8UDwiNMbKCvzzy7U3Qr5WPADsV3deARInEAjJsnit7iZa8uJtWyVicieGc7jsk0

