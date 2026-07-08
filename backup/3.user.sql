--
-- PostgreSQL database dump
--

\restrict DraKaCxPQGrhoP1GEdYo41gfL89JHpxEU0xTIbiPRXTW92QtKs2NAvlVa24PQFT

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
-- Name: user; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "user";


ALTER SCHEMA "user" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user; Type: TABLE; Schema: user; Owner: postgres
--

CREATE TABLE "user"."user" (
    id integer CONSTRAINT users_id_not_null NOT NULL,
    "userName" character varying CONSTRAINT "users_userName_not_null" NOT NULL,
    password character varying CONSTRAINT users_password_not_null NOT NULL,
    role character varying DEFAULT 'user'::character varying CONSTRAINT users_role_not_null NOT NULL
);


ALTER TABLE "user"."user" OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: user; Owner: postgres
--

ALTER TABLE "user"."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "user".users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user users_pk; Type: CONSTRAINT; Schema: user; Owner: postgres
--

ALTER TABLE ONLY "user"."user"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict DraKaCxPQGrhoP1GEdYo41gfL89JHpxEU0xTIbiPRXTW92QtKs2NAvlVa24PQFT

