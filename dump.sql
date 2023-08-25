--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    id_post integer,
    id_user integer,
    comment text NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    namehashtag character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    id_post integer,
    id_user integer,
    createdat timestamp without time zone DEFAULT now()
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    link text NOT NULL,
    description text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "userName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    image text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 1, 'https://www.globo.com/', NULL, '2023-08-21 13:17:09.26135');
INSERT INTO public.posts VALUES (2, 2, 'https://www.youtube.com/', NULL, '2023-08-22 16:22:17.245484');
INSERT INTO public.posts VALUES (3, 2, 'https://www.google.com/maps/', NULL, '2023-08-22 16:22:43.960723');
INSERT INTO public.posts VALUES (5, 2, 'https://www.google.com/?&bih=862&biw=1680&hl=pt-BR', NULL, '2023-08-22 16:23:18.150203');
INSERT INTO public.posts VALUES (6, 1, 'https://www.slido.com/?utm_medium=slido-logo--header&utm_source=app&experience_id=20-a', NULL, '2023-08-22 16:26:00.09467');
INSERT INTO public.posts VALUES (7, 1, 'https://github.com/', NULL, '2023-08-22 16:26:14.413839');
INSERT INTO public.posts VALUES (11, 3, 'https://www.youtube.com/', NULL, '2023-08-22 16:29:56.780035');
INSERT INTO public.posts VALUES (12, 3, 'https://github.com/', 'Git
', '2023-08-22 16:30:11.800526');
INSERT INTO public.posts VALUES (13, 3, 'https://github.com/', NULL, '2023-08-22 16:30:20.50694');
INSERT INTO public.posts VALUES (14, 3, 'https://github.com/', 'Git Hub', '2023-08-22 16:30:28.001624');
INSERT INTO public.posts VALUES (15, 3, 'https://www.youtube.com/', NULL, '2023-08-22 16:40:49.676523');
INSERT INTO public.posts VALUES (16, 3, 'https://www.youtube.com/', 'yt', '2023-08-22 16:40:55.096614');
INSERT INTO public.posts VALUES (17, 3, 'https://www.youtube.com/', 'YT', '2023-08-22 16:41:00.151497');
INSERT INTO public.posts VALUES (18, 3, 'https://www.youtube.com/', 'yOUtUBE', '2023-08-22 16:41:11.416293');
INSERT INTO public.posts VALUES (19, 3, 'https://www.youtube.com/', 'YOUTUBE', '2023-08-22 16:41:21.320999');
INSERT INTO public.posts VALUES (20, 3, 'https://github.com/', NULL, '2023-08-22 16:43:09.890821');
INSERT INTO public.posts VALUES (21, 3, 'https://github.com/', 'GH', '2023-08-22 16:43:15.563361');
INSERT INTO public.posts VALUES (22, 3, 'https://github.com/', 'gIThUB', '2023-08-22 16:43:21.893324');
INSERT INTO public.posts VALUES (23, 3, 'https://github.com/', 'GitHub', '2023-08-22 16:43:32.63177');
INSERT INTO public.posts VALUES (24, 3, 'https://github.com/', NULL, '2023-08-22 16:43:40.715798');
INSERT INTO public.posts VALUES (25, 3, 'https://www.google.com/maps/', 'Maps', '2023-08-22 16:43:54.014801');
INSERT INTO public.posts VALUES (26, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 16:43:59.341414');
INSERT INTO public.posts VALUES (27, 3, 'https://www.google.com/maps/', 'GM', '2023-08-22 16:44:06.807686');
INSERT INTO public.posts VALUES (28, 3, 'https://www.google.com/maps/', 'gOOGLE MAPS', '2023-08-22 16:44:16.114382');
INSERT INTO public.posts VALUES (29, 3, 'https://www.google.com/maps/', 'Google Maps', '2023-08-22 16:44:22.50811');
INSERT INTO public.posts VALUES (30, 3, 'https://www.youtube.com/', NULL, '2023-08-22 19:01:50.161843');
INSERT INTO public.posts VALUES (31, 3, 'https://day.js.org/en/', NULL, '2023-08-22 19:24:31.534432');
INSERT INTO public.posts VALUES (32, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 19:30:58.922776');
INSERT INTO public.posts VALUES (33, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 19:36:05.071463');
INSERT INTO public.posts VALUES (34, 3, 'https://github.com/', NULL, '2023-08-22 19:37:13.969253');
INSERT INTO public.posts VALUES (35, 1, 'https://www.youtube.com/', NULL, '2023-08-22 19:38:31.390047');
INSERT INTO public.posts VALUES (36, 1, 'https://www.youtube.com/', NULL, '2023-08-22 19:38:48.982778');
INSERT INTO public.posts VALUES (37, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 19:48:06.928803');
INSERT INTO public.posts VALUES (38, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 19:57:36.998661');
INSERT INTO public.posts VALUES (39, 3, 'https://www.google.com/maps/', 'GM', '2023-08-22 19:58:56.116312');
INSERT INTO public.posts VALUES (40, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:02:36.591963');
INSERT INTO public.posts VALUES (41, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:02:46.361194');
INSERT INTO public.posts VALUES (42, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 20:05:39.213931');
INSERT INTO public.posts VALUES (44, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:09:28.405375');
INSERT INTO public.posts VALUES (46, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:13:10.86438');
INSERT INTO public.posts VALUES (47, 3, 'https://github.com/', NULL, '2023-08-22 20:23:29.411059');
INSERT INTO public.posts VALUES (48, 1, 'https://github.com/', NULL, '2023-08-22 20:23:47.927086');
INSERT INTO public.posts VALUES (49, 3, 'https://github.com/', NULL, '2023-08-22 20:23:58.365842');
INSERT INTO public.posts VALUES (50, 3, 'https://github.com/', NULL, '2023-08-22 20:24:19.826159');
INSERT INTO public.posts VALUES (51, 3, 'https://github.com/', NULL, '2023-08-22 20:26:21.780352');
INSERT INTO public.posts VALUES (52, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 20:27:22.041969');
INSERT INTO public.posts VALUES (53, 1, 'https://www.google.com/maps/', NULL, '2023-08-22 20:28:25.675132');
INSERT INTO public.posts VALUES (54, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 20:28:32.1881');
INSERT INTO public.posts VALUES (55, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:36:17.847808');
INSERT INTO public.posts VALUES (56, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:36:26.207358');
INSERT INTO public.posts VALUES (57, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:36:55.364139');
INSERT INTO public.posts VALUES (58, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:37:18.481186');
INSERT INTO public.posts VALUES (59, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:37:32.416801');
INSERT INTO public.posts VALUES (60, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:37:39.045005');
INSERT INTO public.posts VALUES (61, 1, 'https://www.youtube.com/', 'YT', '2023-08-22 20:38:14.17467');
INSERT INTO public.posts VALUES (62, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:38:36.524457');
INSERT INTO public.posts VALUES (63, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:42:43.393489');
INSERT INTO public.posts VALUES (64, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:43:24.981335');
INSERT INTO public.posts VALUES (65, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 20:44:25.826362');
INSERT INTO public.posts VALUES (66, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:45:06.095801');
INSERT INTO public.posts VALUES (67, 1, 'https://www.youtube.com/', NULL, '2023-08-22 20:45:24.499027');
INSERT INTO public.posts VALUES (68, 3, 'https://www.youtube.com/', NULL, '2023-08-22 20:45:32.204372');
INSERT INTO public.posts VALUES (69, 1, 'https://www.youtube.com/', NULL, '2023-08-22 22:03:28.519957');
INSERT INTO public.posts VALUES (70, 1, 'https://www.youtube.com/', NULL, '2023-08-22 22:03:38.826934');
INSERT INTO public.posts VALUES (71, 3, 'https://www.youtube.com/', NULL, '2023-08-22 22:03:47.980794');
INSERT INTO public.posts VALUES (72, 1, 'https://www.youtube.com/', NULL, '2023-08-22 22:04:02.009033');
INSERT INTO public.posts VALUES (73, 1, 'https://www.globo.com/', NULL, '2023-08-22 22:09:10.781021');
INSERT INTO public.posts VALUES (74, 3, 'https://www.globo.com/', NULL, '2023-08-22 22:09:32.754143');
INSERT INTO public.posts VALUES (75, 3, 'https://www.globo.com/', NULL, '2023-08-22 22:10:16.485114');
INSERT INTO public.posts VALUES (76, 3, 'https://www.google.com/maps/', NULL, '2023-08-22 22:25:03.381845');
INSERT INTO public.posts VALUES (77, 1, 'https://www.google.com/maps/', NULL, '2023-08-22 22:25:58.771778');
INSERT INTO public.posts VALUES (79, 1, 'https://www.globo.com/', NULL, '2023-08-23 14:59:18.420047');
INSERT INTO public.posts VALUES (80, 1, 'https://www.globo.com/', NULL, '2023-08-23 14:59:36.917885');


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.session VALUES (1, '62e2a637-3fa1-45cb-ac30-27d2df965e1c', 1, '2023-08-21 13:16:30.42111');
INSERT INTO public.session VALUES (2, '0d343a79-532b-4ca3-9778-fc011c87ac7f', 1, '2023-08-21 16:41:05.834058');
INSERT INTO public.session VALUES (3, 'd1dadceb-1e36-4012-9c5f-52e01bb9357d', 1, '2023-08-21 16:42:51.52148');
INSERT INTO public.session VALUES (4, '18d5336d-9d2d-46fe-abf7-bc54267e1a8f', 1, '2023-08-21 16:46:37.417929');
INSERT INTO public.session VALUES (5, '4a2997f0-75e1-4270-b7ec-66283502bd0b', 1, '2023-08-22 16:11:01.371836');
INSERT INTO public.session VALUES (6, 'c1e26d6e-cd42-4fb0-900b-74e3eb793f1f', 2, '2023-08-22 16:22:00.403558');
INSERT INTO public.session VALUES (7, '9510687c-1321-42e4-b254-3ba187b13cbb', 1, '2023-08-22 16:25:32.558474');
INSERT INTO public.session VALUES (8, '906dae28-80bc-496d-a111-234e707a541a', 3, '2023-08-22 16:28:19.837415');
INSERT INTO public.session VALUES (9, '8e218d86-66fe-409d-9bd3-c92ff56f1e66', 1, '2023-08-22 19:38:21.181471');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'gisele', 'gisele@email.com', '$2b$10$KRHbAP4VX0DQ/SQS9RxpwOD8Hq2hBv8U96xQE7m9s3iKsN6uZ76mS', 'https://i.pinimg.com/236x/e4/7d/e9/e47de9e5446c1691862e9993d9203300.jpg', '2023-08-21 13:16:27.721001');
INSERT INTO public.users VALUES (2, 'Gisele Chaves', 'gigi@email.com', '$2b$10$JYvXJNADefpc3GfFBYWvWOs82tRaPdXJF4ctomsmYJTbHE0B/.qj2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYU6KQ3SojC_b4NULBj2eZHdEX6enlP0msWg&usqp=CAU', '2023-08-22 16:21:46.27757');
INSERT INTO public.users VALUES (3, 'Cat', 'cat@email.com', '$2b$10$7s0cmo0MAJ2lhfxoK7vB/.5EmzLKqhODk1TSv0e2jy43yPgYEuJf.', 'https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg', '2023-08-22 16:28:07.947693');


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 80, true);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_userName_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_userName_key" UNIQUE ("userName");


--
-- Name: comments comments_id_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.posts(id);


--
-- Name: comments comments_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: likes likes_id_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.posts(id);


--
-- Name: likes likes_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: session session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

