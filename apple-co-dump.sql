--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

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

SET default_with_oids = false;

--
-- Name: ceos; Type: TABLE; Schema: public; Owner: ranger
--

CREATE TABLE public.ceos (
    id integer NOT NULL,
    name text NOT NULL,
    year integer
);


ALTER TABLE public.ceos OWNER TO ranger;

--
-- Name: ceos_id_seq; Type: SEQUENCE; Schema: public; Owner: ranger
--

CREATE SEQUENCE public.ceos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ceos_id_seq OWNER TO ranger;

--
-- Name: ceos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ranger
--

ALTER SEQUENCE public.ceos_id_seq OWNED BY public.ceos.id;


--
-- Name: ceos id; Type: DEFAULT; Schema: public; Owner: ranger
--

ALTER TABLE ONLY public.ceos ALTER COLUMN id SET DEFAULT nextval('public.ceos_id_seq'::regclass);


--
-- Data for Name: ceos; Type: TABLE DATA; Schema: public; Owner: ranger
--

COPY public.ceos (id, name, year) FROM stdin;
1	Steve Jobs	1976
2	Mike Markkula	1977
3	Mike Scott	1978
4	John Sculley	1983
5	Michael Spindler	1993
6	Gil Amelio	1996
7	Steve Jobs	1997
8	Tim Cook	2011
\.


--
-- Name: ceos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ranger
--

SELECT pg_catalog.setval('public.ceos_id_seq', 8, true);


--
-- Name: ceos ceos_pkey; Type: CONSTRAINT; Schema: public; Owner: ranger
--

ALTER TABLE ONLY public.ceos
    ADD CONSTRAINT ceos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

