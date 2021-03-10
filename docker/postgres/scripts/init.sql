--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

DROP DATABASE IF EXISTS bb;

CREATE DATABASE bb;

\c bb;

DROP SCHEMA public;

CREATE SCHEMA public;

SET search_path TO public;

ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    user_id integer NOT NULL,
    game_data_numbers json NOT NULL,
    game_data_timer integer NOT NULL,
    hash character(16)
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: team_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_user (
    id bigint NOT NULL,
    team_id bigint NOT NULL,
    user_id bigint NOT NULL,
    role character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.team_user OWNER TO postgres;

--
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_user_id_seq OWNER TO postgres;

--
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_user_id_seq OWNED BY public.team_user.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    personal_team boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: team_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_user ALTER COLUMN id SET DEFAULT nextval('public.team_user_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, user_id, game_data_numbers, game_data_timer, hash) FROM stdin;
1	1	[1,2,3,4,5,6,7,8,9,10,15,11,13,14,0,12]	2	\N
2	1	[1,2,3,4,5,6,7,8,9,10,15,11,13,14,0,12]	9	wyoON5tincmq1v_
3	1	[1,2,3,4,5,6,7,8,9,10,15,11,13,14,0,12]	2	nF6ZR5ApbK4wgB_
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2014_10_12_200000_add_two_factor_columns_to_users_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2020_05_21_100000_create_teams_table	1
7	2020_05_21_200000_create_team_user_table	1
8	2020_11_07_131951_create_sessions_table	1
11	2020_11_08_183157_add_game_table_fmeimof2m	2
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	1	token-name	bc6c3cc74647856e3ca767442bf69bf405e5f88a6707df54c98b35f1efd90cb2	["*"]	\N	2020-11-07 15:38:25	2020-11-07 15:38:25
2	App\\Models\\User	1	token-name	a81684747088293ae0b86094bb28f7e96c31a30da7386bf0e0e5d8b05e3f7742	["*"]	\N	2020-11-07 15:38:35	2020-11-07 15:38:35
3	App\\Models\\User	1	token-name	0b06007288b5feaeadec4907928975d081960ecb4d6bdaf799cf7aab8ee02148	["*"]	\N	2020-11-07 15:38:36	2020-11-07 15:38:36
4	App\\Models\\User	1	token-name	db9d66ed3a2812ec481cd3cd55b8307ae961931810080c3393d2b2d874953714	["*"]	\N	2020-11-07 15:40:20	2020-11-07 15:40:20
37	App\\Models\\User	1	token-name	1a9d880d3b98389bf6817f46184ff164853aad7f7c57b5be3934bfd230223391	["*"]	2020-11-07 16:27:40	2020-11-07 16:27:35	2020-11-07 16:27:40
5	App\\Models\\User	1	token-name	9e722fd572bfa3e7ab3a636821e978691636740d8f440e7f86b9fe0d5fc54b9b	["*"]	2020-11-07 15:48:28	2020-11-07 15:48:14	2020-11-07 15:48:28
6	App\\Models\\User	1	token-name	c737f12bbd7aecb5823cb13d5703cc5f6923157e4d31aa1341550280f91f3311	["*"]	2020-11-07 15:49:11	2020-11-07 15:49:03	2020-11-07 15:49:11
7	App\\Models\\User	1	token-name	5f4f68c3cd8a6a01b6be494d04c45652134cbb47473fe410ace1bb5afbdc8384	["*"]	2020-11-07 15:49:36	2020-11-07 15:49:34	2020-11-07 15:49:36
28	App\\Models\\User	1	token-name	b5ac0e7e4791175bd892220ab35c99c3470648f392f27b401fc110c9fedb7d17	["*"]	2020-11-07 16:23:17	2020-11-07 16:21:37	2020-11-07 16:23:17
8	App\\Models\\User	1	token-name	239dca739810b840b4c1aa49500a1046673835f04ee2785cae498a393c099483	["*"]	2020-11-07 15:51:27	2020-11-07 15:50:26	2020-11-07 15:51:27
34	App\\Models\\User	1	token-name	b03c516b1ad1b04e13fe59ea8feaaa9255714350c59e059921f8f35c7ac878a9	["*"]	2020-11-07 16:26:27	2020-11-07 16:25:42	2020-11-07 16:26:27
9	App\\Models\\User	1	token-name	fc7a9f74e5a1e33850129c49da75f81033bf9bec18aa59548bfaaf7f69147c05	["*"]	2020-11-07 15:56:33	2020-11-07 15:55:43	2020-11-07 15:56:33
29	App\\Models\\User	1	token-name	6d7655d380f756a4ec0b8a07c6de70078b2f14776174fdd2c3346b7031177ae4	["*"]	2020-11-07 16:23:26	2020-11-07 16:23:18	2020-11-07 16:23:26
10	App\\Models\\User	1	token-name	961612f0332b9c5fb879fa7c86e04c27297d4c279b5a087e40909c7cc74e06b7	["*"]	2020-11-07 15:59:41	2020-11-07 15:56:56	2020-11-07 15:59:41
11	App\\Models\\User	1	token-name	6fa9d92ff4c47207dabe2ace07e36d4c3da9c657423a8e17db392cbf680b9b7b	["*"]	2020-11-07 16:15:06	2020-11-07 16:08:49	2020-11-07 16:15:06
12	App\\Models\\User	1	token-name	b55317a77cef2dc1507341c75d7e0a626ee656a362df6681e3a066f922b25778	["*"]	2020-11-07 16:15:08	2020-11-07 16:15:07	2020-11-07 16:15:08
13	App\\Models\\User	1	token-name	8b813d0b85d2b7f6c2a1517a04f5eecede539561ca11390434fcda31cf3cb46d	["*"]	\N	2020-11-07 16:15:18	2020-11-07 16:15:18
14	App\\Models\\User	1	token-name	571aeb81720eefa4993c1b32300ff1a2bd3cbb62ccc9aef608b56956c7dbee16	["*"]	2020-11-07 16:15:39	2020-11-07 16:15:37	2020-11-07 16:15:39
15	App\\Models\\User	1	token-name	6b87c4789e1f04ea4e0d1d0bbd3b8af6d0b79c4947f60732995e91fc0a9929c6	["*"]	\N	2020-11-07 16:16:36	2020-11-07 16:16:36
30	App\\Models\\User	1	token-name	793df75630bc4c2178e7de339ba3933b0627968e7f3a40ce68dbebe382e681b6	["*"]	2020-11-07 16:23:39	2020-11-07 16:23:38	2020-11-07 16:23:39
16	App\\Models\\User	1	token-name	3bb90972026b5ae517f5e840bfe2674385df3be5e0284002f37ce0b6d58c985e	["*"]	2020-11-07 16:19:13	2020-11-07 16:19:11	2020-11-07 16:19:13
17	App\\Models\\User	1	token-name	2e7f42ac875c4c379cb3faccb43e5ad2a5d7f41c9590422bc4822c1ea1140686	["*"]	2020-11-07 16:20:30	2020-11-07 16:20:27	2020-11-07 16:20:30
18	App\\Models\\User	1	token-name	05104a15a4842d3b3b5f937516bcc1ddf245221153195ad26327c213b1de6be8	["*"]	\N	2020-11-07 16:20:46	2020-11-07 16:20:46
19	App\\Models\\User	1	token-name	df2ed83979b311233ce0885523589148e32e6da08451bfb8da991d9c4f860441	["*"]	\N	2020-11-07 16:20:48	2020-11-07 16:20:48
20	App\\Models\\User	1	token-name	81b7bf01bb70e97f02dc330121c6207087549e0f2b92bf66c625efc60b983ebc	["*"]	\N	2020-11-07 16:20:49	2020-11-07 16:20:49
21	App\\Models\\User	1	token-name	366ffd31c2e390db6a7fa7c6d3612dc60ce680f5e6a5450b64dd8dd873c5ab3f	["*"]	\N	2020-11-07 16:20:50	2020-11-07 16:20:50
22	App\\Models\\User	1	token-name	815af595afdc24e358792a46e91ed69765735c39995ac0d94324807f7d4a4314	["*"]	\N	2020-11-07 16:21:09	2020-11-07 16:21:09
23	App\\Models\\User	1	token-name	06ef709180dfe249be33d24f5a71a4fdf7442629a29502c31639c71340887758	["*"]	\N	2020-11-07 16:21:24	2020-11-07 16:21:24
24	App\\Models\\User	1	token-name	685a07725732bae86d545ebb9f68f8bec531ee4f2648bf147572a866efd4558f	["*"]	\N	2020-11-07 16:21:25	2020-11-07 16:21:25
25	App\\Models\\User	1	token-name	52e1d6e642fe01461cd288b05406aaadde97155d22694b79ca0d777a935e6128	["*"]	\N	2020-11-07 16:21:25	2020-11-07 16:21:25
26	App\\Models\\User	1	token-name	478621ea9f01df15d117e73de4666d41daaae648bc279e1f93956ecc0befeddb	["*"]	\N	2020-11-07 16:21:26	2020-11-07 16:21:26
27	App\\Models\\User	1	token-name	9ec4d0b3967c2cdde4d158acac21bb052db4866c73f1211b64aa5bc427c4f9cb	["*"]	\N	2020-11-07 16:21:35	2020-11-07 16:21:35
31	App\\Models\\User	1	token-name	5decab06412165484a8bdcd4089944e3e77ed69fbd77c318ad5dbae495d45707	["*"]	2020-11-07 16:23:59	2020-11-07 16:23:57	2020-11-07 16:23:59
32	App\\Models\\User	1	token-name	75931e46239609550fb4ab6839fafb4ecc4629b0645324a8c8e2b69258c44690	["*"]	2020-11-07 16:24:31	2020-11-07 16:24:28	2020-11-07 16:24:31
33	App\\Models\\User	1	token-name	831fb91fdf8b5318382c003946282bcf137b716d0a85562cd4565ee713b25fa7	["*"]	2020-11-07 16:24:51	2020-11-07 16:24:47	2020-11-07 16:24:51
36	App\\Models\\User	1	token-name	4f245b2a617882387f7a2c1f56d02623263b0e70e02249a7f197b680d6f8135a	["*"]	2020-11-07 16:27:05	2020-11-07 16:27:03	2020-11-07 16:27:05
40	App\\Models\\User	1	token-name	61ba7c087ecf78ce62048fa1b2252b614957736c9086a367ff7b0ebd6e704b2c	["*"]	2020-11-07 16:30:39	2020-11-07 16:30:37	2020-11-07 16:30:39
35	App\\Models\\User	1	token-name	24cceab9889d4337349d409a8e6da64a667ad160fabc4e86e86549fd19741926	["*"]	2020-11-07 16:27:02	2020-11-07 16:26:29	2020-11-07 16:27:02
38	App\\Models\\User	1	token-name	3fd10ed9cb3d56e891cf1e29e274eaac0b42ad3e3c289bfb80a04e0dbb75dc5f	["*"]	2020-11-07 16:27:58	2020-11-07 16:27:55	2020-11-07 16:27:58
39	App\\Models\\User	1	token-name	4778a417509b3338025050ee4878ef6ef4753be110c25d76f254d4cc92cb5f6e	["*"]	2020-11-07 16:30:18	2020-11-07 16:30:16	2020-11-07 16:30:18
41	App\\Models\\User	1	token-name	8c10727bcc5c2fd6ab15731e9a3e55ecbfddf230af11ca3d024c5ef359e6481c	["*"]	2020-11-07 16:30:42	2020-11-07 16:30:40	2020-11-07 16:30:42
45	App\\Models\\User	1	token-name	6bcba5b99d7822bc8201fd2a53045034cbee5e239d07d97ba785490875af3dfe	["*"]	2020-11-07 16:32:31	2020-11-07 16:32:25	2020-11-07 16:32:31
42	App\\Models\\User	1	token-name	52d9d1995eb81a0f331e8b3fde7d4510ab7b9e594f29763066e4abb5bc4b5075	["*"]	2020-11-07 16:32:01	2020-11-07 16:31:58	2020-11-07 16:32:01
43	App\\Models\\User	1	token-name	d8e1faf89befeb9b251355813538b05e14302c16d4c5cebad9d10db9a0c9e318	["*"]	\N	2020-11-07 16:32:07	2020-11-07 16:32:07
44	App\\Models\\User	1	token-name	bcf71b9bae0ce7ec1d1379511c1599f590a2636d2cab723e1e236278810bcb0c	["*"]	\N	2020-11-07 16:32:12	2020-11-07 16:32:12
46	App\\Models\\User	1	token-name	316d85d67a3fbd10f567dcc15deb037e7262c44c843f71a08445302c4d275e7d	["*"]	2020-11-07 16:32:41	2020-11-07 16:32:40	2020-11-07 16:32:41
67	App\\Models\\User	1	token-name	2e087e8719c0c3dec3a1e51ce6f73e316b06b9e1a0f85609caf3a70400767c1b	["*"]	2020-11-07 16:55:29	2020-11-07 16:55:28	2020-11-07 16:55:29
47	App\\Models\\User	1	token-name	dc74fd62472f42a53a5200787f607d8ad9ac155d659c6197fb3c88a2b248df97	["*"]	2020-11-07 16:32:48	2020-11-07 16:32:46	2020-11-07 16:32:48
48	App\\Models\\User	1	token-name	9421fb4608a09ce1967c03afb1ad0f76b8eacfc8dcc556dc36f40eebe2015b1d	["*"]	2020-11-07 16:33:18	2020-11-07 16:33:17	2020-11-07 16:33:18
49	App\\Models\\User	1	token-name	ee2c450adcc94b3ab2bbf8e2b52b770ba47c3a397a5e8663c7c4c2971cb5455d	["*"]	2020-11-07 16:33:42	2020-11-07 16:33:41	2020-11-07 16:33:42
50	App\\Models\\User	1	token-name	92dd8805e65aa152288cc261369b97c06ce8c45ba68538209d37e89440515a4d	["*"]	2020-11-07 16:34:29	2020-11-07 16:34:28	2020-11-07 16:34:29
51	App\\Models\\User	1	token-name	05ddaa484a750ea55af49835d72b54007b5ddb19796cc2f70d7d480aaff85299	["*"]	2020-11-07 16:38:31	2020-11-07 16:38:29	2020-11-07 16:38:31
52	App\\Models\\User	1	token-name	f082ac51f39a2aec90bdcafecb1b83e8ad5346dff73b7ca713b54d9781a33c79	["*"]	2020-11-07 16:41:09	2020-11-07 16:41:07	2020-11-07 16:41:09
53	App\\Models\\User	1	token-name	0d8839080f6790d4200097cd44bfca57d0391391ffa6ae3615508cf1c20b18c4	["*"]	2020-11-07 16:41:38	2020-11-07 16:41:36	2020-11-07 16:41:38
54	App\\Models\\User	1	token-name	213b6615e9ef242d60a77a9dcb57388494b0f179e0f986c90005425034f321ba	["*"]	2020-11-07 16:42:25	2020-11-07 16:42:24	2020-11-07 16:42:25
55	App\\Models\\User	1	token-name	f1f3e1d6628261da40355bee80608b0ff274b053ea8fede52e811c6889e78583	["*"]	2020-11-07 16:45:27	2020-11-07 16:45:25	2020-11-07 16:45:27
56	App\\Models\\User	1	token-name	1fbd3ea344f47161a32857981ec205a16851aee1df1b42ea0da62e9dce26e9d7	["*"]	2020-11-07 16:45:46	2020-11-07 16:45:44	2020-11-07 16:45:46
57	App\\Models\\User	1	token-name	505da021d271f0a6180cc801695c30bae03acd193d45f1730bd4e794f9b21630	["*"]	2020-11-07 16:46:34	2020-11-07 16:46:33	2020-11-07 16:46:34
58	App\\Models\\User	1	token-name	7d76d6a5fea497d65e8365eb6a4ba25ac1d80cfd6a0bb48102c1386981addcd4	["*"]	2020-11-07 16:46:43	2020-11-07 16:46:42	2020-11-07 16:46:43
59	App\\Models\\User	1	token-name	3a26a290c8dba5c3a475d4174599232e5d595a1b6ad03bdae541b4515ac0dd67	["*"]	2020-11-07 16:47:10	2020-11-07 16:47:08	2020-11-07 16:47:10
60	App\\Models\\User	1	token-name	d0d1607e7030d40e2b19d6ef1a4a8a576ead041957739f1590509bb3b69f994a	["*"]	2020-11-07 16:47:36	2020-11-07 16:47:34	2020-11-07 16:47:36
61	App\\Models\\User	1	token-name	6c78b6d87f98fdc46ebe6069a8139366f66b785fcdffd552dd62a87db2c54d25	["*"]	2020-11-07 16:47:41	2020-11-07 16:47:40	2020-11-07 16:47:41
62	App\\Models\\User	1	token-name	52206d49cbf706acbabafd812e40793f54fe11f4a9594370b6a2f8641cdd24a2	["*"]	2020-11-07 16:48:16	2020-11-07 16:48:14	2020-11-07 16:48:16
63	App\\Models\\User	1	token-name	02414a9c8a592362a5f01387ff5a3589956e786fa3d0ca39665e2c967cefea63	["*"]	2020-11-07 16:48:32	2020-11-07 16:48:31	2020-11-07 16:48:32
64	App\\Models\\User	1	token-name	5f68db0f1d5a1b3670a855c3512087ace04176337aa4dac7422b3a29d2fe22ba	["*"]	2020-11-07 16:49:22	2020-11-07 16:49:20	2020-11-07 16:49:22
65	App\\Models\\User	1	token-name	7b5a462f4b05e678df73742b4476d90a8782c27ba688a7815185ed16547ee320	["*"]	2020-11-07 16:49:50	2020-11-07 16:49:48	2020-11-07 16:49:50
66	App\\Models\\User	1	token-name	c4d4c7bbf46af796d10b9ae35598cdea6218bb035f60920942e73f36f420e9a9	["*"]	2020-11-07 16:55:01	2020-11-07 16:54:59	2020-11-07 16:55:01
68	App\\Models\\User	1	token-name	fbb5039bfd2be9cb66f1582a73aaa14f60d51de14b37cb4a641e1cb1e1023b6b	["*"]	2020-11-07 16:55:34	2020-11-07 16:55:32	2020-11-07 16:55:34
69	App\\Models\\User	1	token-name	ffa23de95bb2586f9d5027912b46298eeb6318db324f5cd5058cdebf28b71f35	["*"]	2020-11-07 16:56:07	2020-11-07 16:56:06	2020-11-07 16:56:07
70	App\\Models\\User	1	token-name	5a9c38855cc847d3fc71e1af2f8eb6f457dd57fd77a5cd0408364592ac291f29	["*"]	2020-11-07 16:56:35	2020-11-07 16:56:33	2020-11-07 16:56:35
71	App\\Models\\User	1	token-name	e1f8f0b8ec390ca1bedc09ae6e50884e863e0235188f1317a781504f4f852e83	["*"]	2020-11-07 16:56:57	2020-11-07 16:56:55	2020-11-07 16:56:57
72	App\\Models\\User	1	token-name	71e8c654529f8341ed5caad2cc23d38ec3abc7ca228c5be8274e366910788a72	["*"]	2020-11-07 17:00:09	2020-11-07 17:00:08	2020-11-07 17:00:09
73	App\\Models\\User	1	token-name	b8a632d59c2b12e9f395ce9f6407a04e589e54b1eee12ca324c290fc4f2c69ff	["*"]	2020-11-07 17:03:14	2020-11-07 17:03:12	2020-11-07 17:03:14
74	App\\Models\\User	1	token-name	9a712a732d405cb9443f6fbcfa30f79e5394df651b4d0779910ac621998ef01a	["*"]	2020-11-07 17:04:42	2020-11-07 17:04:40	2020-11-07 17:04:42
75	App\\Models\\User	1	token-name	8efa9b10c62d188001fbf94ee10ec50d3f9a9d3ccfc0213c6c9b7b0e26d6e9ef	["*"]	2020-11-07 17:05:39	2020-11-07 17:05:37	2020-11-07 17:05:39
76	App\\Models\\User	1	token-name	aee1d7d3d8c341b92d00fe201dca7b94ddae8fd797b9904a9787970988782c36	["*"]	2020-11-07 17:06:03	2020-11-07 17:06:02	2020-11-07 17:06:03
77	App\\Models\\User	1	token-name	02804201374e607b169944523307d888ee12b4caa99b8934d8c644354ae4494e	["*"]	2020-11-07 17:07:47	2020-11-07 17:07:46	2020-11-07 17:07:47
78	App\\Models\\User	1	token-name	c1fd7916cae47bfadade3ea99a213559afbd5eabd77e844ca9c6e87225753b27	["*"]	2020-11-07 17:08:35	2020-11-07 17:08:33	2020-11-07 17:08:35
79	App\\Models\\User	1	token-name	b73b6d65188a2927fa4fe70481989a3e56a44662cca6c48fc113f618da581560	["*"]	2020-11-07 17:09:30	2020-11-07 17:09:26	2020-11-07 17:09:30
80	App\\Models\\User	1	token-name	867c0c710eadddd8d5130f82ea50b7cfa47445463eebfcc48f509813ad798c29	["*"]	2020-11-07 17:10:30	2020-11-07 17:10:28	2020-11-07 17:10:30
81	App\\Models\\User	1	token-name	3fa893d50237f7f77ea9b9a7f500f43b1c90743a02b2e479cf62b84ee12f252a	["*"]	2020-11-07 17:11:13	2020-11-07 17:11:11	2020-11-07 17:11:13
82	App\\Models\\User	1	token-name	b1b4bc4cd2701d33e6a943fa9b5e6d0d643169efd85a199ba46b3e3e74ea6f27	["*"]	2020-11-07 17:11:28	2020-11-07 17:11:26	2020-11-07 17:11:28
83	App\\Models\\User	1	token-name	482b9f307a5e2cf23fabea2c4a30d69018601c87b557f1730cd53042cb442b72	["*"]	2020-11-07 17:12:12	2020-11-07 17:12:10	2020-11-07 17:12:12
84	App\\Models\\User	1	token-name	e0cc1ce67dc50486f7365d277a41c85dde0d9ced674cc2cc17a335310062b3a4	["*"]	\N	2020-11-07 17:12:16	2020-11-07 17:12:16
85	App\\Models\\User	1	token-name	1fe902097b3a0bd385015fde6bfe4e208457d13525c1fd073033ba33e23aa613	["*"]	2020-11-07 17:12:39	2020-11-07 17:12:37	2020-11-07 17:12:39
86	App\\Models\\User	1	token-name	927b1ef7815d790a00db5f3ccef8cf6e9650afce8abd6e5816499db0b0188273	["*"]	\N	2020-11-07 17:12:44	2020-11-07 17:12:44
87	App\\Models\\User	1	token-name	7a46e7de372f6c5b1aaded98bb27980cfa6bfbd03157be7e42bbe77b6ef95e0c	["*"]	\N	2020-11-07 17:12:55	2020-11-07 17:12:55
88	App\\Models\\User	1	token-name	2bfd22e459954a29d9c47493688ad7e2c9e8a7d9a86f50bc1cdeeb37d42ef6de	["*"]	\N	2020-11-07 17:14:19	2020-11-07 17:14:19
89	App\\Models\\User	1	token-name	83109db243ad323126b738ddbf4a0186016cb37749f060ea15ac468cdd0c1571	["*"]	2020-11-07 17:14:30	2020-11-07 17:14:25	2020-11-07 17:14:30
90	App\\Models\\User	1	token-name	8015e5b9c07e06aea957f7a4a04889c05b5c1a66fc88106ee24f928e131bb8b1	["*"]	\N	2020-11-07 17:15:39	2020-11-07 17:15:39
91	App\\Models\\User	1	token-name	9d23b7d1ad9deeeb6fecb94e84f88898b5d3900acf66b8203fd09bdd0e0baf08	["*"]	2020-11-07 17:16:04	2020-11-07 17:16:01	2020-11-07 17:16:04
92	App\\Models\\User	1	token-name	1410d7984fe943a6a3205dd3c732184a6bc23e180f97097ad88d8aea5c31893f	["*"]	\N	2020-11-07 17:16:05	2020-11-07 17:16:05
93	App\\Models\\User	1	token-name	214fb49ce33b98cd8a7da1f54a91bff33ff24de93049684227c53bef4f2bd608	["*"]	\N	2020-11-07 17:18:39	2020-11-07 17:18:39
94	App\\Models\\User	1	token-name	b5d1ae054bc6ddd4f370e5f5c9bc99a7f30b965ab7d542861680d44d5b367917	["*"]	\N	2020-11-07 17:20:29	2020-11-07 17:20:29
95	App\\Models\\User	1	token-name	23b9c2ee140a34708daa943f583d82bdb1414f0ebb03ed9a0fcce93d514dfe9f	["*"]	2020-11-07 17:20:40	2020-11-07 17:20:38	2020-11-07 17:20:40
96	App\\Models\\User	1	token-name	507f60674e93d986a8061939ba3009e1998de99c6bf21855821b02657738005b	["*"]	\N	2020-11-07 17:20:41	2020-11-07 17:20:41
97	App\\Models\\User	1	token-name	ce7a82bf54c15d23e74eb61dab985399ac63d1bcfad51b9cee6a9724b9e2591d	["*"]	2020-11-07 17:21:13	2020-11-07 17:21:06	2020-11-07 17:21:13
98	App\\Models\\User	1	token-name	dfe225fcce26dd73357350c00caa285882a967860b9258b375105002f9692dea	["*"]	\N	2020-11-07 17:21:18	2020-11-07 17:21:18
99	App\\Models\\User	1	token-name	841a3b744b4c121842dae63e25ff367ab90b0c70ee5a4bc09779f1e55eefa4a8	["*"]	\N	2020-11-07 17:21:37	2020-11-07 17:21:37
100	App\\Models\\User	1	token-name	614b2ffca28a453b3558c78500834f07b82f7c966730004046279f0551f09615	["*"]	\N	2020-11-07 17:21:53	2020-11-07 17:21:53
101	App\\Models\\User	1	token-name	194d102aac3dbf415dc4cf877de4dc892946e489982e7d219de1691782ed5068	["*"]	\N	2020-11-07 17:22:05	2020-11-07 17:22:05
102	App\\Models\\User	1	token-name	045f14c77f2825fce79044030738d224ff69a41d9affe09bc64471562bc7b303	["*"]	\N	2020-11-07 17:22:34	2020-11-07 17:22:34
103	App\\Models\\User	1	token-name	727b0ca258e910d31be9b3c2105e6ac56168dbfab34b16507b29d7fb0efa96d2	["*"]	\N	2020-11-07 17:22:48	2020-11-07 17:22:48
104	App\\Models\\User	1	token-name	3e53e1a672ec19d28d4bce517615ffb3970abd8335fa237d4fc94fef5c01353b	["*"]	\N	2020-11-07 17:23:32	2020-11-07 17:23:32
105	App\\Models\\User	1	token-name	e9cd64e757851fcd5c173b5f45874ac9813fcce7fcd459fde193d8c25c0f59d4	["*"]	\N	2020-11-07 17:24:08	2020-11-07 17:24:08
106	App\\Models\\User	1	token-name	e43538b52105cc3425357f668c84d406e6bb288c2ace2a397e9b9f5f173f11e1	["*"]	\N	2020-11-07 17:24:30	2020-11-07 17:24:30
107	App\\Models\\User	1	token-name	dcb7dd92bb14ab31832cd28bff696c28600bbbc13029a89cf204674404914870	["*"]	\N	2020-11-07 17:24:46	2020-11-07 17:24:46
108	App\\Models\\User	1	token-name	b11c22dbd5c3e4e1ec3bdb75260b451ad420df101a6bf30f921979c7afb9f840	["*"]	\N	2020-11-07 17:24:52	2020-11-07 17:24:52
109	App\\Models\\User	1	token-name	9df2a5379c8029d055c3eb242cd722db33540d1b3fe5ccdd52eee5da252ded2f	["*"]	\N	2020-11-07 17:25:38	2020-11-07 17:25:38
110	App\\Models\\User	1	token-name	f02ce0a982b342d71789c131fdacba70a3856217c59836db79753d70c27e38a8	["*"]	2020-11-07 17:26:17	2020-11-07 17:26:13	2020-11-07 17:26:17
111	App\\Models\\User	1	token-name	2a7d65530d23b66a6f214a11c199e3c144840808d7b7eb232e0a6d72e96df625	["*"]	2020-11-07 17:28:11	2020-11-07 17:28:09	2020-11-07 17:28:11
112	App\\Models\\User	1	token-name	4d372bfd66692d29df4432951b0aa89db903bc2620c39d69d89a64fd618062ad	["*"]	2020-11-07 17:28:37	2020-11-07 17:28:35	2020-11-07 17:28:37
113	App\\Models\\User	1	token-name	f3839802947f7fcb38bdbccfc72315e1f1c20fef8e614a31a80f3c9f3bba0d49	["*"]	2020-11-07 17:29:37	2020-11-07 17:29:36	2020-11-07 17:29:37
114	App\\Models\\User	1	token-name	47e69a108064ad5bcd0d204b4a8c760cfdfa70d8d3c555b044fd60026f85dc1f	["*"]	2020-11-07 17:30:23	2020-11-07 17:30:21	2020-11-07 17:30:23
115	App\\Models\\User	1	token-name	5a4ee1a37c656b80f0c6093b9046166f80f12a1c6cab64d6634863c6170be0ed	["*"]	2020-11-07 17:32:54	2020-11-07 17:32:52	2020-11-07 17:32:54
116	App\\Models\\User	1	token-name	1092545b8be9ae21b2ad23d5e4b4772135b33377fb15d2c64c74788edf5ee3df	["*"]	2020-11-07 17:33:01	2020-11-07 17:33:00	2020-11-07 17:33:01
117	App\\Models\\User	1	token-name	4a8cb08930a92ff54bc14517814240cdcf5e27f76e49480eb4737ae8db3a09b5	["*"]	2020-11-07 17:36:00	2020-11-07 17:35:58	2020-11-07 17:36:00
118	App\\Models\\User	1	token-name	052357a6964b9a3b8157e0d9f07fc871bc48b3b71deded776220e32ed1e0390d	["*"]	2020-11-07 17:40:11	2020-11-07 17:36:40	2020-11-07 17:40:11
119	App\\Models\\User	1	token-name	9cc06fc4375e081d5d391522242629da851bc810166ea1fc48e06fb8a57918aa	["*"]	2020-11-07 17:42:45	2020-11-07 17:42:42	2020-11-07 17:42:45
120	App\\Models\\User	1	token-name	fbba2251c940c34f78c0c2831f259cf38440fea770e4de6163ba6046820cda8d	["*"]	\N	2020-11-07 17:44:04	2020-11-07 17:44:04
121	App\\Models\\User	1	token-name	358f48a6c5d646b8e9344fb1a0605ae4dc14689122983ff743e66a22a9241199	["*"]	2020-11-07 17:44:54	2020-11-07 17:44:52	2020-11-07 17:44:54
122	App\\Models\\User	1	token-name	eb7d4897c00edf5105daadf3e50c87c0a88789561f07548508d462970fbfcfa0	["*"]	2020-11-07 17:46:16	2020-11-07 17:46:14	2020-11-07 17:46:16
123	App\\Models\\User	1	token-name	140665b67d1064002a08c18638fd1e997a2174273676350a2cc7a164483e149f	["*"]	2020-11-07 17:47:36	2020-11-07 17:47:35	2020-11-07 17:47:36
124	App\\Models\\User	1	token-name	6a995bc15dd46b5c9b36b4b3a78654e93326cf86e27b7d808c19fe1e2b76003f	["*"]	2020-11-07 17:48:36	2020-11-07 17:48:34	2020-11-07 17:48:36
125	App\\Models\\User	1	token-name	b2c020b8771552ddea35e15eff05f83aede753998d7f15c55cb48985b4d75953	["*"]	2020-11-07 17:48:48	2020-11-07 17:48:47	2020-11-07 17:48:48
126	App\\Models\\User	1	token-name	9bb2b6962880213019c7c0bb0b1ca71e6ede25b03d0399df9ecd237babd3d19e	["*"]	2020-11-07 17:52:03	2020-11-07 17:52:01	2020-11-07 17:52:03
127	App\\Models\\User	1	token-name	abf817c10a2059e1e5bbd17696bb7d3c001f2f53d7fda9c42fe081713fb44cb8	["*"]	2020-11-07 17:52:38	2020-11-07 17:52:37	2020-11-07 17:52:38
128	App\\Models\\User	1	token-name	ba83ad2ff42107362f651c750551e46e707da0d806d249f41c65725012c7ba3c	["*"]	2020-11-07 17:53:17	2020-11-07 17:53:15	2020-11-07 17:53:17
129	App\\Models\\User	1	token-name	782040c5d6a166b528be6c4e1efccfb6dbaeb8acd01e213a093783707a35f72f	["*"]	2020-11-07 17:54:20	2020-11-07 17:54:18	2020-11-07 17:54:20
130	App\\Models\\User	1	token-name	d17f3a058d403b547ebad3f95cda36c24a64e13d664d51b23eb4e437fb545bae	["*"]	2020-11-07 17:54:28	2020-11-07 17:54:27	2020-11-07 17:54:28
131	App\\Models\\User	1	token-name	06acf50904d661dd9cd01d5cc4f6d166b43b87d5d1e275598824629925f88cb3	["*"]	2020-11-07 17:55:00	2020-11-07 17:54:58	2020-11-07 17:55:00
132	App\\Models\\User	1	token-name	10c8801a82bc4d8ca1d94d520d9e66006cc6767fba2602cd408b420f13420e2f	["*"]	2020-11-07 17:55:34	2020-11-07 17:55:33	2020-11-07 17:55:34
133	App\\Models\\User	1	token-name	2f9fd859c929e48e08b1c11e86bc2bf123fd50c26ae0a7bfb17b04c103a3eebc	["*"]	2020-11-07 18:02:31	2020-11-07 18:02:29	2020-11-07 18:02:31
134	App\\Models\\User	1	token-name	046bd011c46d8813c3269d18e57e9c8d7b18d146fd4ed08bd90e26e9d970684d	["*"]	2020-11-07 18:04:14	2020-11-07 18:04:12	2020-11-07 18:04:14
135	App\\Models\\User	1	token-name	57082190d4138bdb1da39b6cb83a0fdeea069c35e1648e17b8c717d1d31e46c1	["*"]	2020-11-07 18:06:33	2020-11-07 18:06:24	2020-11-07 18:06:33
136	App\\Models\\User	1	token-name	5845d699944d97b6e266c02f19e4c42cceb512b15e69222733ade1b70de3a913	["*"]	2020-11-07 18:07:25	2020-11-07 18:07:23	2020-11-07 18:07:25
137	App\\Models\\User	1	token-name	2777c150bc3996d67e1e80b5568ecdfbd572fafe91db196fd043777cc5ff15a6	["*"]	2020-11-07 18:08:32	2020-11-07 18:08:30	2020-11-07 18:08:32
138	App\\Models\\User	1	token-name	1b26f83eb0c999ce0565f2b68190cdd1f343017618db50f408a967aae53f6323	["*"]	2020-11-07 18:14:21	2020-11-07 18:14:20	2020-11-07 18:14:21
139	App\\Models\\User	1	token-name	478256622c94629c49be4d4f369160ea4650ad0c1f9dee06e6296ecfc1f14deb	["*"]	2020-11-07 18:15:33	2020-11-07 18:15:31	2020-11-07 18:15:33
140	App\\Models\\User	1	token-name	82932b075c1a19b2096f24482b8b7e796ae4b8ce702ca434038505a8da2f281e	["*"]	2020-11-07 18:15:51	2020-11-07 18:15:49	2020-11-07 18:15:51
141	App\\Models\\User	1	token-name	683ef8d0607a3fcb891934b6b502db92f28eb497efe7cd8d8572151c03c90fbf	["*"]	2020-11-07 18:16:11	2020-11-07 18:16:09	2020-11-07 18:16:11
142	App\\Models\\User	1	token-name	bb3af074b9214c121f29a6db47816910034eff8f87d48330665527a8d408a17f	["*"]	2020-11-07 18:16:45	2020-11-07 18:16:43	2020-11-07 18:16:45
143	App\\Models\\User	1	token-name	a74cf5c5b04554822fff5187074cf116e18b2c2f48ce3e90d20409db5e1e9e0b	["*"]	2020-11-07 18:17:36	2020-11-07 18:17:35	2020-11-07 18:17:36
144	App\\Models\\User	1	token-name	01098684e46a75f48f2637561f2ed6a8353d0ce993af8ec5ff0800ed972ccb30	["*"]	2020-11-07 18:21:45	2020-11-07 18:21:42	2020-11-07 18:21:45
145	App\\Models\\User	1	token-name	9b61de79544da627b473612e3712745f8fcd8a8c5c239b62445f024354896025	["*"]	2020-11-07 18:22:40	2020-11-07 18:22:38	2020-11-07 18:22:40
146	App\\Models\\User	1	token-name	cc5885a23fb7035845790a104870040398c8cc5229b9489be7843644db23681c	["*"]	2020-11-07 18:23:15	2020-11-07 18:23:13	2020-11-07 18:23:15
147	App\\Models\\User	1	token-name	5530200e856d09830bdf81a543910c522b829b233759c06c152871d7ed64b2fb	["*"]	2020-11-07 18:25:37	2020-11-07 18:25:35	2020-11-07 18:25:37
148	App\\Models\\User	1	token-name	084114ec41166eaf57b9f15270431f36af306199f43171b4ad59780781e4144b	["*"]	2020-11-07 18:27:31	2020-11-07 18:27:30	2020-11-07 18:27:31
149	App\\Models\\User	1	token-name	c3c6ceecb3be27ba2bd09e94f4e43fe2d9260c244c2ac4252498a18d354f3d54	["*"]	2020-11-07 18:29:39	2020-11-07 18:29:37	2020-11-07 18:29:39
150	App\\Models\\User	1	token-name	b1464a2fe3f719dd08dc6b19e1d534a44b7e6596346183305f66820a8e97a1e9	["*"]	2020-11-07 18:30:24	2020-11-07 18:30:21	2020-11-07 18:30:24
151	App\\Models\\User	1	token-name	b169c73695e37fedb821e273747768901fe5b6e878d06986ab39ad2c106b84be	["*"]	2020-11-07 18:30:33	2020-11-07 18:30:32	2020-11-07 18:30:33
152	App\\Models\\User	1	token-name	7f8a3b7b3b599e3ab58c85567166fd9f130db47f0a0745877e0966912c466375	["*"]	2020-11-07 18:30:55	2020-11-07 18:30:54	2020-11-07 18:30:55
153	App\\Models\\User	1	token-name	cd161d0cf789dc65401aec7ec9899e7e75371c96499d7bf396f3f22530961a2a	["*"]	2020-11-07 18:31:51	2020-11-07 18:31:50	2020-11-07 18:31:51
154	App\\Models\\User	1	token-name	769ec1352132a83a753a62ebedba62c5881c925d7215b20b9fde581c85ce4aa6	["*"]	2020-11-07 18:33:18	2020-11-07 18:33:14	2020-11-07 18:33:18
155	App\\Models\\User	1	token-name	6fccaee46b0551d3b860f417313c300a440eb919412d3840d78633965790424c	["*"]	2020-11-07 18:33:26	2020-11-07 18:33:24	2020-11-07 18:33:26
156	App\\Models\\User	1	token-name	2bc29cca080371fc88827d34d79e5b3d7226b0a6d4d4d77276d75cf5440b24fa	["*"]	2020-11-07 18:33:41	2020-11-07 18:33:37	2020-11-07 18:33:41
157	App\\Models\\User	1	token-name	379fd498defbef0e69a4e50437d904dd38a21dfba07c4e0252c70dc22876f713	["*"]	2020-11-07 18:33:50	2020-11-07 18:33:48	2020-11-07 18:33:50
158	App\\Models\\User	1	token-name	0098d628a015a949b9cfd40914bbed111f3044f3dfbf2cc05061a9d94b7c4991	["*"]	2020-11-07 18:34:24	2020-11-07 18:34:22	2020-11-07 18:34:24
159	App\\Models\\User	1	token-name	17aab6eccd586801f185bdd5293c8445e6aa9002293150e5ab3446276c7a5862	["*"]	2020-11-07 18:36:03	2020-11-07 18:36:01	2020-11-07 18:36:03
160	App\\Models\\User	1	token-name	b5c2c2a965ba224d823c0565c7d6378191406d30ec7556801fa962e3cc05edc3	["*"]	2020-11-07 18:36:10	2020-11-07 18:36:07	2020-11-07 18:36:10
161	App\\Models\\User	1	token-name	f8cac2f94fdddbf1e8d765af605d222c75192b069162364a7950f8b5203c990b	["*"]	2020-11-07 18:36:13	2020-11-07 18:36:12	2020-11-07 18:36:13
162	App\\Models\\User	1	token-name	35f79fdaf52802efef83c5fd050b0b02e590a8f0561c874fd32bbb3c4252c6af	["*"]	2020-11-07 18:36:24	2020-11-07 18:36:23	2020-11-07 18:36:24
163	App\\Models\\User	1	token-name	06ea19da117b7ace8432fd1d2a5ec0d9d3786a04b58953342521375536082c1d	["*"]	2020-11-07 18:36:31	2020-11-07 18:36:29	2020-11-07 18:36:31
164	App\\Models\\User	1	token-name	f449318d4f123c0d145ca055c63d4c5e677d6f39ef9a4c6496f3ca6235c22c12	["*"]	2020-11-07 18:36:41	2020-11-07 18:36:40	2020-11-07 18:36:41
165	App\\Models\\User	1	token-name	5bc87bf47f9c6245456690c5580bc455a56ae8e396d740ddbac08926c5f9ff7a	["*"]	2020-11-07 18:36:51	2020-11-07 18:36:50	2020-11-07 18:36:51
166	App\\Models\\User	1	token-name	087e3ed1d549e3f2086933d40549c3b9987581d2a906af0e8b33e3d9815809e8	["*"]	2020-11-07 18:37:04	2020-11-07 18:37:02	2020-11-07 18:37:04
167	App\\Models\\User	1	token-name	28e38faf8c18a50f6590ffd10761ae23380acc7fe5e996be10857ccf0e0ce392	["*"]	2020-11-07 18:37:13	2020-11-07 18:37:12	2020-11-07 18:37:13
168	App\\Models\\User	1	token-name	5ecde369dfa4c911461d9e41a62df6411a9713f044266685f1fe51ba9dc57905	["*"]	2020-11-07 18:37:19	2020-11-07 18:37:18	2020-11-07 18:37:19
169	App\\Models\\User	1	token-name	11545a0076f27b871f8877b4272d95a2f02faeffdff8a8657e13439a90f8fd7f	["*"]	2020-11-07 18:37:29	2020-11-07 18:37:27	2020-11-07 18:37:29
170	App\\Models\\User	1	token-name	637707759de01d141eb41ce525a6d925f296a51ae4651158ca95a3b355d967e2	["*"]	2020-11-07 18:37:42	2020-11-07 18:37:41	2020-11-07 18:37:42
171	App\\Models\\User	1	token-name	8a15358c1dfa8579af76b484b31ab00eb970eb06da89f15652a7125db7b0d7ec	["*"]	2020-11-07 18:37:53	2020-11-07 18:37:51	2020-11-07 18:37:53
172	App\\Models\\User	1	token-name	47994b2509ac371a81f24c30b67260ff5e8eae9e0a5e7f6011b13a599b34389b	["*"]	2020-11-07 18:37:56	2020-11-07 18:37:55	2020-11-07 18:37:56
173	App\\Models\\User	1	token-name	6e8a0d646a1205584b59cd70106c3a288b78d7bcbb0500259c380e6fe5ffd09a	["*"]	2020-11-07 18:38:35	2020-11-07 18:38:33	2020-11-07 18:38:35
174	App\\Models\\User	1	token-name	f97b40b7efa1f31d009f58bcb570110c4f8108ec01a814707a0da8956f1af21c	["*"]	2020-11-07 18:38:45	2020-11-07 18:38:43	2020-11-07 18:38:45
175	App\\Models\\User	1	token-name	98af846e3ff52c928b74b55854534f185f33403b54cf69940c99b22f1b83ee84	["*"]	2020-11-07 18:39:32	2020-11-07 18:39:30	2020-11-07 18:39:32
176	App\\Models\\User	1	token-name	31d19c956113cc07016e1aa44892c5ee109186d183cb509f99d683193e907c39	["*"]	2020-11-07 18:40:10	2020-11-07 18:40:04	2020-11-07 18:40:10
177	App\\Models\\User	1	token-name	ad1a29567a1ca0f757e599abbfc93ad3c4c72b62c84584268db3876df996430e	["*"]	2020-11-07 18:42:00	2020-11-07 18:41:58	2020-11-07 18:42:00
178	App\\Models\\User	1	token-name	b58a2fb952e7b90241c4be3c0aa9cdae0289b6afc4bff7c79de179de09e850df	["*"]	2020-11-07 18:42:15	2020-11-07 18:42:13	2020-11-07 18:42:15
179	App\\Models\\User	1	token-name	b71743ae216bb66644957d5ef10da02c39651e80fc6022c20631875368c6dfa6	["*"]	2020-11-07 18:42:43	2020-11-07 18:42:41	2020-11-07 18:42:43
180	App\\Models\\User	1	token-name	6bf96c3b0de530b6193b3721614f406e381daf254f62a74d14475111a8d87a33	["*"]	2020-11-07 18:42:52	2020-11-07 18:42:51	2020-11-07 18:42:52
181	App\\Models\\User	1	token-name	dffcccc8aa063cc7c78125fc9b597258e454a2392763d934d8b3992fe674edb3	["*"]	2020-11-07 18:43:12	2020-11-07 18:43:10	2020-11-07 18:43:12
182	App\\Models\\User	1	token-name	6d5dec5c5a13a7708de7025fb61f3c848224531419fe9fa86d7ac11e1eb74521	["*"]	2020-11-07 18:43:17	2020-11-07 18:43:15	2020-11-07 18:43:17
183	App\\Models\\User	1	token-name	b6d5fe51941ade74ab9210df44c8ebc19154d3f5eda00bfdaace8e9380499599	["*"]	2020-11-07 18:45:16	2020-11-07 18:45:15	2020-11-07 18:45:16
184	App\\Models\\User	1	token-name	f8f47cb921476993643b5b2394c03afd6632890aa4d610661c5532de40d0e665	["*"]	2020-11-07 18:45:31	2020-11-07 18:45:28	2020-11-07 18:45:31
185	App\\Models\\User	1	token-name	ed6ad69258bdf51a9db0774d4557db8329f778e59f589c5162a95f014fdf605e	["*"]	2020-11-07 18:47:26	2020-11-07 18:47:25	2020-11-07 18:47:26
186	App\\Models\\User	1	token-name	ea861ca51d7d04cfaca977219137b24856f8a0104ce6070756b43e3203c7c8fa	["*"]	2020-11-07 18:47:38	2020-11-07 18:47:36	2020-11-07 18:47:38
187	App\\Models\\User	1	token-name	2fba7a2795cf2c46eb48ac981b651fda0d6656bff15030e2a8d1e68209ed80a8	["*"]	2020-11-07 18:48:19	2020-11-07 18:48:18	2020-11-07 18:48:19
188	App\\Models\\User	1	token-name	13e02399f2a210000646fc746e4d8306258111265e5c484837bd51ebd736df12	["*"]	2020-11-07 18:48:27	2020-11-07 18:48:26	2020-11-07 18:48:27
189	App\\Models\\User	1	token-name	b2b4e6b75b1da63e5a529576e0a1f0955629032d184f8d58ba4fea06c92e98ee	["*"]	2020-11-07 18:49:33	2020-11-07 18:49:32	2020-11-07 18:49:33
190	App\\Models\\User	1	token-name	044285bb4a379afbe12dbf314206a716c969b7ce544693a48216f803ba4f554b	["*"]	2020-11-07 18:50:09	2020-11-07 18:50:06	2020-11-07 18:50:09
191	App\\Models\\User	1	token-name	ff4fe987c246138de8d89e0649562221d75a0659320a5ccde1d45a7d1d834a56	["*"]	2020-11-07 18:51:10	2020-11-07 18:51:09	2020-11-07 18:51:10
192	App\\Models\\User	1	token-name	b737f0bca87f89c13fbdf00172265c84fcd3e471c2966f11a0d7a1571575ccf3	["*"]	2020-11-07 18:51:25	2020-11-07 18:51:23	2020-11-07 18:51:25
193	App\\Models\\User	1	token-name	983d832c4ff5281f735b56a72dde35c8ed8d3bf34327bbea09bedd9a89d89c4f	["*"]	2020-11-07 18:51:32	2020-11-07 18:51:30	2020-11-07 18:51:32
194	App\\Models\\User	1	token-name	e81769550ed1f2f5fc43bc2100acad519d397b65300b6c9676e86e933db2ed2b	["*"]	2020-11-07 18:52:31	2020-11-07 18:52:29	2020-11-07 18:52:31
195	App\\Models\\User	1	token-name	acfbd5e5725befdd13e4ad219997dc4785abc3bec9a1f32947ff1cce3560bfe0	["*"]	2020-11-07 18:52:53	2020-11-07 18:52:52	2020-11-07 18:52:53
196	App\\Models\\User	1	token-name	22aefdc42b9543663610c2e36cdf6471b761d1d033c3fb1a80d4f2629d1caa79	["*"]	2020-11-07 18:53:09	2020-11-07 18:53:08	2020-11-07 18:53:09
197	App\\Models\\User	1	token-name	fbc1703a4747fa009844a5ab1f3e75a9d5c59c500d59209085e2b7187d99a6ab	["*"]	2020-11-07 18:53:28	2020-11-07 18:53:27	2020-11-07 18:53:28
198	App\\Models\\User	1	token-name	9b9da9fddaf56dc947786f34d67aece772ab972ba79f4db7e540897ef1cf8a8c	["*"]	2020-11-07 18:53:44	2020-11-07 18:53:42	2020-11-07 18:53:44
199	App\\Models\\User	1	token-name	31a5438352df2808df3e90f72f7939992008bca8687a1fe391702bb4e42b73fd	["*"]	2020-11-07 18:54:28	2020-11-07 18:54:27	2020-11-07 18:54:28
200	App\\Models\\User	1	token-name	75f54f1379069de9f6da639c3033cb8e1dea695ac7eb40cc897fbef3418e87d7	["*"]	2020-11-07 18:56:14	2020-11-07 18:56:13	2020-11-07 18:56:14
201	App\\Models\\User	1	token-name	fd2021cfa50385ad54cc2d4d0683a7400ce5e092e3b4d207c614aacda6ccf278	["*"]	2020-11-07 18:56:51	2020-11-07 18:56:44	2020-11-07 18:56:51
202	App\\Models\\User	1	token-name	7ca1ec2da35fb2d58421613d2515a0574c4dbf2ef29b63f45aba10aa9507be73	["*"]	2020-11-07 18:57:40	2020-11-07 18:57:39	2020-11-07 18:57:40
203	App\\Models\\User	1	token-name	64d50d8d1951cb1a94378d1d36d74d148fbe4a5ea63a23921d08df3bd7a66b1b	["*"]	2020-11-07 18:57:55	2020-11-07 18:57:52	2020-11-07 18:57:55
204	App\\Models\\User	1	token-name	7c548d5fde9f90b0e89eaa78fc11bd7542d9589dc4c7166ccc2c167e4c76eb3c	["*"]	2020-11-07 18:58:51	2020-11-07 18:58:49	2020-11-07 18:58:51
205	App\\Models\\User	1	token-name	e78106569802bbf469c7dbfb8604830f9e67860c260410ee150a25b2d55dbf34	["*"]	2020-11-07 18:59:19	2020-11-07 18:59:18	2020-11-07 18:59:19
206	App\\Models\\User	1	token-name	b7cdbdfe2816adc60a7f6fdf177ae2ad75690249d68d2a32c7851958baf2307a	["*"]	2020-11-07 18:59:31	2020-11-07 18:59:30	2020-11-07 18:59:31
207	App\\Models\\User	1	token-name	128ba1e8ba6b772dea0eae47f33a86ac06a50d626e63ba9a13b06f05ea39de95	["*"]	2020-11-07 18:59:38	2020-11-07 18:59:37	2020-11-07 18:59:38
208	App\\Models\\User	1	token-name	f07ba80a6430133b366606db59b0db5e7877be9e1243ad7696035f9739f70d55	["*"]	2020-11-07 19:00:53	2020-11-07 19:00:51	2020-11-07 19:00:53
209	App\\Models\\User	1	token-name	636cddc34bbf91a75e7f8898e36e744a7efd4d25f72cadbd1b8c67b8a111876e	["*"]	2020-11-07 19:00:58	2020-11-07 19:00:56	2020-11-07 19:00:58
210	App\\Models\\User	1	token-name	de90c5452aac1301d43209c8c069bd1e45dac3212355eebaceb257b8450110bb	["*"]	2020-11-07 19:01:08	2020-11-07 19:01:06	2020-11-07 19:01:08
211	App\\Models\\User	1	token-name	3abe1b1193e457c7b9f4b2fb582cca428a43e3e4b60d77a0259cfd8bd5063a06	["*"]	2020-11-07 19:01:53	2020-11-07 19:01:51	2020-11-07 19:01:53
212	App\\Models\\User	1	token-name	c6198b4be3768325a416ca6d46767e9d6b1cbd7f2a5d8a8f009068f0adf2d75d	["*"]	2020-11-07 19:01:59	2020-11-07 19:01:58	2020-11-07 19:01:59
213	App\\Models\\User	1	token-name	6d9ee03e103eec7b2699a70c1b2fb04f1b193ea0be43d93ca8668f69a6870a11	["*"]	2020-11-07 19:02:24	2020-11-07 19:02:22	2020-11-07 19:02:24
214	App\\Models\\User	1	token-name	b4831347f253b18f0e871a4bc163cfe3cfbe4154c40ea636a9c3beefabadecd6	["*"]	2020-11-07 19:02:33	2020-11-07 19:02:31	2020-11-07 19:02:33
215	App\\Models\\User	1	token-name	801de292683dc96b70a4dcb5e03c86cbb281d4705096f8a5395ddbc7ed2b021a	["*"]	2020-11-07 19:03:23	2020-11-07 19:03:21	2020-11-07 19:03:23
216	App\\Models\\User	1	token-name	75ed16587dded2ca9f4dcfd6fab537191a95057febac223b88c88c7357899bb7	["*"]	2020-11-07 19:03:46	2020-11-07 19:03:44	2020-11-07 19:03:46
217	App\\Models\\User	1	token-name	88bb99c3954e8e1cde1e960ac77a596befcadc829059bdec2a9ef779de89e78f	["*"]	2020-11-07 19:03:54	2020-11-07 19:03:53	2020-11-07 19:03:54
218	App\\Models\\User	1	token-name	741465a5d15a5592abba099d4ce29c4134670b3c1a7dfcf82076c62a4f74656c	["*"]	2020-11-07 19:03:57	2020-11-07 19:03:56	2020-11-07 19:03:57
219	App\\Models\\User	1	token-name	ed125fa7ccea24c65bb214979a2bc7de906ce3b10b2fc665bc432f94947cc131	["*"]	2020-11-07 19:05:24	2020-11-07 19:05:23	2020-11-07 19:05:24
220	App\\Models\\User	1	token-name	5ad1438f92682de077ff9f73161fa425847180c4144b293437cffc3d9ca7822e	["*"]	2020-11-07 19:05:29	2020-11-07 19:05:28	2020-11-07 19:05:29
221	App\\Models\\User	1	token-name	1f0f11e1c697fcb5c055d006f4aaf5b73bafe2e2aea8f0099e99b2bbb36c9a32	["*"]	2020-11-07 19:05:35	2020-11-07 19:05:34	2020-11-07 19:05:35
222	App\\Models\\User	1	token-name	4e06a23a9a9633555061e0266ea8f6b330aae0f11d6d95302f50937551b11b00	["*"]	\N	2020-11-07 19:05:39	2020-11-07 19:05:39
223	App\\Models\\User	1	token-name	bed0ea5d7ec23f226bf07d1b3926a9b5b6887cc4df5c50e0b093d4a0a7d1bec3	["*"]	2020-11-07 19:05:53	2020-11-07 19:05:51	2020-11-07 19:05:53
224	App\\Models\\User	1	token-name	e682bc9137cae2c265466666eb924435ac0bfe59f4e35ae7efeb5d179ce28409	["*"]	2020-11-07 19:06:22	2020-11-07 19:06:19	2020-11-07 19:06:22
225	App\\Models\\User	1	token-name	d1832dc3288a1411a1d590398b5cf87eab61c1727a4b8286c7546a90619923da	["*"]	2020-11-07 19:06:39	2020-11-07 19:06:38	2020-11-07 19:06:39
226	App\\Models\\User	1	token-name	9de7ede8777d98ef1984c269270ffdb807bc5dc7682cbedf8b721105956e17a3	["*"]	2020-11-07 19:08:24	2020-11-07 19:08:23	2020-11-07 19:08:24
227	App\\Models\\User	1	token-name	f5f77429eb001818a9b26fac35cbc5c208d7cd42158ebb2d87501cf188d2d55c	["*"]	2020-11-07 19:08:28	2020-11-07 19:08:26	2020-11-07 19:08:28
228	App\\Models\\User	1	token-name	d2a3d7c2cd9e8728a3b84f6a2dab9c41fbb2cd9839d7aa5dd0ca71481b3167ed	["*"]	2020-11-07 19:10:08	2020-11-07 19:10:06	2020-11-07 19:10:08
229	App\\Models\\User	1	token-name	576482e1c55cba96c75e9bed215a0b543f09f0893226324edc549385cc9ab004	["*"]	2020-11-07 19:10:32	2020-11-07 19:10:31	2020-11-07 19:10:32
230	App\\Models\\User	1	token-name	32dc57e952c69eb2821da136ae7d93c00e7b7ff9703bce53649afe386a65d9ee	["*"]	2020-11-07 19:10:45	2020-11-07 19:10:43	2020-11-07 19:10:45
231	App\\Models\\User	1	token-name	f06f6100f0aa723619bca4c1193d0caa7ab09d59bbfc390b22843ad862731f1d	["*"]	2020-11-07 19:11:17	2020-11-07 19:11:16	2020-11-07 19:11:17
232	App\\Models\\User	1	token-name	5e33a538f4c47e323a2c75a9bb6df90f466a8547f7c1de2259b9769758669126	["*"]	2020-11-07 19:11:22	2020-11-07 19:11:21	2020-11-07 19:11:22
233	App\\Models\\User	1	token-name	855ea0eecb11adb982443b14b5ad190c24b5610b8df777da72f8eeb2cb2481ee	["*"]	2020-11-07 19:12:22	2020-11-07 19:12:20	2020-11-07 19:12:22
234	App\\Models\\User	1	token-name	88f5bae16154080a55c92883967b4fb540d8bd0d22cdae1fff342ec0ec615f82	["*"]	2020-11-07 19:13:03	2020-11-07 19:13:01	2020-11-07 19:13:03
235	App\\Models\\User	1	token-name	1c9fd9c7e7a85fbe61a052996bfc2549943e3ac87a3dafc9f0b3cc4470966bd0	["*"]	2020-11-07 19:13:10	2020-11-07 19:13:09	2020-11-07 19:13:10
236	App\\Models\\User	1	token-name	92b215a3fec03f76497d0a87aa749248475e72c1fda9ff24e720e874a02d4796	["*"]	2020-11-07 19:13:32	2020-11-07 19:13:31	2020-11-07 19:13:32
237	App\\Models\\User	1	token-name	2d4f4353caed85f189ff5eb4812ded74444a2c57e34a8de5f25690e1de809b69	["*"]	2020-11-07 19:13:42	2020-11-07 19:13:41	2020-11-07 19:13:42
238	App\\Models\\User	1	token-name	9d52489baf0e6b3361a37e6234a53fa362b7a19fb0c1d766518eba256b4e0c23	["*"]	2020-11-07 19:14:31	2020-11-07 19:14:29	2020-11-07 19:14:31
239	App\\Models\\User	1	token-name	3f01378b4d41c83ae504a86d4a4070f19c3fc16f1f71cf40489855e4179e63ee	["*"]	2020-11-07 19:17:07	2020-11-07 19:17:06	2020-11-07 19:17:07
240	App\\Models\\User	1	token-name	c058e757b46fdf1a76ca226f9886feec65dbd32a2b41777c57ee81ff06e70c50	["*"]	2020-11-07 19:46:41	2020-11-07 19:46:39	2020-11-07 19:46:41
241	App\\Models\\User	1	token-name	96436557c5927ba0f8a7dfb90307b60e83c8c329cb2b1b9b8d75c5c25795c990	["*"]	2020-11-07 20:06:03	2020-11-07 20:06:01	2020-11-07 20:06:03
242	App\\Models\\User	1	token-name	e1ca367fec60c3289dcfe13e627f707923bfb7e6c8f96cc386840fd6d25e1357	["*"]	2020-11-07 20:06:37	2020-11-07 20:06:28	2020-11-07 20:06:37
243	App\\Models\\User	1	token-name	dc53260cf9ee22473c0b4ce4e8d5630d2c51303ff234eb89ea9bb0b6134e6900	["*"]	2020-11-07 20:07:03	2020-11-07 20:07:01	2020-11-07 20:07:03
244	App\\Models\\User	1	token-name	bb46cf08096ad6ef20906bf5b78d9ea28dccb082fcdb38bec5a92d94b364dd71	["*"]	2020-11-07 20:08:18	2020-11-07 20:08:16	2020-11-07 20:08:18
245	App\\Models\\User	1	token-name	c079a3e87da7e1b6655f3c9ebdd4ae6af52800be14507af711e3f6cee60af553	["*"]	2020-11-07 20:08:39	2020-11-07 20:08:37	2020-11-07 20:08:39
246	App\\Models\\User	1	token-name	af45ac4d002bb82570d9b9383dce20745005374312c35d3b6671b4b35db29af4	["*"]	2020-11-07 20:09:43	2020-11-07 20:09:41	2020-11-07 20:09:43
247	App\\Models\\User	1	token-name	a1c31b20420961fc4f41341a9e0c75f26897ddce89fd97995fe30838625bccfe	["*"]	2020-11-07 20:10:16	2020-11-07 20:10:14	2020-11-07 20:10:16
248	App\\Models\\User	1	token-name	34e1226055554122ea2dca9368ac462e53165c3f138b0cec3ce7520319a7cf0c	["*"]	2020-11-07 20:11:13	2020-11-07 20:11:10	2020-11-07 20:11:13
249	App\\Models\\User	1	token-name	7eaf49cd2b0658ab62afbee92538373be87b65cdda1bfb2c8082b332de924e86	["*"]	2020-11-07 20:11:24	2020-11-07 20:11:23	2020-11-07 20:11:24
250	App\\Models\\User	1	token-name	fa3dd2c3f39b727cd756709bb4a7425e9b450e1a4f70d0da113ca249bb90d201	["*"]	\N	2020-11-07 20:29:45	2020-11-07 20:29:45
251	App\\Models\\User	1	token-name	ebffdbb9ae1b36ed9135ff9992aaa40ed833c2cfbf30178a484b501c8f995d68	["*"]	2020-11-07 20:30:47	2020-11-07 20:30:45	2020-11-07 20:30:47
252	App\\Models\\User	1	token-name	658f269ebd61740b9a116af72ad5d19825da1737229db9faf84ee62296c528e4	["*"]	2020-11-07 20:31:06	2020-11-07 20:31:04	2020-11-07 20:31:06
253	App\\Models\\User	1	token-name	306886a89ed7b55dc41ea2ef5e239105240de2d9afd27a1defe1873f3e8bfbdd	["*"]	2020-11-07 20:32:09	2020-11-07 20:32:07	2020-11-07 20:32:09
262	App\\Models\\User	1	token-name	c79d2e2a27fc2ac2d2278926d3255dfae0ea536326fa7c554591db6619dbe877	["*"]	2020-11-07 20:44:25	2020-11-07 20:44:23	2020-11-07 20:44:25
263	App\\Models\\User	1	token-name	16439fdfe153dea57b1799288c1cfd3ef1f81c1f8b85759c6a4ded498af404e7	["*"]	\N	2020-11-07 20:44:28	2020-11-07 20:44:28
254	App\\Models\\User	1	token-name	51d6c615ace80b720c3a1955f504ecba7633bfaa5a5d9322870ae55f5c2fcd05	["*"]	2020-11-07 20:33:12	2020-11-07 20:33:08	2020-11-07 20:33:12
264	App\\Models\\User	1	token-name	c5298a7d1a72761f8d33ce2979816d9dea23c40eef67120ddda8573b5c44d306	["*"]	\N	2020-11-07 20:45:34	2020-11-07 20:45:34
259	App\\Models\\User	1	token-name	ff2a670d935127d0104c2fb139029942b758b3a0555e3457e9bb95e0dbf322d0	["*"]	2020-11-07 20:37:10	2020-11-07 20:37:03	2020-11-07 20:37:10
255	App\\Models\\User	1	token-name	f357c903b8fd7459dd3a3f088672af7633e19989b9bdd6a74db997eb7ebb4fc9	["*"]	2020-11-07 20:33:45	2020-11-07 20:33:27	2020-11-07 20:33:45
258	App\\Models\\User	1	token-name	5e43ed705de19de90d88eee4cccef9ded56103ed284db8448e91bec2b907952c	["*"]	2020-11-07 20:36:21	2020-11-07 20:36:07	2020-11-07 20:36:21
256	App\\Models\\User	1	token-name	1d0537ada47bcb3792d20174feffe3c290996ebea6cdc4b9528f305a33293766	["*"]	2020-11-07 20:34:34	2020-11-07 20:34:28	2020-11-07 20:34:34
257	App\\Models\\User	1	token-name	b539dfb0e19d54435653cb184ee05d216a0679b9036a8af59ce6f8120b351128	["*"]	2020-11-07 20:35:51	2020-11-07 20:35:49	2020-11-07 20:35:51
260	App\\Models\\User	1	token-name	6853ce74a06a7ed9d4531d724f574bfd31cccf55cdc3fde1e5219b311aac3f68	["*"]	2020-11-07 20:37:44	2020-11-07 20:37:30	2020-11-07 20:37:44
261	App\\Models\\User	1	token-name	8245a7a8f34284c446e45462e06045ce43a9bd34ba682e7f1dec15e1cd29bf8e	["*"]	2020-11-07 20:39:12	2020-11-07 20:39:04	2020-11-07 20:39:12
265	App\\Models\\User	1	token-name	f2acf2a48f22953eb47c3ab9325caf57a7ae7879959c34c904b9da36b34a1c36	["*"]	2020-11-07 20:45:41	2020-11-07 20:45:39	2020-11-07 20:45:41
266	App\\Models\\User	1	token-name	da76f5a3746d5b708f61f6568c68f1ef88c79ba06974dcb93e7d70e7831e4533	["*"]	2020-11-07 20:45:55	2020-11-07 20:45:53	2020-11-07 20:45:55
268	App\\Models\\User	1	token-name	e428c98ce01b220e5183a504880a25b2758e37bf4be28278a694249ba2b2ee6d	["*"]	2020-11-08 17:47:35	2020-11-08 17:47:26	2020-11-08 17:47:35
267	App\\Models\\User	1	token-name	92af894e19d3cc6659d049db69d4931f8afcb45504659a9a6ff560779ca62c8f	["*"]	2020-11-07 21:50:25	2020-11-07 20:46:23	2020-11-07 21:50:25
270	App\\Models\\User	1	token-name	5b79ccca1e7213523036a3dacbf7e7970a41c7de1baec45376b58c7161c1b34a	["*"]	2020-11-08 18:05:38	2020-11-08 18:05:30	2020-11-08 18:05:38
269	App\\Models\\User	1	token-name	2054f65eba4a71c34ab8a487ede82b0e431040ab413052daa27e82c1b5a6d87b	["*"]	2020-11-08 17:47:47	2020-11-08 17:47:39	2020-11-08 17:47:47
282	App\\Models\\User	1	token-name	63e60b16c5f3f9063e3f2b910e8513b490c3b8b6a2636e637bd728aaafa7b251	["*"]	2020-11-08 18:16:47	2020-11-08 18:16:41	2020-11-08 18:16:47
277	App\\Models\\User	1	token-name	f3b71743a471db6e8363fbfb9ae0672ea918aff3d5965f0704da6f25fe077776	["*"]	2020-11-08 18:12:06	2020-11-08 18:11:59	2020-11-08 18:12:06
271	App\\Models\\User	1	token-name	ce64c0722f991c4e9fac426359d95b2748650f7e65766d6d091263568526dc4b	["*"]	2020-11-08 18:07:31	2020-11-08 18:07:24	2020-11-08 18:07:31
283	App\\Models\\User	1	token-name	3365f562473fb394942fea28f1df65501ea9862f210a26d8ef0a9f62b68996dd	["*"]	2020-11-08 18:21:14	2020-11-08 18:21:11	2020-11-08 18:21:14
272	App\\Models\\User	1	token-name	144a9e3c84decf14dd7d5d08924187325470d893732ccf44249a3ab29ceba396	["*"]	2020-11-08 18:07:45	2020-11-08 18:07:39	2020-11-08 18:07:45
284	App\\Models\\User	1	token-name	516bfe501d70a9159b68a097f8eff3f89fa70f5f993d37e76f0cfa5bc592f33b	["*"]	2020-11-08 18:22:13	2020-11-08 18:22:08	2020-11-08 18:22:13
285	App\\Models\\User	1	token-name	9490ec3381f21352e387c222e81335a871b8b38a2444ed5e2def796e278e124a	["*"]	2020-11-08 18:22:40	2020-11-08 18:22:38	2020-11-08 18:22:40
278	App\\Models\\User	1	token-name	25574ab15608e65fa99bb96c250af75a55020e6c9ba2d1e84511ad8137925f4c	["*"]	2020-11-08 18:12:50	2020-11-08 18:12:40	2020-11-08 18:12:50
273	App\\Models\\User	1	token-name	335b2380de2793766be5a75b28732991438c8114722e0d2d832b1c9674d74c29	["*"]	2020-11-08 18:08:33	2020-11-08 18:08:24	2020-11-08 18:08:33
286	App\\Models\\User	1	token-name	e1e81467b20c179c5f4a62c09b5cc2c87e09e96de6d4957342228d6fcbee0332	["*"]	2020-11-08 18:24:11	2020-11-08 18:24:09	2020-11-08 18:24:11
287	App\\Models\\User	1	token-name	fa413a32ef6b28ff178290259062c29380d0e9cec60a639cd837771f0bd5de8e	["*"]	2020-11-08 18:25:18	2020-11-08 18:25:16	2020-11-08 18:25:18
274	App\\Models\\User	1	token-name	4aaf092782dd9f551826fa621e42c3878cf64584107ba2741df1b1e6a3a0071a	["*"]	2020-11-08 18:09:46	2020-11-08 18:09:36	2020-11-08 18:09:46
279	App\\Models\\User	1	token-name	48049fc267351faf2236be44070f8300c7487e8a6e848caee61591a34d198120	["*"]	2020-11-08 18:14:37	2020-11-08 18:14:28	2020-11-08 18:14:37
275	App\\Models\\User	1	token-name	380e4549ce51be31f51495a277d4352c578d8b34980209c30c8178bbc1e4d076	["*"]	2020-11-08 18:10:21	2020-11-08 18:10:11	2020-11-08 18:10:21
280	App\\Models\\User	1	token-name	e1f22ecb0778cb1c5b97f7e6c0ab865c2a720853d82c99c7009d9831c306bc98	["*"]	2020-11-08 18:15:10	2020-11-08 18:15:02	2020-11-08 18:15:10
276	App\\Models\\User	1	token-name	4c338534ca16d018bf9a003fa617c22524d24fa265dd8f96ff047824901abd28	["*"]	2020-11-08 18:11:18	2020-11-08 18:11:11	2020-11-08 18:11:18
288	App\\Models\\User	1	token-name	2d7589c912be7081a93dfb0cd84938be0164cb1a88bc486ff5f714881bf65d87	["*"]	2020-11-08 18:25:56	2020-11-08 18:25:36	2020-11-08 18:25:56
289	App\\Models\\User	1	token-name	88c6c0bcc8a79980cdbe1f0181071886a2bf2684b21d942f67235b7861ceacdd	["*"]	2020-11-08 18:26:58	2020-11-08 18:26:56	2020-11-08 18:26:58
281	App\\Models\\User	1	token-name	edda8aa602d62926b3d604e73703a13d6a1aaf076ecf6cd2195ac689a9ba4079	["*"]	2020-11-08 18:15:53	2020-11-08 18:15:45	2020-11-08 18:15:53
290	App\\Models\\User	1	token-name	c7266dfecad78fc5cfa0af1ac14c28ebba762f3a042aa72c2f493f5fbdcd5d9a	["*"]	2020-11-08 18:28:45	2020-11-08 18:28:39	2020-11-08 18:28:45
291	App\\Models\\User	1	token-name	aa33b3d3a201190844032725776bf99ff58179a8569ffe4a9b6e624a98e6769b	["*"]	2020-11-08 18:54:09	2020-11-08 18:29:16	2020-11-08 18:54:09
292	App\\Models\\User	1	token-name	6994fa316f4304b4a360b620302f375708a190ee7b0c815eddac9fdfdc2177a4	["*"]	2020-11-08 18:56:10	2020-11-08 18:55:56	2020-11-08 18:56:10
293	App\\Models\\User	1	token-name	6ef683f6b9da4ac98eba0524557848f87610576959163f51ce19f3a8d12b1391	["*"]	2020-11-08 18:56:34	2020-11-08 18:56:24	2020-11-08 18:56:34
294	App\\Models\\User	1	token-name	8ec9315cf5fc6838968e5544b59b579b6c879fd0d1e5e10426233025ee2c3525	["*"]	\N	2020-11-08 19:00:52	2020-11-08 19:00:52
295	App\\Models\\User	1	token-name	b04c7a00a061f1675b4f3732b516f321a87b9d0b651a2294be25e3fc59173e17	["*"]	\N	2020-11-08 19:00:54	2020-11-08 19:00:54
296	App\\Models\\User	1	token-name	e2b79bfc6a2892aa7a3f90955bc990f36fe184fb56ea9acd440ec491b9d4b767	["*"]	\N	2020-11-08 19:00:55	2020-11-08 19:00:55
297	App\\Models\\User	1	token-name	cbf8599fc5d969be483e842c4a671aa927a5fb8ce07bef101ba92689e5ce472c	["*"]	\N	2020-11-08 19:00:56	2020-11-08 19:00:56
298	App\\Models\\User	1	token-name	c6ffc1e9abc74caacc0c37aa55396e19c0a343c76df4789b8e5352dcc52bf263	["*"]	\N	2020-11-08 19:00:58	2020-11-08 19:00:58
299	App\\Models\\User	1	token-name	cf6065e83242d28782c6d6c5aea785e99b076436093ef2ac70549048171f4b73	["*"]	\N	2020-11-08 19:05:00	2020-11-08 19:05:00
300	App\\Models\\User	1	token-name	95d4a9184044ce167d4f24e0d570659892a4d5c7e8010183db3ea0b1d74364a4	["*"]	\N	2020-11-08 19:05:33	2020-11-08 19:05:33
301	App\\Models\\User	1	token-name	79f9a709a708d428be23b83532a859ee4a65908ee285c74133b2303e85b4bda5	["*"]	\N	2020-11-08 19:05:36	2020-11-08 19:05:36
302	App\\Models\\User	1	token-name	4c569b748798a41659d680fa677cc0f6dd5d0e81a8f24af5d7fc47c11fc9adb3	["*"]	\N	2020-11-08 19:09:20	2020-11-08 19:09:20
303	App\\Models\\User	1	token-name	ec020be69e3318b213b2594d3cbcf0393eba0b9f36d1db8b49f27ffd4ae760c9	["*"]	\N	2020-11-08 19:09:22	2020-11-08 19:09:22
304	App\\Models\\User	1	token-name	9e5bde6ccdda3892e4e5f207db9edd72fd04787950e307d719564fddc893972e	["*"]	\N	2020-11-08 19:09:24	2020-11-08 19:09:24
305	App\\Models\\User	1	token-name	13fb405296133135d72d0b42230432fb4b9f32286f0366a01cfe843240c2567f	["*"]	\N	2020-11-08 19:09:27	2020-11-08 19:09:27
306	App\\Models\\User	1	token-name	bbe0c3493264566282d4d90317bdcaa33db18afed0ba4d6950125e1e91df263f	["*"]	\N	2020-11-08 19:09:29	2020-11-08 19:09:29
307	App\\Models\\User	1	token-name	7f552b61089abdb784b1f021b047e1377d77bb92fe026e5b49d5bd0ae82151f1	["*"]	\N	2020-11-08 19:09:30	2020-11-08 19:09:30
308	App\\Models\\User	1	token-name	331e3cf8482d4eb37c79119e70152fbc61dfb8235b3d2684bb275da46355f057	["*"]	\N	2020-11-08 19:09:33	2020-11-08 19:09:33
309	App\\Models\\User	1	token-name	8d41f4d770e24a0b05e4d0799dd201ede2d485531cce850c3e598da5b43c980c	["*"]	\N	2020-11-08 19:09:34	2020-11-08 19:09:34
310	App\\Models\\User	1	token-name	3e47c51443d422d385a360d8bf9a872592f2985e7fdc36ee164e9204063a983a	["*"]	\N	2020-11-08 19:09:35	2020-11-08 19:09:35
311	App\\Models\\User	1	token-name	ceba468e5fa31c71e2021886b63e9e279283a7e7564cf2b031fc66f06d0fdf40	["*"]	\N	2020-11-08 19:09:36	2020-11-08 19:09:36
312	App\\Models\\User	1	token-name	edb415deb8ea2f3defa4fe64666d3068d454c25ba871823afb28a4b43e4f674c	["*"]	\N	2020-11-08 19:09:38	2020-11-08 19:09:38
313	App\\Models\\User	1	token-name	e0b252b0f73ce11e9e7479f6575f130b84d18b87950bb70a087c94201b92ace2	["*"]	\N	2020-11-08 19:09:40	2020-11-08 19:09:40
314	App\\Models\\User	1	token-name	086a82158dc9b8fbe3aac8b9e40988a8308103886b7f6d2c5cb305f1b039e4fb	["*"]	\N	2020-11-08 19:09:45	2020-11-08 19:09:45
315	App\\Models\\User	1	token-name	1d675404ca91dc103d4ffb9a72c35b5079041e3faea01329362b6d2f5c77e515	["*"]	\N	2020-11-08 19:09:50	2020-11-08 19:09:50
316	App\\Models\\User	1	token-name	dc9f143ed90e48e38d08b0ef103f3eb172126732820c3be7d5a92cf6e655f432	["*"]	\N	2020-11-08 19:09:53	2020-11-08 19:09:53
324	App\\Models\\User	1	token-name	8a828537a48d8128b188dcd943bb8362267e35d15f123b0faa75bb3fa550d9e8	["*"]	2020-11-08 19:24:13	2020-11-08 19:24:11	2020-11-08 19:24:13
337	App\\Models\\User	1	token-name	0f30cad3657625df383ee52cb80b099c7dfc0f8a9185ce43d8c01aa76bff715c	["*"]	2020-11-08 20:16:44	2020-11-08 20:16:42	2020-11-08 20:16:44
325	App\\Models\\User	1	token-name	6c902ea06f4dbedf078d4a47f6ae9d7074947f152cd072cd6f7a14554d3adb35	["*"]	2020-11-08 19:26:14	2020-11-08 19:24:49	2020-11-08 19:26:14
317	App\\Models\\User	1	token-name	d4b7f16fd82800e28782628ac05a6bd87393d256a5d261d343607590891758d0	["*"]	2020-11-08 19:10:14	2020-11-08 19:09:57	2020-11-08 19:10:14
338	App\\Models\\User	1	token-name	b467f03216324c46423f18a071bf1fe2d436b48e35e238eb17fb7b99cda50081	["*"]	2020-11-08 20:21:22	2020-11-08 20:21:20	2020-11-08 20:21:22
327	App\\Models\\User	1	token-name	26da4e23edc207c940dbac3b11985eb591e42bd0f199b6f3f4021ec17a38db71	["*"]	2020-11-08 19:31:45	2020-11-08 19:31:26	2020-11-08 19:31:45
318	App\\Models\\User	1	token-name	9e7dffb48774097c3ee84519278b7e1f23bf6dc3e34b6b9ceb7fc99e1a529602	["*"]	2020-11-08 19:10:36	2020-11-08 19:10:28	2020-11-08 19:10:36
319	App\\Models\\User	1	token-name	1a8eec9bc324d098ad4d20bbd5383e931490cbc7fe7b1f79c1749da1cee955ce	["*"]	2020-11-08 19:11:24	2020-11-08 19:11:16	2020-11-08 19:11:24
320	App\\Models\\User	1	token-name	fab743d0c531341a420e87ccc4a9feb5862d3882d313adb11d3cffbd25b9c3fe	["*"]	2020-11-08 19:14:37	2020-11-08 19:14:34	2020-11-08 19:14:37
321	App\\Models\\User	1	token-name	f36444a958679ded268a3a23295d5aed2387697dcff2e8d350723a183a8e154e	["*"]	2020-11-08 19:14:53	2020-11-08 19:14:48	2020-11-08 19:14:53
322	App\\Models\\User	1	token-name	365f030342d18b12a2ccce1ae300b048ffd830c4a8065d098761a0a93531eaca	["*"]	2020-11-08 19:21:45	2020-11-08 19:21:43	2020-11-08 19:21:45
323	App\\Models\\User	1	token-name	bd6fe52270b9eca2a44b284b1c5de63d9a41b6104f56b09f35bfb6fd18ce3690	["*"]	2020-11-08 19:22:29	2020-11-08 19:22:28	2020-11-08 19:22:29
326	App\\Models\\User	1	token-name	f8f73302466799d070ffc0c14961d637cabc9b6bfed4d50d736ce594718e405d	["*"]	2020-11-08 19:26:30	2020-11-08 19:26:21	2020-11-08 19:26:30
330	App\\Models\\User	1	token-name	e4639a8a42c1ff19189f24b3d8ed1d408672b95aac4b8407de1509c4df51a9ab	["*"]	2020-11-08 20:12:26	2020-11-08 20:12:17	2020-11-08 20:12:26
339	App\\Models\\User	1	token-name	e06e546fe7c75f619750f7153399f7fc8ece51e5adaec28e84b4af9a1ad43dee	["*"]	2020-11-08 20:23:29	2020-11-08 20:23:27	2020-11-08 20:23:29
331	App\\Models\\User	1	token-name	100cd28dd0cb87923ed3f117d9df159f7642c495ea4d8af1a42a0adbb602794f	["*"]	2020-11-08 20:13:16	2020-11-08 20:12:41	2020-11-08 20:13:16
332	App\\Models\\User	1	token-name	703fb71dab176a208b44ae8992085a905827cebf81c4f23f5b03fd38e2c6f2fd	["*"]	\N	2020-11-08 20:14:06	2020-11-08 20:14:06
328	App\\Models\\User	1	token-name	18d7ba0dc2450477be3990de72a4856094fdc33c4e23593ac91c569ba2141e82	["*"]	2020-11-08 19:31:54	2020-11-08 19:31:46	2020-11-08 19:31:54
329	App\\Models\\User	1	token-name	457993927614dd5a8c1b518ce45ce814322959d7aaf66262e745adb0f86628f1	["*"]	\N	2020-11-08 20:10:21	2020-11-08 20:10:21
333	App\\Models\\User	1	token-name	5e96b82384ca5717ff503f38acafd22edb51e34edfec483f759476e2d4badf30	["*"]	\N	2020-11-08 20:15:01	2020-11-08 20:15:01
334	App\\Models\\User	1	token-name	8974a769fd375c3080f1e3fcc57fa86f8fd21d66494260a045057ed873a4351d	["*"]	\N	2020-11-08 20:15:08	2020-11-08 20:15:08
335	App\\Models\\User	1	token-name	a2181791e26484451261569327322a4b226fe8a6b32061fda1f761faf03a8e1b	["*"]	\N	2020-11-08 20:15:31	2020-11-08 20:15:31
336	App\\Models\\User	1	token-name	e3825f0a314494ee3f19519c92bd248351a743ef32bc2ed090d9a653fee84e88	["*"]	\N	2020-11-08 20:16:04	2020-11-08 20:16:04
340	App\\Models\\User	1	token-name	7852f355f02a9d8d2b0b167e40650e125bd75423e1408f839b653840913a9043	["*"]	2020-11-08 20:23:40	2020-11-08 20:23:38	2020-11-08 20:23:40
341	App\\Models\\User	1	token-name	92444b04c44894d277d4be07c65c978e90478d589be33c3e29e4a643013a841a	["*"]	2020-11-08 20:23:56	2020-11-08 20:23:54	2020-11-08 20:23:56
342	App\\Models\\User	1	token-name	90a6a039c876b9a8573f7375a94b12fbd7799a767fe4d65de58fc6e3929e4ce8	["*"]	2020-11-08 20:24:19	2020-11-08 20:24:17	2020-11-08 20:24:19
343	App\\Models\\User	1	token-name	5087da09b8d07c4aeafc95331bd26026251f9d109511634043d5255fa9b72e76	["*"]	2020-11-08 20:24:28	2020-11-08 20:24:26	2020-11-08 20:24:28
358	App\\Models\\User	1	token-name	34dc558a8a27924bd63cb68206513db043f9924026b2cc952b8839553e436193	["*"]	2020-11-08 21:21:21	2020-11-08 21:21:20	2020-11-08 21:21:21
344	App\\Models\\User	1	token-name	5173882969068ed28910dcffd04fabf399a33bd752f5d4ced7421a496f704ccd	["*"]	2020-11-08 20:42:42	2020-11-08 20:42:34	2020-11-08 20:42:42
345	App\\Models\\User	1	token-name	53b217c96fdfd52eef96c03ad93b912b28a30fd39d51d96ee535698dfa6ae1ab	["*"]	2020-11-08 20:42:59	2020-11-08 20:42:57	2020-11-08 20:42:59
359	App\\Models\\User	1	token-name	0a8c6a565840c3703a2097f96dac89484db36b710a027c2549223ed966786582	["*"]	2020-11-08 21:22:07	2020-11-08 21:22:06	2020-11-08 21:22:07
360	App\\Models\\User	1	token-name	99b9eecad6b7f01812f6bd97629a8eea28c9cf736e923f04edefaa6dd3f60151	["*"]	2020-11-08 21:22:25	2020-11-08 21:22:24	2020-11-08 21:22:25
361	App\\Models\\User	1	token-name	6ab8f5fdebb3041b0a03edd15eef6e40746214d6626ee5150ab418fec9c0fc58	["*"]	2020-11-08 21:22:28	2020-11-08 21:22:28	2020-11-08 21:22:28
362	App\\Models\\User	1	token-name	385530b94ac01bcb3647190c4aacc0e732ca791bb94668c1f057dbff391cca49	["*"]	2020-11-08 21:22:35	2020-11-08 21:22:35	2020-11-08 21:22:35
363	App\\Models\\User	1	token-name	69ffbe0507d4a62e23db546026b73bfeded97ad2828c67c3ff2a4c6981b3b27a	["*"]	2020-11-08 21:22:59	2020-11-08 21:22:58	2020-11-08 21:22:59
346	App\\Models\\User	1	token-name	97a9d70204395609e6ee5ead1a5b085120d47c900bf74b70f8f6f94bace82b5e	["*"]	2020-11-08 20:43:50	2020-11-08 20:43:10	2020-11-08 20:43:50
364	App\\Models\\User	1	token-name	5e0b490e29ae175166ea8c2419e61e8fa714774896fadf5e3d837d2c935b89af	["*"]	2020-11-08 21:23:19	2020-11-08 21:23:19	2020-11-08 21:23:19
374	App\\Models\\User	1	token-name	e26f9dae1307680db400e168c3b11ea1f675fcf1629b5ffd520be9d62c9db6e0	["*"]	2020-11-11 13:18:11	2020-11-11 13:16:27	2020-11-11 13:18:11
347	App\\Models\\User	1	token-name	55102e79db91348c18d2ce0fd1f6fd64281dce58f5395db734fb15482a36b2c1	["*"]	2020-11-08 20:44:32	2020-11-08 20:43:51	2020-11-08 20:44:32
370	App\\Models\\User	1	token-name	f0d11422e45eaf62ace859b81c895e073926f14796d6deb207c4b63d01cb4a73	["*"]	2020-11-09 07:09:49	2020-11-08 21:42:52	2020-11-09 07:09:49
348	App\\Models\\User	1	token-name	3265200769d13c27d184ca9a2cea1cfa8c8def6fd5ff5a6ca5f47e63596e981a	["*"]	2020-11-08 20:45:19	2020-11-08 20:45:10	2020-11-08 20:45:19
349	App\\Models\\User	1	token-name	fe86e2a1baf759a4151dc23bbfc47b52364562ab1de0ce41ac9ec5f77143c59f	["*"]	2020-11-08 20:46:37	2020-11-08 20:46:04	2020-11-08 20:46:37
350	App\\Models\\User	1	token-name	9d3586c49dc01830e65e7f4195d23fa43f183a7f9bc176407418a4dcbe8dcd44	["*"]	2020-11-08 20:48:31	2020-11-08 20:48:29	2020-11-08 20:48:31
351	App\\Models\\User	1	token-name	e335bbb64acaa74fb06daea8a29cf7f91c1e7a1ab1c7423dae167c40df289abc	["*"]	2020-11-08 21:07:01	2020-11-08 21:06:55	2020-11-08 21:07:01
352	App\\Models\\User	1	token-name	4ae6bcc491bb6719db50c375aeb736de2b8bb29107474b598b1764940551d5c2	["*"]	\N	2020-11-08 21:07:12	2020-11-08 21:07:12
353	App\\Models\\User	1	token-name	236e90530bb04409ee228cb5bc5528bcee31ddabe3b38190242a2a62a67378c9	["*"]	\N	2020-11-08 21:07:50	2020-11-08 21:07:50
354	App\\Models\\User	1	token-name	cbb384f9a2e344ffbd266e3384765844a5cd01e2606dfa03622b28eea05c4a53	["*"]	\N	2020-11-08 21:08:08	2020-11-08 21:08:08
355	App\\Models\\User	1	token-name	f1ef93a28e29a96ffa5211aee9160f769bc2c09a9660be9bd7266b570a82fd92	["*"]	\N	2020-11-08 21:08:32	2020-11-08 21:08:32
356	App\\Models\\User	1	token-name	b1b6bfc5c00812dd00ff4a6dbbdcaf8b2e1e3ebefeb622a282ca021e41ae6027	["*"]	\N	2020-11-08 21:19:36	2020-11-08 21:19:36
357	App\\Models\\User	1	token-name	a7967e9a6d1d5dc08725634b7ce2c3169026c607da65bb62975a9100aa8c74ad	["*"]	2020-11-08 21:20:22	2020-11-08 21:20:22	2020-11-08 21:20:22
373	App\\Models\\User	1	token-name	143d5dc5dc5c5b24df1abdcb01fc2d174a1d073361799aea47556dbdc2a04998	["*"]	2020-11-09 15:24:42	2020-11-09 15:24:19	2020-11-09 15:24:42
368	App\\Models\\User	1	token-name	50bfdce5939f17fb7617da12be0e50cafdc492790b5bd5cbc216e02f0ee3f2ac	["*"]	2020-11-08 21:36:03	2020-11-08 21:35:48	2020-11-08 21:36:03
365	App\\Models\\User	1	token-name	f5691cddf476eb7c5ae216a47581e5f44c0645dee4cd468721eb1fee255d18ef	["*"]	2020-11-08 21:31:42	2020-11-08 21:27:32	2020-11-08 21:31:42
366	App\\Models\\User	1	token-name	f7f8a08354c7ed52680eecbadd134929b6590035d4725502973a2c612ec9f5a8	["*"]	\N	2020-11-08 21:35:10	2020-11-08 21:35:10
367	App\\Models\\User	1	token-name	353630d3effc5441b8cd9370d0533fef43e7a702beaf4f0f523c91f42fa85d0e	["*"]	2020-11-08 21:35:36	2020-11-08 21:35:35	2020-11-08 21:35:36
371	App\\Models\\User	1	token-name	41bccfaacb64ebb293264616a10200ed124f0bb8980ef687eebccc96e7f45164	["*"]	2020-11-09 12:57:49	2020-11-09 12:53:32	2020-11-09 12:57:49
372	App\\Models\\User	1	token-name	dba750c03032935ab5872f41fed4ca45a31469db3d1ec9d91e60aaa4acc6c0fd	["*"]	2020-11-09 12:57:53	2020-11-09 12:57:53	2020-11-09 12:57:53
369	App\\Models\\User	1	token-name	97a0df77d27802168e146cca74d6bd02ba3fde8d628a602a6c4e2c40586f9214	["*"]	2020-11-08 21:42:39	2020-11-08 21:42:32	2020-11-08 21:42:39
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
7O2x6nrylskOnCiqkXg1vK0Drw3MNwJsdEk71VCj	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMFlLaWQ3QUZ1SVRyRzVLSm85WVJ4aWdTckFxSm9LZTZTNUpmTUVjbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OToiaHR0cDovL2JiIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHhPSFdsS3VONWlLU1hvUzdiUmE2WE9oeUJZcXJYOURKYlV5bUhIZGl6bUdXZzl6cm52dnJpIjt9	1604871772
lny25AfePfsAja82OPunY1weYwNQYZiEqr5YrYf2	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoidWg5a0NBaGo4Q0llZ1FIUEZHQ2Q1Yk42d2N2azRDaWZ4emFPMllSMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OToiaHR0cDovL2JiIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHhPSFdsS3VONWlLU1hvUzdiUmE2WE9oeUJZcXJYOURKYlV5bUhIZGl6bUdXZzl6cm52dnJpIjt9	1604926673
OdyeYXiEs72jT7YGIuMQFp08zVqEJVftGSWZp1ln	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXJscThZejFhb3ROSzhRRXNWVEt0YWNHN2kyU20ycDU1MG4yMjRONCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1604935444
tlbFphw8hzZTDzJLs77BcT8DtUos171R4JEO3lkq	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSTBUdnhvZWd0YWJtWFhYMHdOUWVnOWtvWVZaZlhGMEZzNTltdWN3SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OToiaHR0cDovL2JiIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHhPSFdsS3VONWlLU1hvUzdiUmE2WE9oeUJZcXJYOURKYlV5bUhIZGl6bUdXZzl6cm52dnJpIjt9	1604935459
inNzEdoAyLaRfWBbRbY9VH8JNaehLp2ekGpB6tJU	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNFluem9ncTZ0Nzhqa0hJVzVZaEJmSDBYMVVPZWYyQVI5TzNkcjdXQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OToiaHR0cDovL2JiIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHhPSFdsS3VONWlLU1hvUzdiUmE2WE9oeUJZcXJYOURKYlV5bUhIZGl6bUdXZzl6cm52dnJpIjt9	1605100587
\.


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_user (id, team_id, user_id, role, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, user_id, name, personal_team, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 3, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 374, true);


--
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_user_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- Name: team_user team_user_team_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_team_id_user_id_unique UNIQUE (team_id, user_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: teams_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teams_user_id_index ON public.teams USING btree (user_id);


--
-- PostgreSQL database dump complete
--

