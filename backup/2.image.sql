--
-- PostgreSQL database dump
--

\restrict gVUcNNX3oFZ57ZGRtHaUkn6wfeMdFTrYitwh3Ptgo5CCJbPwH8MLrPw27I0CCVn

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
-- Name: image; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA image;


ALTER SCHEMA image OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: image; Type: TABLE; Schema: image; Owner: postgres
--

CREATE TABLE image.image (
    entity_id integer,
    entity_type character varying,
    image_url character varying,
    key character varying NOT NULL
);


ALTER TABLE image.image OWNER TO postgres;

--
-- Name: image p_key; Type: CONSTRAINT; Schema: image; Owner: postgres
--

ALTER TABLE ONLY image.image
    ADD CONSTRAINT p_key PRIMARY KEY (key);


--
-- PostgreSQL database dump complete
--

\unrestrict gVUcNNX3oFZ57ZGRtHaUkn6wfeMdFTrYitwh3Ptgo5CCJbPwH8MLrPw27I0CCVn

