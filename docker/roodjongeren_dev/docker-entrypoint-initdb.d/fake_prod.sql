--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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
-- Name: about_uses; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.about_uses (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.about_uses OWNER TO rood;

--
-- Name: about_uses_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.about_uses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_uses_id_seq OWNER TO rood;

--
-- Name: about_uses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.about_uses_id_seq OWNED BY public.about_uses.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO rood;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO rood;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer,
    id integer NOT NULL,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO rood;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO rood;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO rood;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO rood;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO rood;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO rood;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer,
    id integer NOT NULL,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO rood;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO rood;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: afdelingen; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.afdelingen (
    id integer NOT NULL,
    name character varying(255),
    longitude double precision,
    latitude double precision,
    email character varying(255),
    twitter_link character varying(255),
    facebook_link character varying(255),
    instagram_link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    slug character varying(255),
    about text
);


ALTER TABLE public.afdelingen OWNER TO rood;

--
-- Name: afdelingen_contactpersonen_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.afdelingen_contactpersonen_links (
    afdeling_id integer,
    user_id integer,
    id integer NOT NULL,
    user_order double precision
);


ALTER TABLE public.afdelingen_contactpersonen_links OWNER TO rood;

--
-- Name: afdelingen_contactpersonen_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.afdelingen_contactpersonen_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.afdelingen_contactpersonen_links_id_seq OWNER TO rood;

--
-- Name: afdelingen_contactpersonen_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.afdelingen_contactpersonen_links_id_seq OWNED BY public.afdelingen_contactpersonen_links.id;


--
-- Name: afdelingen_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.afdelingen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.afdelingen_id_seq OWNER TO rood;

--
-- Name: afdelingen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.afdelingen_id_seq OWNED BY public.afdelingen.id;


--
-- Name: confidants; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.confidants (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    about text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.confidants OWNER TO rood;

--
-- Name: confidants_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.confidants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confidants_id_seq OWNER TO rood;

--
-- Name: confidants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.confidants_id_seq OWNED BY public.confidants.id;


--
-- Name: confidants_pages; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.confidants_pages (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.confidants_pages OWNER TO rood;

--
-- Name: confidants_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.confidants_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confidants_pages_id_seq OWNER TO rood;

--
-- Name: confidants_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.confidants_pages_id_seq OWNED BY public.confidants_pages.id;


--
-- Name: fallbacks; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.fallbacks (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.fallbacks OWNER TO rood;

--
-- Name: fallbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.fallbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fallbacks_id_seq OWNER TO rood;

--
-- Name: fallbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.fallbacks_id_seq OWNED BY public.fallbacks.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    folder_path character varying(255)
);


ALTER TABLE public.files OWNER TO rood;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO rood;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO rood;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO rood;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision,
    id integer NOT NULL
);


ALTER TABLE public.files_related_morphs OWNER TO rood;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO rood;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: homes; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.homes (
    id integer NOT NULL,
    banner_title character varying(255),
    banner_subtitle character varying(255),
    short_about_us text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.homes OWNER TO rood;

--
-- Name: homes_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.homes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.homes_id_seq OWNER TO rood;

--
-- Name: homes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.homes_id_seq OWNED BY public.homes.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO rood;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO rood;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: join_uses; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.join_uses (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.join_uses OWNER TO rood;

--
-- Name: join_uses_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.join_uses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.join_uses_id_seq OWNER TO rood;

--
-- Name: join_uses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.join_uses_id_seq OWNED BY public.join_uses.id;


--
-- Name: petition_signatures; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.petition_signatures (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    confirmation_code character varying(255),
    confirmed boolean,
    question_answers jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.petition_signatures OWNER TO rood;

--
-- Name: petition_signatures_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.petition_signatures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.petition_signatures_id_seq OWNER TO rood;

--
-- Name: petition_signatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.petition_signatures_id_seq OWNED BY public.petition_signatures.id;


--
-- Name: petition_signatures_petition_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.petition_signatures_petition_links (
    id integer NOT NULL,
    petition_signature_id integer,
    petition_id integer,
    petition_signature_order double precision
);


ALTER TABLE public.petition_signatures_petition_links OWNER TO rood;

--
-- Name: petition_signatures_petition_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.petition_signatures_petition_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.petition_signatures_petition_links_id_seq OWNER TO rood;

--
-- Name: petition_signatures_petition_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.petition_signatures_petition_links_id_seq OWNED BY public.petition_signatures_petition_links.id;


--
-- Name: petitions; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.petitions (
    id integer NOT NULL,
    hook character varying(255),
    extra_questions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.petitions OWNER TO rood;

--
-- Name: petitions_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.petitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.petitions_id_seq OWNER TO rood;

--
-- Name: petitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.petitions_id_seq OWNED BY public.petitions.id;


--
-- Name: petitions_post_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.petitions_post_links (
    id integer NOT NULL,
    petition_id integer,
    post_id integer
);


ALTER TABLE public.petitions_post_links OWNER TO rood;

--
-- Name: petitions_post_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.petitions_post_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.petitions_post_links_id_seq OWNER TO rood;

--
-- Name: petitions_post_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.petitions_post_links_id_seq OWNED BY public.petitions_post_links.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    content text,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    title character varying(255),
    author character varying(255),
    type character varying(255),
    frontpage boolean
);


ALTER TABLE public.posts OWNER TO rood;

--
-- Name: posts_afdeling_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.posts_afdeling_links (
    post_id integer,
    afdeling_id integer,
    id integer NOT NULL,
    post_order double precision
);


ALTER TABLE public.posts_afdeling_links OWNER TO rood;

--
-- Name: posts_afdeling_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.posts_afdeling_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_afdeling_links_id_seq OWNER TO rood;

--
-- Name: posts_afdeling_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.posts_afdeling_links_id_seq OWNED BY public.posts_afdeling_links.id;


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO rood;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: privacybeleids; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.privacybeleids (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.privacybeleids OWNER TO rood;

--
-- Name: privacybeleids_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.privacybeleids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacybeleids_id_seq OWNER TO rood;

--
-- Name: privacybeleids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.privacybeleids_id_seq OWNED BY public.privacybeleids.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.programs (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.programs OWNER TO rood;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO rood;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO rood;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO rood;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO rood;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO rood;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint
);


ALTER TABLE public.strapi_api_tokens OWNER TO rood;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO rood;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_audit_logs; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_audit_logs (
    id integer NOT NULL,
    action character varying(255),
    date timestamp(6) without time zone,
    payload jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_audit_logs OWNER TO rood;

--
-- Name: strapi_audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_audit_logs_id_seq OWNER TO rood;

--
-- Name: strapi_audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_audit_logs_id_seq OWNED BY public.strapi_audit_logs.id;


--
-- Name: strapi_audit_logs_user_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_audit_logs_user_links (
    id integer NOT NULL,
    audit_log_id integer,
    user_id integer
);


ALTER TABLE public.strapi_audit_logs_user_links OWNER TO rood;

--
-- Name: strapi_audit_logs_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_audit_logs_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_audit_logs_user_links_id_seq OWNER TO rood;

--
-- Name: strapi_audit_logs_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_audit_logs_user_links_id_seq OWNED BY public.strapi_audit_logs_user_links.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO rood;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO rood;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO rood;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO rood;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO rood;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO rood;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO rood;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO rood;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO rood;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO rood;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO rood;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO rood;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO rood;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO rood;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO rood;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO rood;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer,
    id integer NOT NULL,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO rood;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO rood;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO rood;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO rood;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    firstname character varying(255),
    lastname character varying(255),
    phone character varying(255)
);


ALTER TABLE public.up_users OWNER TO rood;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO rood;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer,
    id integer NOT NULL,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO rood;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO rood;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO rood;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO rood;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO rood;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO rood;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: workgroups; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.workgroups (
    id integer NOT NULL,
    name character varying(255),
    about text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    slug character varying(255)
);


ALTER TABLE public.workgroups OWNER TO rood;

--
-- Name: workgroups_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.workgroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workgroups_id_seq OWNER TO rood;

--
-- Name: workgroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.workgroups_id_seq OWNED BY public.workgroups.id;


--
-- Name: workgroups_pages; Type: TABLE; Schema: public; Owner: rood
--

CREATE TABLE public.workgroups_pages (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.workgroups_pages OWNER TO rood;

--
-- Name: workgroups_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: rood
--

CREATE SEQUENCE public.workgroups_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workgroups_pages_id_seq OWNER TO rood;

--
-- Name: workgroups_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rood
--

ALTER SEQUENCE public.workgroups_pages_id_seq OWNED BY public.workgroups_pages.id;


--
-- Name: about_uses id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.about_uses ALTER COLUMN id SET DEFAULT nextval('public.about_uses_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: afdelingen id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen ALTER COLUMN id SET DEFAULT nextval('public.afdelingen_id_seq'::regclass);


--
-- Name: afdelingen_contactpersonen_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen_contactpersonen_links ALTER COLUMN id SET DEFAULT nextval('public.afdelingen_contactpersonen_links_id_seq'::regclass);


--
-- Name: confidants id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants ALTER COLUMN id SET DEFAULT nextval('public.confidants_id_seq'::regclass);


--
-- Name: confidants_pages id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants_pages ALTER COLUMN id SET DEFAULT nextval('public.confidants_pages_id_seq'::regclass);


--
-- Name: fallbacks id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.fallbacks ALTER COLUMN id SET DEFAULT nextval('public.fallbacks_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: homes id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.homes ALTER COLUMN id SET DEFAULT nextval('public.homes_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: join_uses id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.join_uses ALTER COLUMN id SET DEFAULT nextval('public.join_uses_id_seq'::regclass);


--
-- Name: petition_signatures id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures ALTER COLUMN id SET DEFAULT nextval('public.petition_signatures_id_seq'::regclass);


--
-- Name: petition_signatures_petition_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures_petition_links ALTER COLUMN id SET DEFAULT nextval('public.petition_signatures_petition_links_id_seq'::regclass);


--
-- Name: petitions id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions ALTER COLUMN id SET DEFAULT nextval('public.petitions_id_seq'::regclass);


--
-- Name: petitions_post_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions_post_links ALTER COLUMN id SET DEFAULT nextval('public.petitions_post_links_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts_afdeling_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts_afdeling_links ALTER COLUMN id SET DEFAULT nextval('public.posts_afdeling_links_id_seq'::regclass);


--
-- Name: privacybeleids id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.privacybeleids ALTER COLUMN id SET DEFAULT nextval('public.privacybeleids_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_audit_logs id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs ALTER COLUMN id SET DEFAULT nextval('public.strapi_audit_logs_id_seq'::regclass);


--
-- Name: strapi_audit_logs_user_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs_user_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_audit_logs_user_links_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Name: workgroups id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups ALTER COLUMN id SET DEFAULT nextval('public.workgroups_id_seq'::regclass);


--
-- Name: workgroups_pages id; Type: DEFAULT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups_pages ALTER COLUMN id SET DEFAULT nextval('public.workgroups_pages_id_seq'::regclass);


--
-- Data for Name: about_uses; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.about_uses (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	# Organisatie\n\n![overons.jpg](https://roodjongeren.nl/backend/uploads/overons_835ea296c1.jpg)\n\nROOD vecht voor een andere wereld. De belangen van de nu heersende kapitalistische klasse staan haaks op de belangen van de werkende klasse. Wij bouwen aan een alternatief! Wij strijden:\n\n- Voor een klassenloze samenleving op basis van het principe "van elk naar vermogen, aan elk naar behoefte"!\n- Voor vrouwenbevrijding en lhbt-emancipatie, tegen racisme! We strijden tegen iedere vorm van onderdrukking en uitbuiting en voor de eenheid van de arbeidersklasse in de strijd tegen het kapitalisme!\n- Voor internationalisme! Imperialistische oorlog is nooit in het belang van werkende mensen en jongeren. We nemen de gelijkheid van de belangen van de wereldwijde arbeidersklasse als uitgangspunt. _Arbeiders aller landen, verenigt u!_\n- Tegen de klimaatcrisis! Het kapitalisme verwoest in hoog tempo onze wereld. Geen transitie zonder revolutie!\n\nDaarom komen we in actie. ROOD is bijvoorbeeld actief binnen de FNV en diverse sociale bewegingen. Daarnaast organiseren we onze eigen openbare scholingen en discussies. Ook is er ruimte voor gezelligheid. \n\nLijkt het je wat om lid te worden? Meld je dan aan op [mijnrood.nl/aanmelden](https://mijnrood.nl/aanmelden). Vragen kun je ook altijd sturen naar [info@roodjongeren.nl](mailto:info@roodjongeren.nl).\n\n**Samen maken we een einde aan het kapitalisme!**\n\n# Belangrijke documenten\n\n- [Statuten](https://roodjongeren.nl/backend/uploads/Statuten_aef8c5ea66.pdf) aangenomen op de ALV van 24 maart 2024.\n- [Huishoudelijk Reglement](https://roodjongeren.nl/backend/uploads/Huishoudelijk_Reglement_5859436f30.pdf) aangenomen op de ALV van 24 maart 2024.\n\n\n# Bestuur\n\n![robby 128.webp](https://roodjongeren.nl/backend/uploads/robby_128_0a49f32ace.webp)\n\n**Robby Breejen-Bender**\n\nVoorzitter\n\n[info@roodjongeren.nl](mailto:info@roodjongeren.nl)\n\n\n---\n\n![Jordi van Os_100x100.webp](https://roodjongeren.nl/backend/uploads/Jordi_van_Os_100x100_cf70aeb7ea.webp)\n\n**Jordi van Os**\n\nPenningmeester\n\n[penningmeester@roodjongeren.nl](mailto:penningmeester@roodjongeren.nl) (voor declaraties)\n\n[jordimartijnvanos@gmail.com](mailto:jordimartijnvanos@gmail.com)\n\n---\n\n![simon 128.webp](https://roodjongeren.nl/backend/uploads/simon_128_942a1affd0.webp)\n\n**Simon de Zeeuw**\n\nAlgemeen Bestuurslid/Secretaris\n\n[simon.zeeuw@gmail.com](mailto:simon.zeeuw@gmail.com)\n\n&nbsp;\n\n---\n\n![splinter 128.webp](https://roodjongeren.nl/backend/uploads/splinter_128_2858b6edff.webp)\n\n**Splinter Suidman**\n\nAlgemeen Bestuurslid\n\n[ssuidman@roodjongeren.nl](mailto:ssuidman@roodjongeren.nl)\n\n&nbsp;\n\n---\n\n![Hugues 128.webp](https://roodjongeren.nl/backend/uploads/taxon_128_7ecb8f6e6e.webp)\n\n**Hugues Demeulenaere**\n\nInterim voorzitter/Algemeen bestuurslid\n\n[huguesdemeulenaere@gmail.com](mailto:huguesdemeulenaere@gmail.com)\n\n&nbsp;\n\n---\n\n![Wiktor 128.webp](https://roodjongeren.nl/backend/uploads/Wiktor_Foto_c528945372.jpg)\n\n**Wiktor Zegadlo**\n\nAlgemeen Bestuurslid\n\n[wiktorzegadlo1@gmail.com](mailto:wiktorzegadlo1@gmail.com)\n\n&nbsp;\n	2022-01-30 13:55:28.722	2024-04-22 19:28:26.457	1	1
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
209	plugin::content-manager.explorer.create	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-02-13 18:18:47.31	2022-02-13 18:18:47.31	\N	\N
210	plugin::content-manager.explorer.read	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-02-13 18:18:47.324	2022-02-13 18:18:47.324	\N	\N
211	plugin::content-manager.explorer.update	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-02-13 18:18:47.329	2022-02-13 18:18:47.329	\N	\N
212	plugin::content-manager.explorer.delete	api::confidant.confidant	{}	[]	2022-02-13 18:18:47.336	2022-02-13 18:18:47.336	\N	\N
213	plugin::content-manager.explorer.publish	api::confidant.confidant	{}	[]	2022-02-13 18:18:47.341	2022-02-13 18:18:47.341	\N	\N
17	plugin::upload.read	\N	{}	[]	2022-01-29 03:00:18.738	2022-01-29 03:00:18.738	\N	\N
18	plugin::upload.assets.create	\N	{}	[]	2022-01-29 03:00:18.744	2022-01-29 03:00:18.744	\N	\N
19	plugin::upload.assets.update	\N	{}	[]	2022-01-29 03:00:18.749	2022-01-29 03:00:18.749	\N	\N
20	plugin::upload.assets.download	\N	{}	[]	2022-01-29 03:00:18.755	2022-01-29 03:00:18.755	\N	\N
21	plugin::upload.assets.copy-link	\N	{}	[]	2022-01-29 03:00:18.76	2022-01-29 03:00:18.76	\N	\N
221	plugin::content-manager.explorer.delete	api::workgroup.workgroup	{}	[]	2022-02-13 21:37:23.795	2022-02-13 21:37:23.795	\N	\N
222	plugin::content-manager.explorer.publish	api::workgroup.workgroup	{}	[]	2022-02-13 21:37:23.8	2022-02-13 21:37:23.8	\N	\N
189	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-02-13 17:48:49.008	2022-02-13 17:48:49.008	\N	\N
190	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-02-13 17:48:49.013	2022-02-13 17:48:49.013	\N	\N
225	plugin::content-manager.explorer.update	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-02-13 21:39:17.197	2022-02-13 21:39:17.197	\N	\N
58	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-01-29 03:00:18.998	2022-01-29 03:00:18.998	\N	\N
59	plugin::content-manager.explorer.delete	api::about-us.about-us	{}	[]	2022-01-29 03:00:19.004	2022-01-29 03:00:19.004	\N	\N
217	plugin::content-manager.explorer.delete	api::confidants-page.confidants-page	{}	[]	2022-02-13 19:23:43.108	2022-02-13 19:23:43.108	\N	\N
61	plugin::content-manager.explorer.delete	api::afdeling.afdeling	{}	[]	2022-01-29 03:00:19.015	2022-01-29 03:00:19.015	\N	\N
223	plugin::content-manager.explorer.create	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-02-13 21:39:17.185	2022-02-13 21:39:17.185	\N	\N
63	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-01-29 03:00:19.026	2022-01-29 03:00:19.026	\N	\N
64	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-01-29 03:00:19.031	2022-01-29 03:00:19.031	\N	\N
65	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-01-29 03:00:19.037	2022-01-29 03:00:19.037	\N	\N
66	plugin::content-type-builder.read	\N	{}	[]	2022-01-29 03:00:19.043	2022-01-29 03:00:19.043	\N	\N
67	plugin::email.settings.read	\N	{}	[]	2022-01-29 03:00:19.048	2022-01-29 03:00:19.048	\N	\N
68	plugin::upload.read	\N	{}	[]	2022-01-29 03:00:19.054	2022-01-29 03:00:19.054	\N	\N
69	plugin::upload.assets.create	\N	{}	[]	2022-01-29 03:00:19.06	2022-01-29 03:00:19.06	\N	\N
70	plugin::upload.assets.update	\N	{}	[]	2022-01-29 03:00:19.066	2022-01-29 03:00:19.066	\N	\N
71	plugin::upload.assets.download	\N	{}	[]	2022-01-29 03:00:19.071	2022-01-29 03:00:19.071	\N	\N
72	plugin::upload.assets.copy-link	\N	{}	[]	2022-01-29 03:00:19.077	2022-01-29 03:00:19.077	\N	\N
73	plugin::upload.settings.read	\N	{}	[]	2022-01-29 03:00:19.082	2022-01-29 03:00:19.082	\N	\N
74	plugin::i18n.locale.create	\N	{}	[]	2022-01-29 03:00:19.087	2022-01-29 03:00:19.087	\N	\N
75	plugin::i18n.locale.read	\N	{}	[]	2022-01-29 03:00:19.095	2022-01-29 03:00:19.095	\N	\N
76	plugin::i18n.locale.update	\N	{}	[]	2022-01-29 03:00:19.1	2022-01-29 03:00:19.1	\N	\N
77	plugin::i18n.locale.delete	\N	{}	[]	2022-01-29 03:00:19.11	2022-01-29 03:00:19.11	\N	\N
78	plugin::users-permissions.roles.create	\N	{}	[]	2022-01-29 03:00:19.115	2022-01-29 03:00:19.115	\N	\N
79	plugin::users-permissions.roles.read	\N	{}	[]	2022-01-29 03:00:19.121	2022-01-29 03:00:19.121	\N	\N
80	plugin::users-permissions.roles.update	\N	{}	[]	2022-01-29 03:00:19.126	2022-01-29 03:00:19.126	\N	\N
81	plugin::users-permissions.roles.delete	\N	{}	[]	2022-01-29 03:00:19.135	2022-01-29 03:00:19.135	\N	\N
82	plugin::users-permissions.providers.read	\N	{}	[]	2022-01-29 03:00:19.141	2022-01-29 03:00:19.141	\N	\N
83	plugin::users-permissions.providers.update	\N	{}	[]	2022-01-29 03:00:19.147	2022-01-29 03:00:19.147	\N	\N
84	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-01-29 03:00:19.153	2022-01-29 03:00:19.153	\N	\N
85	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-01-29 03:00:19.158	2022-01-29 03:00:19.158	\N	\N
86	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-01-29 03:00:19.164	2022-01-29 03:00:19.164	\N	\N
87	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-01-29 03:00:19.169	2022-01-29 03:00:19.169	\N	\N
88	admin::marketplace.read	\N	{}	[]	2022-01-29 03:00:19.175	2022-01-29 03:00:19.175	\N	\N
91	admin::webhooks.create	\N	{}	[]	2022-01-29 03:00:19.192	2022-01-29 03:00:19.192	\N	\N
92	admin::webhooks.read	\N	{}	[]	2022-01-29 03:00:19.197	2022-01-29 03:00:19.197	\N	\N
93	admin::webhooks.update	\N	{}	[]	2022-01-29 03:00:19.203	2022-01-29 03:00:19.203	\N	\N
94	admin::webhooks.delete	\N	{}	[]	2022-01-29 03:00:19.208	2022-01-29 03:00:19.208	\N	\N
95	admin::users.create	\N	{}	[]	2022-01-29 03:00:19.214	2022-01-29 03:00:19.214	\N	\N
96	admin::users.read	\N	{}	[]	2022-01-29 03:00:19.22	2022-01-29 03:00:19.22	\N	\N
97	admin::users.update	\N	{}	[]	2022-01-29 03:00:19.225	2022-01-29 03:00:19.225	\N	\N
98	admin::users.delete	\N	{}	[]	2022-01-29 03:00:19.231	2022-01-29 03:00:19.231	\N	\N
99	admin::roles.create	\N	{}	[]	2022-01-29 03:00:19.237	2022-01-29 03:00:19.237	\N	\N
100	admin::roles.read	\N	{}	[]	2022-01-29 03:00:19.243	2022-01-29 03:00:19.243	\N	\N
101	admin::roles.update	\N	{}	[]	2022-01-29 03:00:19.249	2022-01-29 03:00:19.249	\N	\N
102	admin::roles.delete	\N	{}	[]	2022-01-29 03:00:19.255	2022-01-29 03:00:19.255	\N	\N
103	admin::api-tokens.create	\N	{}	[]	2022-01-29 03:00:19.261	2022-01-29 03:00:19.261	\N	\N
104	admin::api-tokens.read	\N	{}	[]	2022-01-29 03:00:19.267	2022-01-29 03:00:19.267	\N	\N
105	admin::api-tokens.update	\N	{}	[]	2022-01-29 03:00:19.275	2022-01-29 03:00:19.275	\N	\N
106	admin::api-tokens.delete	\N	{}	[]	2022-01-29 03:00:19.281	2022-01-29 03:00:19.281	\N	\N
224	plugin::content-manager.explorer.read	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-02-13 21:39:17.192	2022-02-13 21:39:17.192	\N	\N
116	plugin::content-manager.explorer.create	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-01-30 22:57:20.545	2022-01-30 22:57:20.545	\N	\N
253	plugin::content-manager.explorer.create	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.237	2022-03-12 18:11:48.237	\N	\N
254	plugin::content-manager.explorer.create	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.242	2022-03-12 18:11:48.242	\N	\N
255	plugin::content-manager.explorer.create	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.246	2022-03-12 18:11:48.246	\N	\N
257	plugin::content-manager.explorer.read	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.254	2022-03-12 18:11:48.254	\N	\N
331	plugin::upload.assets.create	\N	{}	[]	2022-10-23 10:39:12.463	2022-10-23 10:39:12.463	\N	\N
258	plugin::content-manager.explorer.read	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.257	2022-03-12 18:11:48.257	\N	\N
259	plugin::content-manager.explorer.read	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.261	2022-03-12 18:11:48.261	\N	\N
261	plugin::content-manager.explorer.update	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.268	2022-03-12 18:11:48.268	\N	\N
262	plugin::content-manager.explorer.update	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.272	2022-03-12 18:11:48.272	\N	\N
117	plugin::content-manager.explorer.read	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-01-30 22:57:20.552	2022-01-30 22:57:20.552	\N	\N
118	plugin::content-manager.explorer.update	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-01-30 22:57:20.558	2022-01-30 22:57:20.558	\N	\N
119	plugin::content-manager.explorer.delete	api::privacybeleid.privacybeleid	{}	[]	2022-01-30 22:57:20.564	2022-01-30 22:57:20.564	\N	\N
124	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-02-05 01:38:10.616	2022-02-05 01:38:10.616	\N	\N
125	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-02-05 01:38:10.622	2022-02-05 01:38:10.622	\N	\N
147	plugin::content-manager.explorer.delete	api::home.home	{}	[]	2022-02-08 23:41:19.591	2022-02-08 23:41:19.591	\N	\N
148	plugin::content-manager.explorer.create	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-02-08 23:53:47.1	2022-02-08 23:53:47.1	\N	\N
149	plugin::content-manager.explorer.read	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-02-08 23:53:47.107	2022-02-08 23:53:47.107	\N	\N
150	plugin::content-manager.explorer.update	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-02-08 23:53:47.112	2022-02-08 23:53:47.112	\N	\N
151	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-02-13 13:15:08.035	2022-02-13 13:15:08.035	\N	\N
152	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-02-13 13:15:08.042	2022-02-13 13:15:08.042	\N	\N
153	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-02-13 13:15:08.048	2022-02-13 13:15:08.048	\N	\N
163	plugin::content-manager.explorer.delete	api::join-us.join-us	{}	[]	2022-02-13 16:38:32.914	2022-02-13 16:38:32.914	\N	\N
263	plugin::content-manager.explorer.update	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-03-12 18:11:48.276	2022-03-12 18:11:48.276	\N	\N
268	plugin::content-manager.explorer.create	api::program.program	{"fields": ["content", "banner"]}	[]	2022-05-28 12:47:18.808	2022-05-28 12:47:18.808	\N	\N
269	plugin::content-manager.explorer.read	api::program.program	{"fields": ["content", "banner"]}	[]	2022-05-28 12:47:18.815	2022-05-28 12:47:18.815	\N	\N
270	plugin::content-manager.explorer.update	api::program.program	{"fields": ["content", "banner"]}	[]	2022-05-28 12:47:18.821	2022-05-28 12:47:18.821	\N	\N
271	plugin::content-manager.explorer.delete	api::program.program	{}	[]	2022-05-28 12:47:18.827	2022-05-28 12:47:18.827	\N	\N
272	plugin::content-manager.explorer.create	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-05-28 12:59:28.1	2022-05-28 12:59:28.1	\N	\N
273	plugin::content-manager.explorer.read	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-05-28 12:59:28.126	2022-05-28 12:59:28.126	\N	\N
333	plugin::upload.assets.download	\N	{}	[]	2022-10-23 10:39:12.469	2022-10-23 10:39:12.469	\N	\N
334	plugin::upload.assets.copy-link	\N	{}	[]	2022-10-23 10:39:12.473	2022-10-23 10:39:12.473	\N	\N
335	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-10-23 10:39:12.476	2022-10-23 10:39:12.476	\N	\N
336	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-10-23 10:39:12.48	2022-10-23 10:39:12.48	\N	\N
274	plugin::content-manager.explorer.update	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-05-28 12:59:28.157	2022-05-28 12:59:28.157	\N	\N
304	admin::project-settings.update	\N	{}	[]	2022-07-15 19:31:27.259	2022-07-15 19:31:27.259	\N	\N
305	admin::project-settings.read	\N	{}	[]	2022-07-15 19:31:27.267	2022-07-15 19:31:27.267	\N	\N
309	plugin::content-manager.explorer.delete	api::fallback.fallback	{}	[]	2022-07-15 20:01:05.378	2022-07-15 20:01:05.378	\N	\N
310	plugin::content-manager.explorer.create	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-16 18:04:42.408	2022-10-16 18:04:42.408	\N	\N
312	plugin::content-manager.explorer.read	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-16 18:04:42.421	2022-10-16 18:04:42.421	\N	\N
314	plugin::content-manager.explorer.update	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-16 18:04:42.428	2022-10-16 18:04:42.428	\N	\N
324	plugin::content-manager.explorer.delete	api::workgroup.workgroup	{}	[]	2022-10-23 10:29:28.915	2022-10-23 10:29:28.915	\N	\N
325	plugin::content-manager.explorer.publish	api::workgroup.workgroup	{}	[]	2022-10-23 10:29:28.918	2022-10-23 10:29:28.918	\N	\N
321	plugin::content-manager.explorer.create	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:29:28.903	2022-10-23 10:29:28.903	\N	\N
322	plugin::content-manager.explorer.read	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:29:28.907	2022-10-23 10:29:28.907	\N	\N
323	plugin::content-manager.explorer.update	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:29:28.911	2022-10-23 10:29:28.911	\N	\N
327	plugin::content-manager.explorer.read	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-10-23 10:30:01.147	2022-10-23 10:30:01.147	\N	\N
328	plugin::content-manager.explorer.update	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-10-23 10:30:01.151	2022-10-23 10:30:01.151	\N	\N
330	plugin::upload.read	\N	{}	[]	2022-10-23 10:39:12.455	2022-10-23 10:39:12.455	\N	\N
332	plugin::upload.assets.update	\N	{}	[]	2022-10-23 10:39:12.466	2022-10-23 10:39:12.466	\N	\N
337	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "firstname", "lastname", "phone"]}	[]	2022-10-23 10:39:12.483	2022-10-23 10:39:12.483	\N	\N
338	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-10-23 10:39:12.486	2022-10-23 10:39:12.486	\N	\N
339	plugin::content-manager.explorer.create	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-10-23 10:39:12.49	2022-10-23 10:39:12.49	\N	\N
340	plugin::content-manager.explorer.read	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-10-23 10:39:12.493	2022-10-23 10:39:12.493	\N	\N
341	plugin::content-manager.explorer.update	api::afdeling.afdeling	{"fields": ["name", "longitude", "latitude", "email", "twitterLink", "facebookLink", "instagramLink", "contactpersonen", "slug", "posts", "about", "banner"]}	[]	2022-10-23 10:39:12.496	2022-10-23 10:39:12.496	\N	\N
342	plugin::content-manager.explorer.delete	api::afdeling.afdeling	{}	[]	2022-10-23 10:39:12.5	2022-10-23 10:39:12.5	\N	\N
343	plugin::content-manager.explorer.create	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-10-23 10:39:12.503	2022-10-23 10:39:12.503	\N	\N
344	plugin::content-manager.explorer.read	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-10-23 10:39:12.507	2022-10-23 10:39:12.507	\N	\N
345	plugin::content-manager.explorer.update	api::confidant.confidant	{"fields": ["name", "email", "phone", "photo", "about"]}	[]	2022-10-23 10:39:12.511	2022-10-23 10:39:12.511	\N	\N
346	plugin::content-manager.explorer.delete	api::confidant.confidant	{}	[]	2022-10-23 10:39:12.514	2022-10-23 10:39:12.514	\N	\N
347	plugin::content-manager.explorer.publish	api::confidant.confidant	{}	[]	2022-10-23 10:39:12.517	2022-10-23 10:39:12.517	\N	\N
348	plugin::content-manager.explorer.create	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:39:12.52	2022-10-23 10:39:12.52	\N	\N
349	plugin::content-manager.explorer.read	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:39:12.526	2022-10-23 10:39:12.526	\N	\N
350	plugin::content-manager.explorer.update	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:39:12.53	2022-10-23 10:39:12.53	\N	\N
351	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-10-23 10:39:12.533	2022-10-23 10:39:12.533	\N	\N
352	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-10-23 10:39:12.537	2022-10-23 10:39:12.537	\N	\N
353	plugin::content-manager.explorer.create	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:39:12.54	2022-10-23 10:39:12.54	\N	\N
354	plugin::content-manager.explorer.read	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:39:12.544	2022-10-23 10:39:12.544	\N	\N
355	plugin::content-manager.explorer.update	api::workgroup.workgroup	{"fields": ["name", "about", "slug"]}	[]	2022-10-23 10:39:12.547	2022-10-23 10:39:12.547	\N	\N
356	plugin::content-manager.explorer.delete	api::workgroup.workgroup	{}	[]	2022-10-23 10:39:12.55	2022-10-23 10:39:12.55	\N	\N
357	plugin::content-manager.explorer.publish	api::workgroup.workgroup	{}	[]	2022-10-23 10:39:12.555	2022-10-23 10:39:12.555	\N	\N
358	plugin::content-manager.explorer.create	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.562	2022-10-23 10:39:12.562	\N	\N
359	plugin::content-manager.explorer.read	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.565	2022-10-23 10:39:12.565	\N	\N
360	plugin::content-manager.explorer.update	api::about-us.about-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.57	2022-10-23 10:39:12.57	\N	\N
361	plugin::content-manager.explorer.delete	api::about-us.about-us	{}	[]	2022-10-23 10:39:12.573	2022-10-23 10:39:12.573	\N	\N
362	plugin::content-manager.explorer.create	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.576	2022-10-23 10:39:12.576	\N	\N
363	plugin::content-manager.explorer.read	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.579	2022-10-23 10:39:12.579	\N	\N
364	plugin::content-manager.explorer.update	api::confidants-page.confidants-page	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.583	2022-10-23 10:39:12.583	\N	\N
365	plugin::content-manager.explorer.delete	api::confidants-page.confidants-page	{}	[]	2022-10-23 10:39:12.586	2022-10-23 10:39:12.586	\N	\N
366	plugin::content-manager.explorer.create	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-23 10:39:12.589	2022-10-23 10:39:12.589	\N	\N
367	plugin::content-manager.explorer.read	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-23 10:39:12.592	2022-10-23 10:39:12.592	\N	\N
368	plugin::content-manager.explorer.update	api::fallback.fallback	{"fields": ["pageBanner"]}	[]	2022-10-23 10:39:12.595	2022-10-23 10:39:12.595	\N	\N
369	plugin::content-manager.explorer.delete	api::fallback.fallback	{}	[]	2022-10-23 10:39:12.598	2022-10-23 10:39:12.598	\N	\N
370	plugin::content-manager.explorer.create	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-10-23 10:39:12.601	2022-10-23 10:39:12.601	\N	\N
371	plugin::content-manager.explorer.read	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-10-23 10:39:12.604	2022-10-23 10:39:12.604	\N	\N
372	plugin::content-manager.explorer.update	api::home.home	{"fields": ["banner", "bannerTitle", "bannerSubtitle", "shortAboutUs"]}	[]	2022-10-23 10:39:12.608	2022-10-23 10:39:12.608	\N	\N
373	plugin::content-manager.explorer.delete	api::home.home	{}	[]	2022-10-23 10:39:12.611	2022-10-23 10:39:12.611	\N	\N
374	plugin::content-manager.explorer.create	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.614	2022-10-23 10:39:12.614	\N	\N
375	plugin::content-manager.explorer.read	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.617	2022-10-23 10:39:12.617	\N	\N
376	plugin::content-manager.explorer.update	api::join-us.join-us	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.621	2022-10-23 10:39:12.621	\N	\N
377	plugin::content-manager.explorer.delete	api::join-us.join-us	{}	[]	2022-10-23 10:39:12.624	2022-10-23 10:39:12.624	\N	\N
378	plugin::content-manager.explorer.create	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-10-23 10:39:12.629	2022-10-23 10:39:12.629	\N	\N
379	plugin::content-manager.explorer.read	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-10-23 10:39:12.632	2022-10-23 10:39:12.632	\N	\N
380	plugin::content-manager.explorer.update	api::privacybeleid.privacybeleid	{"fields": ["content"]}	[]	2022-10-23 10:39:12.635	2022-10-23 10:39:12.635	\N	\N
381	plugin::content-manager.explorer.delete	api::privacybeleid.privacybeleid	{}	[]	2022-10-23 10:39:12.639	2022-10-23 10:39:12.639	\N	\N
382	plugin::content-manager.explorer.create	api::program.program	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.642	2022-10-23 10:39:12.642	\N	\N
383	plugin::content-manager.explorer.read	api::program.program	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.646	2022-10-23 10:39:12.646	\N	\N
384	plugin::content-manager.explorer.update	api::program.program	{"fields": ["content", "banner"]}	[]	2022-10-23 10:39:12.65	2022-10-23 10:39:12.65	\N	\N
385	plugin::content-manager.explorer.delete	api::program.program	{}	[]	2022-10-23 10:39:12.653	2022-10-23 10:39:12.653	\N	\N
390	plugin::upload.read	\N	{}	[]	2022-10-23 10:40:20.348	2022-10-23 10:40:20.348	\N	\N
391	plugin::upload.assets.create	\N	{}	[]	2022-10-23 10:40:20.354	2022-10-23 10:40:20.354	\N	\N
392	plugin::upload.assets.update	\N	{}	[]	2022-10-23 10:40:20.358	2022-10-23 10:40:20.358	\N	\N
393	plugin::upload.assets.download	\N	{}	[]	2022-10-23 10:40:20.363	2022-10-23 10:40:20.363	\N	\N
394	plugin::upload.assets.copy-link	\N	{}	[]	2022-10-23 10:40:20.367	2022-10-23 10:40:20.367	\N	\N
395	plugin::content-manager.explorer.create	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:40:20.371	2022-10-23 10:40:20.371	\N	\N
396	plugin::content-manager.explorer.read	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:40:20.375	2022-10-23 10:40:20.375	\N	\N
397	plugin::content-manager.explorer.update	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:40:20.379	2022-10-23 10:40:20.379	\N	\N
398	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-10-23 10:40:20.383	2022-10-23 10:40:20.383	\N	\N
399	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-10-23 10:40:20.386	2022-10-23 10:40:20.386	\N	\N
400	plugin::upload.read	\N	{}	[]	2022-10-23 10:41:37.426	2022-10-23 10:41:37.426	\N	\N
401	plugin::upload.assets.create	\N	{}	[]	2022-10-23 10:41:37.431	2022-10-23 10:41:37.431	\N	\N
402	plugin::upload.assets.update	\N	{}	[]	2022-10-23 10:41:37.437	2022-10-23 10:41:37.437	\N	\N
403	plugin::upload.assets.download	\N	{}	[]	2022-10-23 10:41:37.441	2022-10-23 10:41:37.441	\N	\N
404	plugin::upload.assets.copy-link	\N	{}	[]	2022-10-23 10:41:37.444	2022-10-23 10:41:37.444	\N	\N
405	plugin::content-manager.explorer.create	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:41:37.448	2022-10-23 10:41:37.448	\N	\N
406	plugin::content-manager.explorer.read	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:41:37.452	2022-10-23 10:41:37.452	\N	\N
407	plugin::content-manager.explorer.update	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage"]}	[]	2022-10-23 10:41:37.455	2022-10-23 10:41:37.455	\N	\N
408	plugin::content-manager.explorer.delete	api::post.post	{}	[]	2022-10-23 10:41:37.46	2022-10-23 10:41:37.46	\N	\N
409	plugin::content-manager.explorer.publish	api::post.post	{}	[]	2022-10-23 10:41:37.463	2022-10-23 10:41:37.463	\N	\N
427	plugin::content-manager.explorer.create	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-11-28 19:32:45.7	2022-11-28 19:32:45.7	\N	\N
428	plugin::content-manager.explorer.create	api::petition-signature.petition-signature	{"fields": ["name", "email", "confirmationCode", "confirmed", "petition", "questionAnswers"]}	[]	2022-11-28 19:32:45.708	2022-11-28 19:32:45.708	\N	\N
429	plugin::content-manager.explorer.create	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2022-11-28 19:32:45.713	2022-11-28 19:32:45.713	\N	\N
430	plugin::content-manager.explorer.read	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-11-28 19:32:45.719	2022-11-28 19:32:45.719	\N	\N
431	plugin::content-manager.explorer.read	api::petition-signature.petition-signature	{"fields": ["name", "email", "confirmationCode", "confirmed", "petition", "questionAnswers"]}	[]	2022-11-28 19:32:45.725	2022-11-28 19:32:45.725	\N	\N
432	plugin::content-manager.explorer.read	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2022-11-28 19:32:45.731	2022-11-28 19:32:45.731	\N	\N
433	plugin::content-manager.explorer.update	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-11-28 19:32:45.737	2022-11-28 19:32:45.737	\N	\N
434	plugin::content-manager.explorer.update	api::petition-signature.petition-signature	{"fields": ["name", "email", "confirmationCode", "confirmed", "petition", "questionAnswers"]}	[]	2022-11-28 19:32:45.742	2022-11-28 19:32:45.742	\N	\N
435	plugin::content-manager.explorer.update	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2022-11-28 19:32:45.746	2022-11-28 19:32:45.746	\N	\N
436	plugin::content-manager.explorer.delete	api::petition.petition	{}	[]	2022-11-28 19:32:45.752	2022-11-28 19:32:45.752	\N	\N
437	plugin::content-manager.explorer.delete	api::petition-signature.petition-signature	{}	[]	2022-11-28 19:32:45.758	2022-11-28 19:32:45.758	\N	\N
438	plugin::content-manager.explorer.publish	api::petition.petition	{}	[]	2022-11-28 19:32:45.763	2022-11-28 19:32:45.763	\N	\N
439	admin::api-tokens.access	\N	{}	[]	2022-11-28 19:32:45.768	2022-11-28 19:32:45.768	\N	\N
440	admin::api-tokens.regenerate	\N	{}	[]	2022-11-28 19:32:45.772	2022-11-28 19:32:45.772	\N	\N
441	plugin::content-manager.explorer.create	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:13.385	2022-12-01 13:05:13.385	\N	\N
442	plugin::content-manager.explorer.read	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:13.392	2022-12-01 13:05:13.392	\N	\N
443	plugin::content-manager.explorer.update	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:13.396	2022-12-01 13:05:13.396	\N	\N
444	plugin::content-manager.explorer.delete	api::petition.petition	{}	[]	2022-12-01 13:05:13.4	2022-12-01 13:05:13.4	\N	\N
445	plugin::content-manager.explorer.publish	api::petition.petition	{}	[]	2022-12-01 13:05:13.405	2022-12-01 13:05:13.405	\N	\N
446	plugin::content-manager.explorer.create	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:25.168	2022-12-01 13:05:25.168	\N	\N
447	plugin::content-manager.explorer.read	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:25.174	2022-12-01 13:05:25.174	\N	\N
448	plugin::content-manager.explorer.update	api::petition.petition	{"fields": ["hook", "signatures", "extraQuestions", "post"]}	[]	2022-12-01 13:05:25.178	2022-12-01 13:05:25.178	\N	\N
449	plugin::content-manager.explorer.delete	api::petition.petition	{}	[]	2022-12-01 13:05:25.183	2022-12-01 13:05:25.183	\N	\N
450	plugin::content-manager.explorer.publish	api::petition.petition	{}	[]	2022-12-01 13:05:25.187	2022-12-01 13:05:25.187	\N	\N
451	plugin::content-manager.explorer.create	api::petition.petition	{"fields": ["hook", "extraQuestions", "post"]}	[]	2023-03-07 17:10:52.846	2023-03-07 17:10:52.846	\N	\N
452	plugin::content-manager.explorer.read	api::petition.petition	{"fields": ["hook", "extraQuestions", "post"]}	[]	2023-03-07 17:10:52.857	2023-03-07 17:10:52.857	\N	\N
453	plugin::content-manager.explorer.update	api::petition.petition	{"fields": ["hook", "extraQuestions", "post"]}	[]	2023-03-07 17:10:52.861	2023-03-07 17:10:52.861	\N	\N
454	plugin::content-manager.explorer.delete	api::petition.petition	{}	[]	2023-03-07 17:10:52.865	2023-03-07 17:10:52.865	\N	\N
455	plugin::content-manager.explorer.publish	api::petition.petition	{}	[]	2023-03-07 17:10:52.87	2023-03-07 17:10:52.87	\N	\N
456	plugin::content-manager.explorer.create	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2023-03-18 16:12:33.533	2023-03-18 16:12:33.533	\N	\N
457	plugin::content-manager.explorer.read	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2023-03-18 16:12:33.545	2023-03-18 16:12:33.545	\N	\N
458	plugin::content-manager.explorer.update	api::post.post	{"fields": ["title", "content", "slug", "afdeling", "author", "banner", "type", "frontpage", "petition"]}	[]	2023-03-18 16:12:33.56	2023-03-18 16:12:33.56	\N	\N
459	plugin::content-manager.explorer.create	api::workgroups-page.workgroups-page	{"fields": ["banner", "content"]}	[]	2023-04-06 18:17:01.702	2023-04-06 18:17:01.702	\N	\N
460	plugin::content-manager.explorer.read	api::workgroups-page.workgroups-page	{"fields": ["banner", "content"]}	[]	2023-04-06 18:17:01.71	2023-04-06 18:17:01.71	\N	\N
461	plugin::content-manager.explorer.update	api::workgroups-page.workgroups-page	{"fields": ["banner", "content"]}	[]	2023-04-06 18:17:01.716	2023-04-06 18:17:01.716	\N	\N
462	plugin::content-manager.explorer.delete	api::workgroups-page.workgroups-page	{}	[]	2023-04-06 18:17:01.722	2023-04-06 18:17:01.722	\N	\N
463	plugin::upload.configure-view	\N	{}	[]	2023-04-06 18:17:01.727	2023-04-06 18:17:01.727	\N	\N
464	admin::transfer.tokens.access	\N	{}	[]	2023-04-06 18:17:01.733	2023-04-06 18:17:01.733	\N	\N
465	admin::transfer.tokens.create	\N	{}	[]	2023-04-06 18:17:01.74	2023-04-06 18:17:01.74	\N	\N
466	admin::transfer.tokens.read	\N	{}	[]	2023-04-06 18:17:01.745	2023-04-06 18:17:01.745	\N	\N
467	admin::transfer.tokens.update	\N	{}	[]	2023-04-06 18:17:01.751	2023-04-06 18:17:01.751	\N	\N
468	admin::transfer.tokens.regenerate	\N	{}	[]	2023-04-06 18:17:01.757	2023-04-06 18:17:01.757	\N	\N
469	admin::transfer.tokens.delete	\N	{}	[]	2023-04-06 18:17:01.764	2023-04-06 18:17:01.764	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.admin_permissions_role_links (permission_id, role_id, id, permission_order) FROM stdin;
209	1	1	\N
210	1	2	\N
211	1	3	\N
212	1	4	\N
213	1	5	\N
17	2	6	\N
18	2	7	\N
19	2	8	\N
20	2	9	\N
21	2	10	\N
217	1	11	\N
221	1	12	\N
222	1	13	\N
223	1	14	\N
224	1	15	\N
225	1	16	\N
58	1	22	\N
59	1	23	\N
61	1	24	\N
63	1	25	\N
64	1	26	\N
65	1	27	\N
66	1	28	\N
67	1	29	\N
68	1	30	\N
69	1	31	\N
70	1	32	\N
71	1	33	\N
72	1	34	\N
73	1	35	\N
74	1	36	\N
75	1	37	\N
76	1	38	\N
77	1	39	\N
78	1	40	\N
79	1	41	\N
80	1	42	\N
81	1	43	\N
82	1	44	\N
83	1	45	\N
84	1	46	\N
85	1	47	\N
86	1	48	\N
87	1	49	\N
88	1	50	\N
91	1	53	\N
92	1	54	\N
93	1	55	\N
94	1	56	\N
95	1	57	\N
96	1	58	\N
97	1	59	\N
98	1	60	\N
99	1	61	\N
100	1	62	\N
101	1	63	\N
102	1	64	\N
103	1	65	\N
104	1	66	\N
105	1	67	\N
106	1	68	\N
253	1	69	\N
116	1	70	\N
117	1	71	\N
118	1	72	\N
119	1	73	\N
254	1	74	\N
255	1	75	\N
257	1	77	\N
124	1	78	\N
125	1	79	\N
258	1	80	\N
259	1	81	\N
261	1	83	\N
262	1	84	\N
263	1	85	\N
147	1	87	\N
148	1	88	\N
149	1	89	\N
150	1	90	\N
151	1	91	\N
152	1	92	\N
153	1	93	\N
163	1	94	\N
189	2	96	\N
190	2	97	\N
268	1	98	\N
269	1	99	\N
270	1	100	\N
271	1	101	\N
272	1	102	\N
273	1	103	\N
274	1	104	\N
304	1	108	\N
305	1	109	\N
309	1	110	\N
310	1	111	\N
312	1	112	\N
314	1	113	\N
321	5	119	\N
322	5	120	\N
323	5	121	\N
324	5	122	\N
325	5	123	\N
327	4	125	\N
328	4	126	\N
330	6	128	\N
331	6	129	\N
332	6	130	\N
333	6	131	\N
334	6	132	\N
335	6	133	\N
336	6	134	\N
337	6	135	\N
338	6	136	\N
339	6	137	\N
340	6	138	\N
341	6	139	\N
342	6	140	\N
343	6	141	\N
344	6	142	\N
345	6	143	\N
346	6	144	\N
347	6	145	\N
348	6	146	\N
349	6	147	\N
350	6	148	\N
351	6	149	\N
352	6	150	\N
353	6	151	\N
354	6	152	\N
355	6	153	\N
356	6	154	\N
357	6	155	\N
358	6	156	\N
359	6	157	\N
360	6	158	\N
361	6	159	\N
362	6	160	\N
363	6	161	\N
364	6	162	\N
365	6	163	\N
366	6	164	\N
367	6	165	\N
368	6	166	\N
369	6	167	\N
370	6	168	\N
371	6	169	\N
372	6	170	\N
373	6	171	\N
374	6	172	\N
375	6	173	\N
376	6	174	\N
377	6	175	\N
378	6	176	\N
379	6	177	\N
380	6	178	\N
381	6	179	\N
382	6	180	\N
383	6	181	\N
384	6	182	\N
385	6	183	\N
390	4	188	\N
391	4	189	\N
392	4	190	\N
393	4	191	\N
394	4	192	\N
395	4	193	\N
396	4	194	\N
397	4	195	\N
398	4	196	\N
399	4	197	\N
400	5	198	\N
401	5	199	\N
402	5	200	\N
403	5	201	\N
404	5	202	\N
405	5	203	\N
406	5	204	\N
407	5	205	\N
408	5	206	\N
409	5	207	\N
427	1	211	1
428	1	212	2
429	1	213	3
430	1	214	4
431	1	215	5
432	1	216	6
433	1	217	7
434	1	218	8
435	1	219	9
436	1	220	10
437	1	221	11
438	1	222	12
439	1	223	13
440	1	224	14
441	4	225	1
442	4	226	2
443	4	227	3
444	4	228	4
445	4	229	5
446	2	230	1
447	2	231	2
448	2	232	3
449	2	233	4
450	2	234	5
451	5	235	1
452	5	236	2
453	5	237	3
454	5	238	4
455	5	239	5
456	2	240	6
457	2	241	7
458	2	242	8
459	1	243	15
460	1	244	16
461	1	245	17
462	1	246	18
463	1	247	19
464	1	248	20
465	1	249	21
466	1	250	22
467	1	251	23
468	1	252	24
469	1	253	25
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-01-29 03:00:18.619	2022-01-29 03:00:18.619	\N	\N
6	Bestuurslid	bestuurslid-l9l7wjjv	Kan alles behalve de techniek beheren	2022-10-23 10:39:12.379	2022-10-23 10:39:12.379	\N	\N
7	Lid	lid-lcvvodfk	Gewoon lid. Heeft geen speciale rechten. Gebruik deze rol om de rechten van mensen te ontnemen, zonder hun account te hoeven verwijderen.	2023-01-14 11:41:30.752	2023-01-14 11:41:30.752	\N	\N
5	Werkgroepvoorzitter	werkgroepvoorzitter-l9l7k1ax	Kan werkgroepen en posts beheren.	2022-10-23 10:29:28.857	2023-03-07 17:10:52.74	\N	\N
4	Contactpersoon	contactpersoon-l9l7hi5v	Kan afdelingen en posts beheren.	2022-10-23 10:27:30.739	2023-03-18 16:12:00.159	\N	\N
2	Redactie	strapi-editor	Kan posts beheren.	2022-01-29 03:00:18.627	2023-03-18 16:12:33.46	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Admin	de Baas	\N	admin@roodjongeren.nl	$2b$10$./4TvWQZLnuCUPIlv8eVXeadxPe5KogwUBwbn4QiFT3g7mquBfpC2	\N	\N	t	f	\N	2022-06-18 19:00:34.028	2022-06-18 19:01:06.238	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.admin_users_roles_links (user_id, role_id) FROM stdin;
1	1
\.


--
-- Data for Name: afdelingen; Type: TABLE DATA; Schema: public; Owner: rood
--
--
-- Data for Name: afdelingen; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.afdelingen (id, name, longitude, latitude, email, twitter_link, facebook_link, instagram_link, created_at, updated_at, created_by_id, updated_by_id, slug, about) FROM stdin;
5	Eindhoven	5.479	51.439	eindhoven@roodjongeren.nl	https://twitter.com/ROOD_Eindhoven	https://www.facebook.com/ROODEindhoven/	https://www.instagram.com/roodeindhoven/	2022-01-30 14:38:15.444	2023-07-12 10:07:33.195	1	1	eindhoven	.
13	Wageningen	5.6653948	51.959186800000005	wageningen@roodjongeren.nl	https://twitter.com/RoodWageningen	https://www.facebook.com/ROODWageningen	\N	2022-08-29 20:20:35.777	2023-11-27 13:44:31.609	1	1	wageningen	ROOD Wageningen werkt op dit moment samen met afdeling Arnhem!
4	Amsterdam	4.8936041	52.3727598	amsterdam@roodjongeren.nl	https://twitter.com/roodamsterdam	https://www.facebook.com/RoodAmsterdam	https://www.instagram.com/rood_amsterdam/	2022-01-30 14:35:29.295	2023-11-29 10:16:19.824	1	1	amsterdam	.
1	Utrecht	5.1215634	52.0907006	utrecht@roodjongeren.nl	https://twitter.com/ROODUtrecht	https://www.facebook.com/ROODUtrecht/	https://www.instagram.com/rood.utrecht/	2022-01-30 14:10:18.829	2023-12-10 14:41:03.487	1	1	utrecht	# Over ROOD Utrecht\n\nROOD Utrecht is de meest actieve politieke jongerenorganisatie van Utrecht! We zijn een onafhankelijke socialistische jongerenorganisatie. We voeren acties voor onze politieke standpunten, we discussiëren over socialisme in de geschiedenis, het heden en de toekomst, en we verspreiden maandelijks onze muurkrant.\n\nActief worden? [Word lid van ROOD!](https://roodjongeren.nl/word-lid)\n\nVragen? Neem vooral contact op! Stuur ons gerust een mailtje, een appje of een DM op Twitter of Instagram.\n\n# Socialisten Utrecht\n\nBen je te oud voor ROOD maar wil je wel actief worden voor het socialisme? Sluit je aan bij [Socialisten Utrecht](https://socialistenutrecht.nl/)! Daarvan is ROOD Utrecht de jongerenorganisatie.
9	Nijmegen	5.8637771	51.8474946	nijmegen@roodjongeren.nl	https://twitter.com/roodnijmegen	https://www.facebook.com/ROODNijmegen	https://www.instagram.com/roodnijmegen/	2022-01-30 14:42:02.314	2024-01-25 08:48:18.291	1	1	nijmegen	\n# **De tofste jongerenorganisatie van Havana aan de Waal!**\n\nROOD is de actiefste politieke jongerenorganisatie van Nijmegen! Samen met activistische jongeren strijden wij voor een betere wereld.\n\n# **ROOD Internationals Nijmegen**\n\nRood Nijmegen has an active English speaking working group! It provides a place for young socialists who do not speak Dutch to learn about and discuss politics and be an active part of Rood on the local and national level. Reach out to learn more!\n\nContact person: Mike Kobrine +491772838463\n\n# **ROOD Socialistisch Pannenkoekenpark**\n\nHet is alweer een jaar geleden dat de pannenkoekenboot Nijmegen\nmoestverlaten door het lage waterpeil. Door klimaatverandering\nstond het water die zomer te laag voor onze prachtige\npannenkoekenboot om te kunnen varen. Dit voorval zal dit jaar\ndaarom herdacht worden door onze jaarlijks pannenkoekenpark.\n\nOp dinsdag 12 september om 18:00 0rganiseert ROOD de\nPannenkoekenavond bij het Hoogeveldt complex. Je kan daar kennis\nkomen maken met onze organisatie en genieten van lekkere\n(vegan) pannenkoeken. Om bijvoorbeeld te leren wat we allemaal\ndoen voor studenten en tegen klimaatverandereing of om gewoon\ngezellig met kameraden een pannenkoekje te smikkelen omdat je \ngeen zin had om te koken.\n\nMeld je aan via deze link:\n[jong.red/pannenkoekentuin](https://jong.red/pannenkoekentuin)\n
17	Enschede	6.8940537	52.2209855	enschede@roodjongeren.nl	\N	\N	\N	2023-06-28 14:51:23.955	2024-01-25 09:23:33.901	1	1	enschede	Enschede is bezig met opstarten, binnenkort meer informatie!\n\nWil je meedoen? Word vandaag nog lid!\n
16	Hilversum/het Gooi	5.173493524521531	52.23158695	hilversum@roodjongeren.nl	https://twitter.com/ROODHilversum	\N	https://www.instagram.com/roodhilversum/	2023-05-30 17:20:45.706	2023-07-30 20:47:38.821	1	1	hilversum	ROOD Hilversum/het Gooi is een aspirant-ROOD-groep. Wil jij actief worden in de strijd voor het socialisme? Neem contact met ons op!
15	Haarlem	4.6388048	52.3885317	haarlem@roodjongeren.nl	https://twitter.com/HaarlemRood	\N	https://instagram.com/rood_haarlem	2023-03-08 09:43:32.387	2023-12-18 11:14:56.421	1	1	haarlem	Groep in oprichting.\n\nOp 19 maart om 19:30 houden we een eerste vergadering voor geïnteresseerden. Hier zullen we bespreken hoe we te werk gaan samen met kameraden uit Amsterdam.\n\nStuur ons een DM voor de locatie!
2	Arnhem	5.9108573	51.984257	arnhem@roodjongeren.nl	https://twitter.com/roodarnhem	https://www.facebook.com/ArnhemROOD	https://www.instagram.com/roodarnhem/	2022-01-30 14:33:01.118	2024-01-04 10:47:48.822	1	1	arnhem	# Over onze groep\n\n>Wist je dat onze ROOD-groep de grootste socialistische organisatie is in Arnhem?\n> - Voormalig contactpersoon, op ieder overleg\n\n\n## Overleggen\n\nIedere woensdagavond komen we bij elkaar in Arnhem om te overleggen. Vaak gaan we voor het overleg nog ergens iets happen, en daarna duiken sommige van ons de stad in om gezellig na te borrelen.\n\nOnze snelgroeiende groep bestaat uit zowel jongere als oudere leden. Iedereen die van ROOD-leeftijd is zal zich thuis kunnen voelen tussen ons.\n\n\n## Filmavond\n\nElke 3e vrijdag van de maand kijken we gezamenlijk een links-georienteerde film met elkaar in buurthuis de Kreek in Oosterbeek. Na afloop houden we een kleine discussie over de film.\n\nWelke film we komende maand gaan kijken kan je zien op onze social media of onder het kopje "laatste nieuws" hieronder. Iedereen is van harte welkom om mee te kijken, ook als je (nog) geen lid bent van ROOD Arnhem!\n
7	Leeuwarden	5.7918548	53.2005936	leeuwarden@roodjongeren.nl	https://twitter.com/ROOD_Leeuwarden	https://www.facebook.com/ROODLjouwert/	https://www.instagram.com/roodleeuwarden/	2022-01-30 14:40:12.397	2023-10-11 19:07:08.568	1	1	leeuwarden	ROOD Leeuwarden is op 25 september 2021 opgericht door twee enthousiaste socialisten uit Leeuwarden. Sindsdien is ROOD Leeuwarden een van de meest actieve politieke jongerenorganisaties van Leeuwarden en omstreken waarbij zowel jongere als oudere leden bij elkaar komen. ROOD Leeuwarden houdt zich bezig met zowel lokale als landelijke problemen zoals armoede, huisvestiging, racisme, arbeidsvoorwaarde en het leenstelsel. \n\nElke dinsdagavond hebben we een overleg om 20:00 in Paddy O’Ryan. Hier bespreken we mogelijke acties en activiteiten om veranderingen te bewerkstelligen en het draagvlak van socialisme te vergroten. Daarnaast organiseren we ook activiteiten voor de gezelligheid zoals een stadswandeling en hebben we een maandelijkse borrel op de eerste vrijdag van de maand in Paddy O’Ryan. ROOD Leeuwarden houd zich ook bezig met educatie door het organiseren van lezingen, het laagdrempelig bieden van socialistische kennis via sociale media en het bespreken van linkse stukken in onze leesgroep Dijkstra. \n\nROOD is voor iedereen tussen de 14 en 28 die geïnteresseerd is in het socialisme. Voel je vrij om een keer aan te schuiven bij een van onze vergaderingen of andere activiteiten! Heb je vragen of wil je meer weten over ons? Zoek dan contact op met ons contactpersoon of stuur ons een bericht via sociale media.\n
3	Rotterdam	4.47775	51.9244424	rotterdam@roodjongeren.nl	https://twitter.com/ROOD_Rotterdam	https://www.facebook.com/rood.rotterdam	https://www.instagram.com/roodrotterdam/	2022-01-30 14:34:48.584	2024-04-15 17:24:34.553	1	1	rotterdam	# Over ons\n\n*For English see below*\n\nWij zijn ROOD Rotterdam, een gezellige socialistische jeugdgroep gevestigd in hartje Rotterdam, met leden uit Rockanje tot Dordrecht, en ver daarbuiten! We zijn een diverse jongerengroep met leden van 14-28 jaar. Samen met deze leden bouwen we aan een betere, niet-kapitalistische wereld.  \n\nMet ROOD Rotterdam organiseren we politieke acties, interessante lezingen en gezellige events. We creëren een fijne omgeving waar je samen kan leren over politiek en het socialisme, en waar je kameraden voor het leven maak.\n\n## Overleggen\n\nBij ROOD Rotterdam komen we elke dinsdagavond samen om onze ideeën tot leven te brengen. We smeden plannen voor impactvolle campagnes, brainstormen in onze commissies, en houden onze beweging in beweging tijdens het gezellige kaderoverleg. Alle ideeën en initiatieven zijn bij ons welkom, en iedereen heeft evenveel zeggenschap.\n\n## Ontwikkeling en community\n\n>"The philosophers have only interpreted the world, in various ways. The point, however, is to change it."\n Karl Marx\n \n### Theorie\n In onze maandagavond Leesgroep, georganiseerd door de educatiecommissie, duiken we samen in boeken en ideeën. Hier komen socialistische jongeren samen, van beginners tot experts. Geen voorkennis vereist - samen leren en groeien we.\n\n### Praktijk\n Op straat zijn we actief met petities, flyers, en gesprekken om onze ideeën te verspreiden. Vanaf het begin krijg je ondersteuning en leer je nieuwe vaardigheden door te doen. Na elke activiteit is er ruimte om ervaringen te delen en van elkaar te leren.\n\n### Community\n ROOD is niet alleen een politieke beweging, maar ook een gemeenschap. Filmavonden, sportactiviteiten, uitstapjes, en binnenkort zelfs een gezamenlijke keuken - allemaal om een hechte en fijne gemeenschap te bouwen. Sluit je aan, maak vrienden, en strijd samen tegen het kapitalisme.\n\nBij ROOD Rotterdam ben je niet zomaar een lid, maar een waardevol onderdeel van onze beweging. Kom langs, ontmoet gelijkgestemden, en laten we samen bouwen aan een eerlijke, rechtvaardige stad.\n\n_Solidair, Strijdbaar, Socialistisch - ROOD Rotterdam_\n\n# About us\nWe are ROOD Rotterdam, a cozy socialist youth group nestled in the heart of Rotterdam, with members from Rockanje to Dordrecht, and beyond! Our diverse group ranges from ages 14 to 28. Together, we're shaping a better, non-capitalist world.\n\nWith ROOD Rotterdam, we organize political actions, captivating lectures, and delightful events. We cultivate a welcoming space where you can learn about politics, socialism, and forge lifelong friendships.\n\n## Meetings\n Every Tuesday evening, ROOD Rotterdam comes together to bring our ideas to life. We craft plans for impactful campaigns, brainstorm in our committees, and keep our movement lively during our engaging core meetings. Here, all ideas are welcome, and everyone has an equal voice.\n\n## Personal development and community\n \n>"The philosophers have only interpreted the world, in various ways. The point, however, is to change it."\n\nKarl Marx\n\n### Theory\n Join our Monday evening Reading Group, organized by the education committee, where we dive into books and ideas together. Socialist youth, from beginners to experts, gather here. No prior knowledge needed - we learn and grow together.\n\n### Praxis\n On the streets, we're active with petitions, flyers, and conversations to spread our ideas. From the get-go, you'll receive support and acquire new skills through action. After each activity, there's room to share experiences and learn from one another.\n\n### Community\nROOD is more than a political movement; it's a vibrant community. Film nights, sports activities, outings, and soon, a shared kitchen - all to build a strong and welcoming community. Join us, make friends, and together, let's fight against capitalism.\n\nAt ROOD Rotterdam, you're not just a member, but a valuable part of our movement. Come by, meet like-minded individuals, and let's build a fair and just city together.\n\n_Solidarity, Determination, Socialist - ROOD Rotterdam_
6	Groningen	6.5680077	53.2190652	groningen@roodjongeren.nl	https://twitter.com/roodgroningen	https://www.facebook.com/ROODGroningen/	https://www.instagram.com/rood.groningen	2022-01-30 14:39:23.704	2023-11-23 10:06:49.24	1	1	groningen	![Knipsel-min.PNG](https://roodjongeren.nl/backend/uploads/Knipsel_min_d81cf58a39.PNG)\n# Over ROOD Groningen\n**Internationals welcome!**\nROOD Groningen houdt van gezelligheid, actievoeren, en marxisme. Wij zijn een onafhankelijke jongeren organisatie die zich inzet voor het socialisme. Wat ons onderscheid van andere PJO's is dat we niet eeuwig vergaderen, maar ook echt actie voeren. We houden ons bezig met de wooncrisis, feminisme, werkomstandigheden, lhbti+ rechten, problemen van studenten en nog veel meer.\n\nIedereen is welkom en we ontmoeten je graag. Kom een keer langs op een van onze overleggen elke maandag om 19.30. App/bel/mail vooral even :)\n\n![IMG-20210703-WA0012.jpg](https://roodjongeren.nl/backend/uploads/IMG_20210703_WA_0012_c593239f1d.jpg)\n\n# Onze acties\nRecent initieerde we [Shelter Our Students](https://roodjongeren.nl/post/shelter-our-students-s-o-s-heeft-al-200-aanmeldingen) waarbij we 250+ dakloze studenten een slaapplek gaven en we het academiegebouw hebben bezet We zijn onderdeel van [Comité Vrouwenstrijd Groningen](https://roodjongeren.nl/post/post-1) waar wij ons inzetten voor het feminisme. We houden ons ook bezig met de wooncrisis, bijvoorbeeld door het organiseren van de[ Huisjesmelker van het Jaar Verkiezing](https://roodjongeren.nl/post/stemmen) en het [Woonstrijd Groningen](https://roodjongeren.nl/post/woonstrijd) protest. Daarnaast hebben we ook marxistische scholingen, gezellige borrels en nog veel meer!\n\n![WhatsApp Image 2021-10-13 at 20.39.20.jpeg](https://roodjongeren.nl/backend/uploads/Whats_App_Image_2021_10_13_at_20_39_20_fdafd3373b.jpeg)\n\n# Marxistische Leesgroep Adema\n[Marxistische Leesgroep Adema](https://adema.leesgroep.online/) is een studieclub voor Groningse socialisten. Sinds januari 2020 lezen we om de week teksten die betrekking hebben op het marxisme, sociale strijd en de geschiedenis van de vakbeweging. Hieronder valt alles van klassieke marxistische teksten tot moderne analyses van gender en identiteit vanuit een links perspectief. Voor een overzicht van wat we tot nu toe hebben gelezen klik je [hier](https://adema.leesgroep.online/archief/).
18	Nijmegen (International)	5.8563405713034715	51.8424004	nijmegen.int@roodjongeren.nl	\N	\N	\N	2024-01-25 08:54:29.277	2024-01-25 09:28:52.446	1	1	nijmegen-international	[Placeholder]
14	Zwolle	6.0830219	52.5167747	zwolle@roodjongeren.nl	https://twitter.com/ROOD_Zwolle	https://www.facebook.com/RoodZwolle	https://instagram.com/rood.zwolle?igshid=YmMyMTA2M2Y=	2022-11-08 15:36:02.429	2024-02-14 12:02:28.059	1	1	zwolle	Bij ROOD Zwolle strijden wij voor socialisme door middel van lezingen geven, verschillende demo’s als groep bij te wonen, posters en stickers te verspreiden, maar ook door theorie met elkaar te lezen en te bespreken binnen onze leesgroep. Verder maken wij regelmatig banners met socialistische leuzen en sinds kort zijn wij ook bezig met een muurkrant. Hierbij schrijven wij over actuele gebeurtenissen en geven hieraan een linkse analyse. Je zult ook vaak genoeg een socialistische borrel of een filmavond tegen zien komen. We kijken enorm uit naar het vergroten van onze beweging en onze groep! \n\nWarme en linkse groet, ROOD Zwolle
\.


--
-- Data for Name: confidants; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.confidants (id, name, email, phone, about, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
2	Bram	bram@example.com	nvt	Hoi dit is een voorbeeld contactpersoon	2022-02-13 18:21:01.534	2022-06-18 19:14:11.86	2022-02-13 18:21:03.173	\N	1
\.


--
-- Data for Name: confidants_pages; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.confidants_pages (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Een vertrouwenspersoon is iemand die ervoor zorgt dat leden een plek hebben waar ze hun zorgen omtrent (seksuele) intimidatie, agressie, geweld en discriminatie kwijt kunnen. Ook kunnen de leden hun zorgen over ongewenst gedrag zoals pesten of het misbruik van een dominante positie kwijt bij een vertrouwenspersoon.\n\nHet protocol waarnaar de vertrouwenspersonen handelen is hier te vinden: [Vertrouwenspersoonprotocol.pdf](/backend/uploads/Vertrouwenspersoonprotocol_ROOD_c4f11b545c.pdf).	2022-02-13 19:25:27.493	2023-03-18 16:23:31.43	1	1
\.


--
-- Data for Name: fallbacks; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.fallbacks (id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2022-07-15 19:01:07.885	2022-07-15 19:04:09.234	1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
72	frog_fashion.jpg	frog_fashion.jpg	frog_fashion.jpg	640	640	{"small": {"ext": ".jpg", "url": "/uploads/small_frog_fashion_b9f51e51f1.jpg", "hash": "small_frog_fashion_b9f51e51f1", "mime": "image/jpeg", "name": "small_frog_fashion.jpg", "path": null, "size": 20.92, "width": 500, "height": 500}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_frog_fashion_b9f51e51f1.jpg", "hash": "thumbnail_frog_fashion_b9f51e51f1", "mime": "image/jpeg", "name": "thumbnail_frog_fashion.jpg", "path": null, "size": 3.99, "width": 156, "height": 156}}	frog_fashion_b9f51e51f1	.jpg	image/jpeg	28.51	/uploads/frog_fashion_b9f51e51f1.jpg	\N	local	\N	2022-06-18 19:14:08.429	2022-06-18 19:14:08.429	1	1
73	banner_2996c8bb91.webp	banner_2996c8bb91.webp	banner_2996c8bb91.webp	2880	1150	{"large": {"ext": ".webp", "url": "/uploads/large_banner_2996c8bb91_68eed244ed.webp", "hash": "large_banner_2996c8bb91_68eed244ed", "mime": "image/webp", "name": "large_banner_2996c8bb91.webp", "path": null, "size": 30.88, "width": 1000, "height": 399}, "small": {"ext": ".webp", "url": "/uploads/small_banner_2996c8bb91_68eed244ed.webp", "hash": "small_banner_2996c8bb91_68eed244ed", "mime": "image/webp", "name": "small_banner_2996c8bb91.webp", "path": null, "size": 14.88, "width": 500, "height": 200}, "medium": {"ext": ".webp", "url": "/uploads/medium_banner_2996c8bb91_68eed244ed.webp", "hash": "medium_banner_2996c8bb91_68eed244ed", "mime": "image/webp", "name": "medium_banner_2996c8bb91.webp", "path": null, "size": 22.32, "width": 750, "height": 299}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_banner_2996c8bb91_68eed244ed.webp", "hash": "thumbnail_banner_2996c8bb91_68eed244ed", "mime": "image/webp", "name": "thumbnail_banner_2996c8bb91.webp", "path": null, "size": 6.66, "width": 245, "height": 98}}	banner_2996c8bb91_68eed244ed	.webp	image/webp	82.17	/uploads/banner_2996c8bb91_68eed244ed.webp	\N	local	\N	2022-06-18 19:27:19.27	2022-06-18 19:27:19.27	1	1
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.files_related_morphs (file_id, related_id, related_type, field, "order") FROM stdin;
72	2	api::confidant.confidant	photo	1
72	4	api::afdeling.afdeling	banner	1
73	1	api::home.home	banner	1
73	1	api::about-us.about-us	banner	1
73	1	api::program.program	banner	1
73	1	api::support-us.support-us	banner	1
73	1	api::confidants-page.confidants-page	banner	1
73	1	api::join-us.join-us	banner	1
73	1	api::fallback.fallback	pageBanner	1
\.


--
-- Data for Name: homes; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.homes (id, banner_title, banner_subtitle, short_about_us, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	ROOD	Socialistische Jongeren	# "Wij zijn de klassenbewuste jeugd van Nederland!"\n\nPrincipieel democratisch en socialistisch, wij zetten ons in voor de belangen van de werkende klassen in Nederland:\\\nVoor vrijheid, voor gelijkheid, voor arbeid, tegen racisme, tegen oorlog en tegen onrecht.\\\nStrijd je mee met ons?	2022-02-08 23:45:01.248	2023-03-18 15:51:36.863	1	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	Dutch (Netherlands) (nl-NL)	nl-NL	2022-01-30 16:23:20.889	2022-01-30 16:23:26.109	1	1
\.


--
-- Data for Name: join_uses; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.join_uses (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Als lid van ROOD ben je onderdeel van een beweging die strijdt voor een andere wereld, en help jij mee om fundamentele verandering voor elkaar te krijgen. We houden je op de hoogte van acties waar je aan kan meedoen en mag je meedenken en -beslissen op onze landelijke en lokale ledenvergaderingen.\n\nROOD-leden zijn vooral actief in hun lokale groepen. In hun eigen plaats organiseren ze zich en voeren ze actie. Kijk [hier](/afdelingen) bij welke groep jij je kan aansluiten!\n\nBen je ouder dan 28, maar wil je ons toch steunen? Dan zijn er twee opties:\n- Steunlidmaatschap. Steunleden steunen ROOD financieel. In ruil daarvoor houden we je op de hoogte van onze acties en activiteiten. Je kunt ook direct aan ons doneren via _NL35 RABO 0321 5128 12_ op naam van _ROOD, Socialistische Jongeren_.\n- Lid worden van De Socialisten. ROOD is de jongerenorganisatie van De Socialisten, een ‘partij-in-oprichting’, die dezelfde strijd voert als wij. Sluit je aan! \n\n[Hier](https://roodjongeren.nl/backend/uploads/Statuten_aef8c5ea66.pdf) vind je onze statuten en [hier](https://roodjongeren.nl/backend/uploads/Huishoudelijk_Reglement_5859436f30.pdf) ons huishoudelijk reglement.	2022-02-13 16:41:18.424	2023-10-23 10:56:39.567	1	1
\.

--
-- Data for Name: petitions; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.petitions (id, hook, extra_questions, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
2	kosteloze toegang tot menstruatieproducten	[{"choices": ["Radboud Universiteit", "HAN", "ROC", "Anders", "Geen student"], "question": "Op welke onderwijsinstituut studeer je?", "required": true}]	2022-12-01 13:26:09.079	2022-12-02 14:49:14.197	2022-12-01 14:13:53.33	1	1
\.


--
-- Data for Name: petitions_post_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.petitions_post_links (id, petition_id, post_id) FROM stdin;
2	2	361
\.

--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.posts (id, content, slug, created_at, updated_at, published_at, created_by_id, updated_by_id, title, author, type, frontpage) FROM stdin;
469	**Begin dit studiejaar werd in Nijmegen door vijf studenten Socialistische Studentenvereniging Het Spook opgericht. Hoewel dit eerst slechts als leesgroep van Marx' _De achttiende Brumaire van Louis Bonaparte_ was bedoeld, is het inmiddels een volwaardige vereniging van studenten met een interesse in marxisme, die een socialistische studentencultuur probeert te creëren en wekelijkse borrels, lezingen en andere activiteiten organiseert.**\n\nStudentenverenigingen pretenderen over het algemeen apolitieke verenigingen te zijn. Als historisch materialisten stellen we dat het verenigen van een groep jongeren, allemaal uit hetzelfde sociaal-culturele milieu, onvermijdelijk politiek is! Op de campus van de Radboud Universiteit merkten we dat het bewustzijn van dit feit groeide, maar nog geen georganiseerde vorm had. Dit is wat SSV Het Spook wil zijn.\n\nStudentenverenigingen vormen veelal kleinburgerlijke kliekjes met leden die elkaar 'omhoog werken' in de maatschappij, gebonden door ontgroening, gedeelde winst en borrels zullen de leden elkaar voor het leven niet meer loslaten - een manier om de bourgeoisie de _in-group_ en de werkende mens de _out-group_ te maken. Maar, zo stellen wij, een groep studenten die samen borrelen hoeft dat niet te zijn. Sterker nog: het kan op zijn kop gedraaid worden! SSV Het Spook is een groep die juist een socialistische studentencultuur creëert waarin linkse studenten elkaar kunnen ontmoeten en binden.\n\nEen cultuur waar de studentikoziteit een bron van gelach is, de zelfbenoemde praeses met zes titels een sukkel, en de huisjesmelker de gezworen vijand van de student. Waar Cara Pils, Klokbier en huismerkcola de geprezen vruchten van onze arbeid, de _Internationale_ en _De Lange Weg_ ons _Io Vivat_ en _Gaudeamus igitur_, en de studenten trotse proletariërs zijn. Een cultuur waar de student met kleinburgerlijke aspiraties en een confectiepak _uit_ is, en de arbeider-student met een T-shirt en een lening _in_ is.\n\nWaar burgerlijke studentenverenigingen hun studenten efficiënt laten doorstromen naar een advocatenbureau, laat SSV Het Spook haar leden kennis maken met socialistische activisten en maakt zij op die manier hun politiek werk ook efficiënter.\n\nMaar bij het verzamelen van een bepaald type student, hoort het ontstaan en verdedigen van een bepaald soort wetenschap. De tweede functie van SSV Het Spook is om ons te verdiepen in socialistische wetenschapsmethoden en theorie, voornamelijk het historisch materialisme. Dit doen we door lezingen te organiseren die problemen vanuit die invalshoek bespreken, door discussieavonden en leesgroepen, maar ook gewoon door erover te praten op onze wekelijkse borrel. Het Spook helpt daardoor met het vormen en versterken van onze wetenschappelijke analyse, maar ook om deze methoden te verdedigen in een hoger onderwijs waar ze veel te weinig serieus genomen worden. Een hoger doel van Het Spook is dan ook om het tij in de strijd om marxisme op de campus te keren, door samen de waarde van die methode te verheffen en het weer normaal te maken in de collegezalen.\n\nWe hebben het afgelopen jaar een mooie startsprint gemaakt, met veel enthousiaste studenten hebben we de organisatie van de grond gekregen en vette activiteiten opgezet. Volgend jaar gaan we volledig inzetten op groei. Het Spook moet een begrip worden onder studenten zoals de andere studentenverenigingen dat zijn, nog algemener en gewoner dan _Karpe Noktem_ of _Carolus Magnus_.[^1] Iets waar een jonge radicaal die van de middelbare school naar de ROC, HAN of RU gaat, graag lid van wil worden. \n\nVolg ons daarom op Instagram (@ssv_het_spook) en sluit je aan bij een van onze activiteiten!\n\nInteresse om lid te worden? Stuur ons een DM op Instagram!\n\n[^1]: Wat ons verbaasde is dat de Karel de Grote waar hiermee naar verwezen wordt _niet_ Karl Marx is!	Het-Spook	2024-04-17 15:40:07.856	2024-04-18 21:51:21.793	2024-04-17 15:41:25.92	1	1	Socialistische Studentenvereniging Het Spook waart over de Nijmeegse campus	Kollontai I, Voorzitter van SSV Het Spook	inzending	t
475	_Dit artikel is gepubliceerd in de april editie van De Bode Arnhem. Wil je meer lezen? [Schrijf je in voor onze nieuwsbrief!](https://forms.gle/ymDBharuijwDi95W8)_\n\n**Het Openbaar Vervoer (OV) vormt een belangrijk onderdeel van het dagelijks leven voor miljoenen mensen in Nederland. Echter, de veiligheid van OV-medewerkers en passagiers wordt steeds vaker bedreigd door gevallen van geweld en mishandeling. In het licht van deze verontrustende signalen hebben veel mensen in de media voorgesteld dat het verstrekken van extra wapens aan OV-medewerkers een oplossing zou kunnen zijn. Maar is dit echt de juiste aanpak?**\n\nDe roep om extra wapens voor OV-medewerkers komt voort uit een begrijpelijke wens om de veiligheid te verhogen en medewerkers te beschermen tegen potentiële dreigingen. Het argument achter deze suggestie is dat gewapende medewerkers beter in staat zouden zijn om zichzelf te verdedigen en om te gaan met gewelddadige situaties die zich kunnen voordoen tijdens hun werk. Echter, als je dieper kijkt, blijkt dat het verstrekken van extra wapens aan OV-medewerkers een complexe kwestie is met aanzienlijke risico's en mogelijke negatieve gevolgen.\n\nEen van de belangrijkste zorgen is de veiligheid van zowel de medewerkers als de passagiers. Het introduceren van wapens in een omgeving waar al spanningen en conflicten kunnen ontstaan, verhoogt het risico op escalatie van geweldsincidenten. Een situatie die aanvankelijk beheersbaar lijkt, kan snel uit de hand lopen wanneer wapens worden gebruikt. Zoals ook is bewezen: wie een wapen heeft, gebruikt hem ook sneller dan nodig.\n\nEen andere cruciale overweging is het potentieel voor misbruik en discriminatie. Het is bekend dat het gebruik van geweld door wetshandhavers kan leiden tot misbruik van macht en onrechtvaardige behandeling van minderheidsgroepen. Door OV-medewerkers te bewapenen, kan dit risico worden verhoogd, vooral gezien het gebrek aan duidelijke richtlijnen en protocollen voor het gebruik van wapens in deze context. Dit kan leiden tot oneerlijke behandeling van bepaalde passagiers op basis van vooroordelen of discriminatie.\n\nIn plaats van te vertrouwen op extra wapens als een snelle oplossing, moeten we streven naar meer humane benaderingen om de veiligheid in het OV te verbeteren. Dit omvat investeringen in betere beveiligingsmaatregelen, zoals bijvoorbeeld alarmknoppen, die kunnen helpen bij het voorkomen van incidenten en het snel reageren op noodsituaties. Bovendien is het van vitaal belang om te investeren in training en ondersteuning voor OV-medewerkers, inclusief conflictoplossing en (pedagogische) de-escalatietechnieken, om hen in staat te stellen effectief om te gaan met potentieel gevaarlijke situaties zonder naar wapens te hoeven grijpen.\n\nTot slot is het essentieel om de bredere sociale en economische oorzaken van geweld in het OV aan te pakken, zoals armoede, sociale uitsluiting en gebrek aan toegang tot sociale voorzieningen. Door te investeren in deze dingen kunnen we een veiligere en meer inclusieve omgeving creëren voor zowel OV-medewerkers als passagiers.\n\nKortom, het verstrekken van extra wapens aan OV-medewerkers is geen duurzame oplossing voor het probleem van geweld in het OV. In plaats daarvan moeten we streven naar meer inclusieve benaderingen die de veiligheid verbeteren zonder het risico op escalatie van geweld te vergroten. Alleen door samen te werken en proactief te investeren in preventie en de-escalatie kunnen we een veiliger en gastvrijer OV creëren voor iedereen.\n	geen-wapens-in-ov	2024-04-28 07:46:20.893	2024-04-28 07:46:24.851	2024-04-28 07:46:24.847	1	1	De Bode Arnhem: Geen Wapens in het OV!	ROOD Arnhem	inzending	f
476	**Afgelopen zaterdag 4 mei, op de dag van de Nationale Dodenherdenking heeft de Utrechtse afdeling van de socialistische jongerenbeweging ROOD een straatnaambord in Tuindorp vervangen. De straat was vernoemd naar oud-burgemeester van Maartensdijk, en mede-oprichter van de NSB, Coenraad van der Voort van Zijp. ROOD heeft de straatnaam nu vervangen door ‘Hannie Schaftdreef’.**\n\n![Hannie Schaftdreef](https://roodjongeren.nl/backend/uploads/Hannie_Schaftdreef_3b28e160e7.jpg)\n\n## Wie was burgemeester Van der Voort van Zijp?\n\nCoenraad van der Voort van Zijp was burgemeester van Maartensdijk van 1924 tot aan zijn dood in 1935. De wijk Tuindorp hoort nu bij Utrecht, maar is in de jaren ’30 gebouwd in de gemeente Maartensdijk met Van der Voort als drijvende kracht, om kapitaalkrachtige Utrechters naar de gemeente aan te trekken.\n\nMaar naast burgemeester van Maartensdijk was Van der Voort ook een mede-oprichter van de Nationaal-Socialistische Beweging in Nederland, de NSB. In 1925, vóór de NSB, was hij een van de initiatiefnemers voor de oprichting van de ‘Nationale Unie’ een rechtse beweging die zichzelf als fascistische karakteriseerde. Later, in 1931 was Van der Voort betrokken bij de oprichting van ‘Vereniging de Bezem’, weer een andere fascistische politieke organisatie. De Bezem kreeg echter nooit erg veel aanhang en dus gingen Van der Voort en medestanders op zoek naar een geschikt ‘leidersfiguur’. Zo kwamen ze terecht bij Anton Mussert, die Van der Voort al goed kende, en is de NSB ontstaan. De burgemeester was een vooraanstaand lid binnen de partij en sprak vaak op (openbare) bijeenkomsten.\n\nVan der Voort was op 28 december 1934 gedwongen om zijn lidmaatschap van de NSB op te zeggen als hij burgemeester wilde blijven, omdat er een verbod kwam voor ambtenaren om lid te zijn van de partij. Dat was acht dagen nadat Van der Voort door de minister was aangesproken op antisemitische uitlatingen die hij gedaan had op een openbare bijeenkomst van de NSB.\n\nOok al was hij geen lid meer, Van der Voort heeft tot aan zijn dood het fascistische, antisemitische gedachtegoed van de NSB aangehangen. Na de dood van de burgemeester schreef Anton Mussert: “zijn hart bleef tot het laatst toe natuurlijk bij ons, in het verbeiden van het oogenblik […] wanneer hij weer vrij zou zijn!” waar Mussert uiteraard mee bedoelde: het moment dat hij weer lid van de partij zou mogen zijn. Bij zijn begrafenis waren minstens 700 NSB’ers aanwezig.\n\n## Over de actie van ROOD\nROOD Utrecht heeft nu dus de straatnaam ‘aangepast’ door een sticker over het straatnaambordje heen te plakken. In een open brief roept ROOD de gemeente op om de nieuwe straatnaam over te nemen.\n\n“Wij vinden het niet gepast om deze man te eren met een straatnaam. Wij hopen ook dat de gemeente deze opvatting deelt. Daarom hebben wij vandaag, op de dag dat wij de slachtoffers van fascisme herdenken, de straatnaam vervangen.”\n\nOok vraagt ROOD de gemeente om een informatiebordje te plaatsen over oud-burgemeester Van der Voort van Zijp en de geschiedenis van Tuindorp voor en tijdens de Tweede Wereldoorlog, zodat deze geschiedenis niet vergeten wordt.\n\nROOD Utrecht heeft er voor gekozen om de straat te vernoemen naar Hannie Schaft. Hannie Schaft was een vrouwelijke verzetsstrijder in de Tweede Wereldoorlog voor de CPN. Tijdens de oorlog heeft zij talloze verzetsdaden gepleegd tegen de nazi’s en collaborateurs. Op 21 maart 1945 is zij gearresteerd in Haarlem, en op 17 april 1945 door een NSB’er geëxecuteerd, drie weken voor het einde van de oorlog.\n\n# Open brief aan de gemeente\n\nGeachte gemeente Utrecht,\n\nZoals jullie waarschijnlijk weten bevindt zich in onze stad Utrecht een straat in de\nwijk Tuindorp vernoemt naar Coenraad van der Voort van Zijp, oud-burgemeester van\nMaartensdijk. Van der Voort was burgemeester van Maartensdijk van 1924 tot aan zijn\ndood in 1935. De wijk Tuindorp hoort nu bij Utrecht, maar is in de jaren ’30 gebouwd in\nde gemeente Maartensdijk met Van der Voort als drijvende kracht, omdat de gemeente\nkapitaalkrachtige Utrechters wilde aantrekken.\n\nMaar naast burgemeester van Maartensdijk was Van der Voort ook een mede-oprichter\nvan de Nationaal-Socialistische Beweging in Nederland, de NSB. In 1925, vóór de NSB,\nwas hij een van de initiatiefnemers voor de oprichting van de ‘Nationale Unie’ een rechtse\nbeweging die zichzelf als fascistische karakteriseerde. Later, in 1931 was Van der Voort\nbetrokken bij de oprichting van ‘Vereniging de Bezem’, weer een andere fascistische\npolitieke organisatie. De Bezem kreeg echter nooit erg veel aanhang en dus gingen Van\nder Voort en medestanders op zoek naar een geschikt ‘leidersfiguur’. Zo kwamen ze\nterecht bij Anton Mussert, die Van der Voort al goed kende, en is de NSB ontstaan. De\nburgemeester was een vooraanstaand lid binnen de partij en sprak vaak op (openbare)\nbijeenkomsten.\n\nVan der Voort was op 28 december 1934 gedwongen om zijn lidmaatschap van de NSB op\nte zeggen als hij burgemeester wilde blijven, omdat er een verbod kwam voor ambtenaren\nom lid te zijn van de partij. Dat was acht dagen nadat Van der Voort door de minister\nwas aangesproken op antisemitische uitlatingen die hij gedaan had op een openbare\nbijeenkomst van de NSB. Dat deed de minister niet vanzelf helaas, daar waren eerst\nKamervragen van de SDAP voor nodig.\n\nOok al was hij geen lid meer, Van der Voort heeft tot aan zijn dood het fascistische,\nantisemitische gedachtegoed van de NSB aangehangen. Na de dood van de burgemeester\nschreef Anton Mussert: “zijn hart bleef tot het laatst toe natuurlijk bij ons, in het\nverbeiden van het oogenblik [. . . ] wanneer hij weer vrij zou zijn!” waar Mussert uiteraard\nmee bedoelde: het moment dat hij weer lid van de partij zou mogen zijn. Bij zijn begrafenis\nwaren minstens 700 NSB’ers aanwezig.\n\nAls ROOD Utrecht vinden wij dat het niet gepast is om deze man te eren met een\nstraatnaam. Wij hopen ook dat de gemeente deze opvatting deelt. Daarom hebben\nwij vandaag, op de dag dat wij de slachtoffers van fascisme herdenken, de straatnaam\nvervangen.\n\nDe straat heet nu de Hannie Schaftdreef.\n\nHannie Schaft was een vrouwelijke verzetsstrijder in de Tweede Wereldoorlog voor de CPN.\nTijdens de oorlog heeft zij talloze verzetsdaden gepleegd tegen de nazi’s en collaborateurs.\nOp 21 maart 1945 is zij helaas gearresteerd in Haarlem, en op 17 april 1945 door een\nNSB’er geëxecuteerd, drie weken voor het einde van de oorlog.\n\nWij vinden het belangrijk om mensen zoals Hannie Schaft te vereren. Mensen die zich\nverzetten tegen fascisme en antisemitisme, in plaats van degenen die het verkondigden.\nZeker vandaag.\n\nWij willen daarom de gemeente oproepen om de nieuwe naam van de straat in\nhaar systemen te verwerken. Daarnaast nodigen we de gemeente uit om in de straat\neen informatiebordje te plaatsen over oud-burgemeester Van der Voort van Zijp en\nde geschiedenis van Tuindorp voor en tijdens de Tweede Wereldoorlog, zodat deze\ngeschiedenis niet vergeten wordt.\n\nMet vriendelijke groet,\n\nROOD Utrecht	rood-utrecht-vervangt-straatnaam-vernoemd-naar-mede-oprichter-nsb	2024-05-05 12:57:19.826	2024-05-05 12:57:56.642	2024-05-05 12:57:56.636	1	1	ROOD Utrecht vervangt straatnaam vernoemd naar mede-oprichter NSB	ROOD Utrecht	nieuws	t
361	# Pak menstruatiearmoede serieus aan!\n\nDe HAN ROC en RU missen in hun faciliteiten een belangrijke voorziening: kosteloze toegang tot menstruatieproducten. Net zo onmisbaar als toiletpapier, en toch ontbreekt het in deze toiletten. Voor hygiënische overwegingen en het bestrijden van menstruatiearmoede proberen we met deze actie een belangrijke eis over te brengen. Alle scholen in Nijmegen moeten menstruatieproducten aanbieden in alle toiletten. \nMenstrueren is geen keuze maar de kosten die eraan verbonden zitten, zijn wel verplicht om ieder maand te maken.\n\nLevensonderhoudkosten zijn aan het stijgen en daarom redden mensen die al financiële problemen hebben het soms niet om ook maandverband te kopen. Voor 1 op de 10 meisjes en vrouwen die in armoede leven is er soms geen geld voor menstruatieartikelen. Toch heeft iedereen die menstrueert recht op het kunnen volgen van onderwijs en het onverstoord vervolgen van de dag. \n\nOnderteken daarom onze petitie en laat zien dat menstruatieproducten hier beschikbaar moeten zijn!\n\n## English:\n\nThe HAN ROC and RU lack an important amenity in its facilities: free access to menstrual products. As indispensable as toilet paper, and yet these toilets lack it. For hygiene considerations and fighting menstrual poverty, we are trying to convey an important demand with this action. All schools in Nijmegen should offer menstrual products in all toilets. \nMenstruating is not a choice but the costs associated with it are mandatory to incur every month. \n\nLiving expenses are on the rise and therefore sometimes people who already have financial problems do not manage to buy sanitary pads as well. For 1 in 10 girls and women living in poverty, there is sometimes no money for menstrual items. Yet everyone who menstruates has the right to be able to get an education and continue their day undisturbed. \n\nSo sign our petition and show that menstrual products should be available here!	petitie-kosteloze-toegang-tot-menstruatieproducten	2022-12-01 13:25:37.158	2022-12-01 15:44:12.659	2022-12-01 15:05:24.538	1	1	Petitie kosteloze toegang tot menstruatieproducten	ROOD Nijmegen	petitie	f
468	**Op vrijdag 19 april 2024 om 19:30 organiseert ROOD Arnhem weer een nieuwe filmavond bij cultuur en ontmoetingscentrum KREEK op Weverstraat 24 in Oosterbeek.**\n\nDeze keer kijken we _Intouchables_, een film geregisseerd door Olivier Nakache en Éric Toledano. Philippe, een rijke aristocraat, wordt na een paragliding-ongeluk quadriplegisch. Hij is op zoek naar een nieuwe verzorger en kiest tegen alle verwachtingen in voor Driss, een jonge man uit de Parijse banlieues die net uit de gevangenis is gekomen. Driss mist ervaring en heeft aanvankelijk weinig respect voor de regels van Philippe's huishouden, maar zijn ongefilterde kijk op het leven en aanstekelijke levensvreugde hebben een verfrissende en bevrijdende invloed op Philippe.\n\nNa de film is er altijd ruimte voor nabespreking. De filmavond begint om 19:30 en de inloop is om 19:00. Kan je de 19de niet? Niet getreurd! Wij hebben elke 3e vrijdag van de maand een filmavond, dus kom gerust naar een volgende!\n\n[Check de trailer hier!](https://www.youtube.com/watch?v=34WIbmXkewU&ab_channel=RottenTomatoesTrailers)	intouchables	2024-04-12 18:27:24.126	2024-04-12 18:27:25.07	2024-04-12 18:27:25.063	1	1	ROOD Arnhem filmavond: Intouchables	ROOD Arnhem	nieuws	f
467	**De Luchtmobiele Brigade van de Koninklijke Landmacht [voert van 2 tot 4 april 2024 een oefening in de stedelijke gebieden van Arnhem en Nijmegen](https://www.arnhem.nl/actueel/alle_nieuwsberichten/Luchtmobiele_brigade_oefent_in_Arnhem_en_Nijmegen), waaraan zeker 120 militairen deelnemen. Omdat ‘defensie’ tijdens offensieve operaties in onder andere Irak en Afghanistan zag dat soldaten vaak tussen burgers opereren, zullen ze onze publieke ruimte gebruiken als oefenterrein voor hun volgende oorlog. Hierbij zullen helikopters worden ingezet en militaire manoeuvres worden uitgevoerd, en zullen soldaten Arnhem en Nijmegen herinneren aan het geweld waarmee de staat zich in het binnen- en buitenland uit.**\n\nDe Arnhemse en Nijmeegse afdelingen van ROOD en de Socialisten spreken zich uit tegen militarisme en imperialisme. Dat de landmacht in bewoond gebied militaire oefeningen doet, riekt naar machtsvertoon en het aanwakkeren van een angstcultuur om steun te vinden voor het voeren van oorlogen. Bovendien kunnen dit soort militaire oefeningen angst inboezemen bij iedereen die te maken heeft gehad met militair geweld. \n\nDe missies in Mali, Irak, Afghanistan en Roemenië waren NAVO-operaties met niets anders dan een imperialistisch doel. Dat het leger zich voorbereidt om Arnhem en Nijmegen te gebruiken als proeftuin voor hun operaties is onaanvaardbaar. Kapitalistische, door het Westen gesteunde oorlogen hebben enorm veel leed veroorzaakt, regeringen gedestabiliseerd en landen uiteindelijk in puin achtergelaten. Geen van de eerder genoemde landen heeft baat gehad bij de militaire inmenging van de NAVO.\n\nHet leger heeft geen recht om oorlogje te spelen tussen nietsvermoedende burgers. Tegen militarisme en tegen imperialisme!\n	legeroefeningen-arnhem-nijmegen	2024-04-02 06:05:26.464	2024-04-17 15:20:05.522	2024-04-02 06:05:27.393	1	1	Legeroefeningen in Arnhem en Nijmegen? Nee dank je!	ROOD Arnhem en Nijmegen	nieuws	f
471	Hetzelfde werk, hetzelfde loon. Vanuit die geest trapte 1 september 2023 de FNV de campagne af. Hun doel: weg met het jeugdloon! Want het jeugdloon, dat is de reinste uitbuiting.\n\nHet werd hoog tijd dat er iemand naar het jeugdloon ging kijken. Want terwijl een 21-jarige minimaal €13,27 per uur verdient, wat al niet veel is, krijgt een 15-jarige voor hetzelfde werk slechts €3,98. Daar moet een einde aan komen. Je hoort de supermarkten al alarm slaan bij het horen van de eisen. ‘Weg met het jeugdloon? Waar moeten we dan onze goedkope arbeid vandaan halen?’ Ze bibberen op hun benen bij het aanhoren, want o wee als hun winstmarges omlaag gaan!\n\nHet jeugdloon is niet alleen een verregaande uitbuiting, het is een duidelijk voorbeeld van de manier waarop bedrijven opereren. Want dat ze roepen om winstmarges, dat laat heel duidelijk de manier zien waarop bedrijven aan hun geld komen: door mensen zo weinig mogelijk te betalen, maar ze zo hard mogelijk te laten werken. Dit geldt niet alleen voor jongeren, maar voor iedereen. Want waarom zou een bedrijf jou aannemen, als ze daar niet aan verdienen? \n\nOndanks dat we ons ervan bewust zijn dat een loonsverhoging, of een afschaffing van het jeugdloon, niet betekent dat uitbuiting stopt, is het wel een concrete verbetering. Daarom steunen we de campagne. De campagne van FNV Young & United is echter ook niet zonder haar mankementen. Want alhoewel het jeugdloon algeheel nergens op slaat, voert FNV campagne voor afschaffing vanaf 18 jaar. Wij zouden het liefst zien dat het jeugdloon compleet verdwijnt. Desondanks verdient deze campagne kritische steun. Sluit je daarom aan bij de FNV en strijd mee! \n	post-14	2024-04-21 20:33:19.713	2024-04-21 20:33:20.745	2024-04-21 20:33:20.736	1	1	Weg met het jeugdloon	ROOD Nijmegen	nieuws	f
472	### Deze vrijdag 26 april hebben we weer onze maandelijkse filmavond!\n\n\nDeze keer gaan we de film Le Haine kijken. Le Haine is een Franse film uit 1995 over drie vrienden van verschillende etnische achtergronden die 24 uur doorbrengen in een voorstad van Parijs nadat een van hun vrienden door de politie is neergeschoten. Het verkent thema's als sociaal onrecht, discriminatie en politiegeweld.\n\nom 19:00 begint de filmavond. Voel je vrij om langs te komen en je vrienden mee te nemen. Je hoeft geen lid te zijn om langs te komen. Tot vrijdag!\n\n#### 19:00 vrijdag 26 april\n#### Gaffelstraat 61B Rotterdam\n\n\n\n\n\n	rood-rotterdam-maandelijkse-filmavond-26-april-le-haine	2024-04-24 16:52:44.587	2024-04-24 16:54:54.245	2024-04-24 16:52:56.479	1	1	ROOD Rotterdam maandelijkse filmavond: 26 april: Le Haine	ROOD Rotterdam	nieuws	f
473	### Anti monarchie potluck\n\nOp zaterdag 27 april om 19:00 uur komen we samen om het naderende einde van de monarchie te vieren! Breng wat lekkers mee en nodig je vrienden uit, wij zorgen voor drinken, muziek en gezelligheid. Laten we proosten op de allerlaatste koning ooit! \n\n#### 19:00 27 april\n#### Gaffelstraat 61B Rotterdam\n\n![Afbeelding van WhatsApp op 2024-04-23 om 23.54.36_f97758fb.jpg](https://roodjongeren.nl/backend/uploads/Afbeelding_van_Whats_App_op_2024_04_23_om_23_54_36_f97758fb_d386c1862f.jpg)	anti-monarchie-potluck	2024-04-24 17:08:02.332	2024-04-24 17:17:19.573	2024-04-24 17:10:22.54	1	1	Anti-monarchie Potluck	ROOD Rotterdam	nieuws	f
470	 Dit jaar wordt op 27 april weer Koningsdag gevierd. Er zijn feesten, rommelmarkten, gezelligheid en oranje overal. Het is een leuke dag, maar voor het koningshuis en de heersende klasse is het een manier om arbeiders de mond te snoeren. Want, zo zeggen zij: “Natuurlijk is het Koningshuis nodig! Wat maakt het uit dat door Koningsdag de Dag van de Arbeid geen officiële feestdag is?”\n\nWe leven niet meer in de tijd van het goddelijke recht, maar toch blijft Nederland ten opzichte van andere landen achter. Dat valt ook te zien aan de positie van Koningsdag. Het is geen toeval dat het zo dicht op de Dag van de Arbeid, 1 mei, valt. Koningsdag wordt uitbundig gevierd, en de Dag van de Arbeid wordt achtergesteld omdat we het blijkbaar toch al zo goed hebben. Laten we niet vergeten dat Postnl-medewerkers in flesjes moeten plassen omdat ze te weinig tijd hebben om een pauze te nemen, of de toename van flexcontracten die nóg meer rechten en zekerheid van werknemers wegnemen.\n\nHet Koningshuis heeft tegenwoordig niet meer dan een ceremoniële functie. Althans, behalve dat hij op visite gaat bij andere staatshoofden om geopolitieke relaties in stand te houden. En dat hij elke week met de minister-president spreekt. Ohja, en je zou bijna vergeten dat hij zijn handtekening onder iedere wet moet zetten. Als je dat allemaal zo ziet is het misschien wel logisch dat Socialisten en Republikeinen het eens zijn over het volgende: dat we net zo goed een republiek kunnen worden. \n\nHet afschaffen van het koningshuis zal echter niet leiden tot democratie en gelijkheid. Niet op zichzelf. Want alhoewel de macht van de Koning niet langer Nederland zal plagen en de Dag van de Arbeid eindelijk een feestdag zal worden, zullen de klassen blijven bestaan, en met hen klassediscriminatie en klassenjustitie. Dus laat je niet verleiden door republikeinen en andere liberalen. Ongelijkheid los je niet op met een loutere afschaffing van het koningshuis, die los je op met een socialistische revolutie die de arbeidersklasse bevrijdt! 	post-13	2024-04-21 20:32:12.634	2024-04-21 20:32:14.926	2024-04-21 20:32:14.92	1	1	Emancipeer jezelf van Koningsdag!	ROOD Nijmegen	nieuws	f
474	_Dit artikel is gepubliceerd in de april editie van De Bode Arnhem. Wil je meer lezen? [Schrijf je in voor onze nieuwsbrief!](https://forms.gle/ymDBharuijwDi95W8)_\n\nSinds het begin van de oorlog in Oekraïne wordt er veel gespeculeerd over een kernoorlog. Een oorlog waarin twee landen met kernwapens elkaar en de wereld vernietigen. Dit idee begon tijdens de Koude Oorlog met de angst dat de Sovjet-Unie en de VS elkaar om ideologische redenen zouden willen vernietigen. Gelukkig is dit scenario nog niet gebeurd en leven we niet in een radioactieve woestenij. Maar als je goed naar de wereld kijkt, is dit niet het grootste gevaar. De grootste kans op een nucleair armageddon bestaat tussen Pakistan en India. Beiden hebben kernwapens en vanwege een gecompliceerde geopolitieke geschiedenis zien de landen elkaar als vijanden. Er zijn vaak grensconflicten tussen de twee landen, kijk maar naar de regio Kashmir. De spanning tussen die twee is al lang hoog opgelopen. \n\nMaar als je de titel van dit stuk leest, beweer ik dat er geen kernoorlog zal komen. Dit komt door de MAD-politiek. Deze afkorting staat voor: mutual assured destruction. De gigantische gevolgen van het afvuren van één of meer kernwapens op een ander nucleair land zal tot gevolg hebben dat dit land ook zijn kernwapens zal terugsturen. Hierdoor heeft het land dat de eerste wapens afvuurde de garantie dat hun land ook vernietigd zal worden. Dit garandeert dat landen geen kernwapens zullen gebruiken in een oorlog. Landen zullen eerder proberen elkaar te ondermijnen door middel van proxy oorlogen of conflicten oplossen door middel van diplomatie omdat niemand erbij gebaat is als de wereld vernietigd wordt. Daarom zullen er altijd spanningen zijn tussen grootmachten in de wereld, maar nooit een echte kernoorlog. 	geen-nucleaire-oorlog	2024-04-28 07:44:35.437	2024-04-28 07:44:36.99	2024-04-28 07:44:36.985	1	1	De Bode Arnhem: Waarom er geen nucleaire oorlog komt	ROOD Arnhem	inzending	f
\.


--
-- Data for Name: posts_afdeling_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.posts_afdeling_links (post_id, afdeling_id, id, post_order) FROM stdin;
361	9	145	1
468	2	223	54
470	9	224	15
471	9	225	16
472	3	226	10
473	3	227	11
474	2	228	55
475	2	229	56
476	1	230	1
\.


--
-- Data for Name: privacybeleids; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.privacybeleids (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	# Cookies\n\nDeze website, www.roodjongeren.nl, houdt geen persoonlijke gegevens bij, en plaatst geen cookies bij bezoekers. Mogelijk worden er wel cookies geplaatst door ingesloten (geëmbedde) inhoud, zoals videospelers of formulieren. Hier wordt dan ter plekke toestemming voor gevraagd, met een link naar het privacybeleid van de websites waarvan de inhoud wordt ingeladen.\n\n# Persoonsgegevens\n\nAls je aanmeldt als (steun-)lid te worden, verstrek je persoonsgegevens aan ROOD. Deze persoonsgegevens worden opgeslagen in de ledenadministratie van ROOD. We gebruiken deze gegevens alleen wanneer dat noodzakelijk is voor het verlenen van jouw lidmaatschap. Alleen het landelijk ROOD bestuur, de contactpersoon van jouw lokale ROOD groep, en administratieve en technische medewerkers van ROOD hebben toegang tot de administratie. Je persoonsgegevens worden verder met niemand gedeeld, tenzij jij daar in een bepaald geval expliciete toestemming voor geeft.\n\nJe IP-adres wordt bij elk bezoek bijgehouden in de logboeken van onze hostingprovider.	2022-01-30 22:59:17.09	2022-02-01 00:46:49.93	1	1
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.programs (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Als zelfstandige jongerenorganisatie is het belangrijk om een gezamenlijke politieke basis te hebben. Het onderstaande (beginsel)programma is aangenomen door de Algemene Ledenvergadering van november 2021. Niet alle leden hoeven het met het programma eens te zijn. Wel vormt het een algemene basis waarop we als organisatie kunnen handelen. \n\n\n# I. Analyse\n\n\n## Kapitalisme en tegenstellingen\n\n\nOns tijdperk wordt gekenmerkt door onzekerheid, crisis en uitbuiting van de mensheid en natuur. Deze problemen zijn het gevolg van de verhouding tussen economische klassen. In onze tijd, de kapitalistische periode in de geschiedenis, is dat de verhouding tussen *het proletariaat* (de arbeidersklasse) en *de bourgeoisie* (de bezittende klasse). Iedereen die direct of indirect afhankelijk is van loon is onderdeel van de arbeidersklasse. Naast arbeiders vallen ook gepensioneerden, werklozen en mensen die afhankelijk zijn van het inkomen van een ander onder deze klasse. De bezittende klasse bestaat uit degenen die afhankelijk zijn van de productiemiddelen die ze in handen hebben. De productiemiddelen zijn al het bezit dat nodig is voor het produceren van goederen en diensten. In ons systeem is het de bezittende klasse, een kleine minderheid, die de macht in handen heeft. Hun belang is het maken van zoveel mogelijk winst ten koste van mens en natuur. Hun belangen staan daarom recht tegenover de onze.\n\n\nDit is het duidelijkst zichtbaar op de werkvloer, waar werkende mensen strijden voor hoger loon en betere arbeidsvoorwaarden waar het kapitaal dit juist niet wil. Maar ook andere vormen van onderdrukking, zoals racisme, seksisme en onderdrukking van LHBTI’ers worden versterkt door het kapitalisme. Als je weinig geld hebt en elk moment je baan kwijt kan raken denk je wel twee keer na voordat je je uitspreekt tegen onderdrukkende systemen. Daarom gaat de strijd tegen deze vormen van onderdrukking en tegen kapitalisme hand in hand. \n\n\nEen ander voorbeeld van die tegenovergestelde belangen is de klimaatcrisis. Omdat de kapitalisten alleen produceren voor winst maken ze de planeet kapot. De rampzalige gevolgen hiervan komen ook weer terecht bij degenen die het hardst onderdrukt worden. Individuele actie is niet genoeg, het gaat om het systeem.\n\n\n## Democratie en de staat\n\n\nHoewel we in Nederland veel democratische rechten hebben gewonnen, zoals het algemeen kiesrecht, is ons systeem niet democratisch. De economie en productie is in handen van de bourgeoisie. Bovendien hebben ze via lobbyisten veel invloed op wetgeving. Personeel heeft vrijwel niets te zeggen over hoe de productiemiddelen gebruikt worden. Ook het staatsapparaat staat niet aan onze kant: het moet ervoor zorgen dat het kapitalisme kan blijven functioneren en zal het privé-eigendom van de bourgeoisie beschermen. Aan de andere kant kan het kapitaal de wet omzeilen of zonder serieuze gevolgen negeren. \n\n\n## Politiek\n\n\nDe huidige gevestigde politiek, waaronder ook linkse partijen, kan geen antwoord bieden op de uitbuiting en crises van het kapitalisme. Zij lost de tegenstelling tussen de werkende klasse en de bezittende klassen niet op. Alhoewel de strijd voor hervormingen binnen het kapitalisme erg belangrijk is zien wij hier ook de beperkingen van in. Zolang het kapitalistische systeem in stand blijft staan deze hervormingen permanent onder druk. Ook lossen sociale hervormingen als de invoering van sociale zekerheid of een minimumloon niet de tegenstelling tussen klassen op. Enkel een socialistisch systeem kan uiteindelijk de mensheid volledig emanciperen.\n\n\nAan de andere kant zijn er in het verleden ook pogingen geweest om te breken met het kapitalisme en het socialisme in te voeren. Dit werd ook in de Sovjet-Unie geprobeerd, en dit verspreidde zich over grote delen van de wereld. Deze pogingen zijn echter mislukt: ze hebben niet de radicale verandering gebracht die we zoeken en zijn grotendeels vervallen in bureaucratische dictaturen. We moeten leren van deze geschiedenis en voorkomen dat we dezelfde fouten maken. \n\n\n## Imperialisme en oorlog\n\n\nKapitalisme is een internationaal systeem. Er bestaat een internationale hiërarchie van landen gebaseerd op onderdrukking en geweld. Zolang dit systeem bestaat, en wapenfabrikanten belang hebben bij oorlog, zal er geen vrede zijn.  \n\n\n# II. Doel\n\n\nOnze strijd is de strijd voor de emancipatie van de mensheid als geheel. Dat betekent een einde aan de klassenmaatschappij en een einde aan alle andere vormen van onderdrukking. Ons doel is een maatschappij waar iedereen bijdraagt naar hun mogelijkheden en krijgt naar hun behoefte. Waar de economie wordt ingericht op een transparante en democratische manier, zonder geld of privé-eigendom. Waar werk geen noodzakelijkheid is om te overleven, maar een behoefte van ieder mens. Waar de staat is afgestorven. Kortom een maatschappij waar men zich vrij van onderdrukking kan ontwikkelen. Naast de strijd voor een einde aan de klassenmaatschappij willen we ook een bijdrage leveren aan de dagelijkse strijd. Onder het kapitalisme vechten wij voor sociale, politieke en democratische rechten, zoals betere voorzieningen voor studenten of meer zeggenschap op je werk. Hierin nemen wij het uitgangspunt van jongeren maar vechten we ook voor de belangen van onze klasse als geheel.\n\n\n# III. De weg\n\n\nDe arbeidersklasse zal zich moeten organiseren voor haar belangen omdat ze geen toegang heeft tot de macht en productiemiddelen. De tegenstellingen van het systeem zorgen dat ze dit moeten blijven doen. Uiteindelijk is het in het belang van de arbeidersklasse om te breken met het kapitalisme en te komen tot het socialisme. Daarom willen we de strijd van de arbeidersbeweging verbinden aan de strijd voor het socialisme. \n\n\nDe strijd voor het socialisme kunnen we niet alleen in het parlement voeren. De instituties van de staat zullen niet aan onze kant staan. Daarom moeten we de steun vergaren van een meerderheid van de bevolking om zo de kapitalistische staat omver te werpen en een democratische republiek te stichten onder leiding van de arbeidersklasse. Deze machtsovername, waarin de werkende klasse de instituties van het huidige systeem overneemt, afbreekt en vervangt, is de revolutie waar wij voor strijden. \n\n\nOok kan dit niet enkel in één land. Het kapitalisme is een internationaal systeem en de bourgeoisie voert de klassenstrijd ook internationaal. Een machtsovername in één of enkele landen wordt gehinderd door economische isolatie en blokkades. Daarom moeten we ons ook internationaal organiseren.\n\n\nOm ons doel te bereiken moeten we streven naar een onafhankelijke socialistische partij die staat voor de belangen van de werkende klasse en nauw verbonden is met vakbonden en sociale bewegingen. Een partij onafhankelijk van het kapitaal en van de staat. Deze partij moet intern ook democratisch zijn. Als we de maatschappij willen democratiseren moeten we bij onszelf beginnen. Ze moet staan voor vrijheid van spreken, publicatie en informatie en al haar vertegenwoordigers moeten verkozen en terugroepbaar zijn. Er moet geen sprake zijn van volledige politieke overeenstemming maar acceptatie van verschillende meningen en eenheid in actie.\n\n\nWij als ROOD zijn deze partij niet, maar als jongerenorganisatie die strijdt voor een nieuwe maatschappij zien wij wel de noodzaak voor zo’n partij. Om dit te bereiken moeten we ons oriënteren op de bestaande arbeidersbeweging. Door middel van activisme, agitatie en scholing proberen we jongeren te politiseren en te organiseren tegen het kapitalisme. We moeten sociale bewegingen versterken en onze ideeën en analyses verspreiden. Het is onze taak als socialistische jongerenorganisatie om jongeren op te leiden tot politiek leiders van de arbeidersklasse. Zo kunnen we bouwen aan de beweging die de basis vormt voor de machtsovername van de arbeidersklasse en uiteindelijk zal leiden tot emancipatie van de mensheid als geheel.	2022-05-14 12:39:40.996	2023-11-10 13:29:59.45	1	1
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id, last_used_at, expires_at, lifespan) FROM stdin;
\.


--
-- Data for Name: strapi_audit_logs; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_audit_logs (id, action, date, payload, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_audit_logs_user_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_audit_logs_user_links (id, audit_log_id, user_id) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
44	plugin_content_manager_configuration_content_types::admin::transfer-token	{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}	object	\N	\N
15	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}	object	\N	\N
22	plugin_content_manager_configuration_content_types::api::post.post	{"uid":"api::post.post","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"createdAt","defaultSortOrder":"DESC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Titel","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Titel","searchable":true,"sortable":true}},"content":{"edit":{"label":"Inhoud","description":"Ondersteunt de Markdown Extended Syntax (https://www.markdownguide.org/extended-syntax/). Je kan naar plaatsen refereren met `backend/uploads/<de_afbeelding>>`.","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"afdeling":{"edit":{"label":"Afdeling","description":"Laat leeg voor landelijke posts","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Afdeling","searchable":true,"sortable":true}},"author":{"edit":{"label":"Auteur","description":"Vul \\"ROOD\\" in als het gaat om officiële landelijke communicatie","placeholder":"","visible":true,"editable":true},"list":{"label":"Author","searchable":true,"sortable":true}},"banner":{"edit":{"label":"Banner","description":"Wordt gebruikt als thumbnail en als banner bovenaan het nieuwsbericht. Zorg ervoor dat de afbeelding vrij is van auteursrecht!","placeholder":"","visible":true,"editable":true},"list":{"label":"Banner","searchable":false,"sortable":false}},"type":{"edit":{"label":"Soort","description":"Nieuwsartikel of ingezonden opiniestuk?","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"frontpage":{"edit":{"label":"Voorpagina","description":"Of dit bericht op de voorpagina getoond moet worden","placeholder":"","visible":true,"editable":true},"list":{"label":"frontpage","searchable":true,"sortable":true}},"petition":{"edit":{"label":"petition","description":"","placeholder":"","visible":true,"editable":true,"mainField":"hook"},"list":{"label":"petition","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Aangemaakt op","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Bijgewerkt op","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"type","size":6},{"name":"author","size":6}],[{"name":"banner","size":6},{"name":"frontpage","size":6}],[{"name":"content","size":12}],[{"name":"petition","size":6},{"name":"afdeling","size":6}]],"list":["banner","title","type","author","afdeling","updatedAt"]}}	object	\N	\N
45	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
29	plugin_content_manager_configuration_content_types::api::workgroup.workgroup	{"uid":"api::workgroup.workgroup","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Naam","searchable":true,"sortable":true}},"about":{"edit":{"label":"About","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"About","searchable":false,"sortable":false}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Aangemaakt op","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Bijgewerkt op","searchable":true,"sortable":true}}},"layouts":{"list":["name","createdAt","updatedAt"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"about","size":12}]]}}	object	\N	\N
21	plugin_content_manager_configuration_content_types::api::privacybeleid.privacybeleid	{"uid":"api::privacybeleid.privacybeleid","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"content":{"edit":{"label":"Inhoud","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt"],"edit":[[{"name":"content","size":12}]]}}	object	\N	\N
46	plugin_content_manager_configuration_content_types::api::workgroups-page.workgroups-page	{"uid":"api::workgroups-page.workgroups-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","banner","createdAt","updatedAt"],"edit":[[{"name":"banner","size":6}],[{"name":"content","size":12}]]}}	object	\N	\N
43	ee_information	{"lastCheckAt":1714912329849,"error":"The associated subscription is cancelled.","license":null}	\N	\N	\N
18	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
19	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
16	plugin_i18n_default_locale	"nl-NL"	string	\N	\N
17	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"//api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"//api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"//api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"//api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"//api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"//api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"//api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"//api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"//api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"//api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"//api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"//api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"//api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"//api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"https://roodjongeren.nl/backend/api/auth/patreon/callback","scope":["identity","identity[email]"]}}	object	\N	\N
28	plugin_content_manager_configuration_content_types::api::confidants-page.confidants-page	{"uid":"api::confidants-page.confidants-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","banner"],"edit":[[{"name":"banner","size":6}],[{"name":"content","size":12}]]}}	object	\N	\N
47	plugin_content_manager_configuration_content_types::admin::audit-log	{"uid":"admin::audit-log","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"user","searchable":true,"sortable":true}},"payload":{"edit":{"label":"payload","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"payload","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","date","user"],"edit":[[{"name":"action","size":6},{"name":"date","size":6}],[{"name":"user","size":6}],[{"name":"payload","size":12}]]}}	object	\N	\N
48	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"Properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"PreferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"firstname":{"type":"string","required":true},"lastname":{"type":"string","required":true},"phone":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"firstname":{"type":"string","required":true},"lastname":{"type":"string","required":true},"phone":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::about-us.about-us":{"kind":"singleType","collectionName":"about_uses","info":{"singularName":"about-us","pluralName":"about-uses","displayName":"Over ons","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"about_uses","info":{"singularName":"about-us","pluralName":"about-uses","displayName":"Over ons","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"about-us","connection":"default","uid":"api::about-us.about-us","apiName":"about-us","globalId":"AboutUs","actions":{},"lifecycles":{}},"api::afdeling.afdeling":{"kind":"collectionType","collectionName":"afdelingen","info":{"singularName":"afdeling","pluralName":"afdelingen","displayName":"Afdeling","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"unique":true},"longitude":{"type":"float","required":true},"latitude":{"type":"float","required":true},"email":{"type":"email","required":true},"twitterLink":{"type":"string"},"facebookLink":{"type":"string"},"instagramLink":{"type":"string"},"contactpersonen":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user"},"slug":{"type":"uid","targetField":"name","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"afdeling"},"about":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"afdelingen","info":{"singularName":"afdeling","pluralName":"afdelingen","displayName":"Afdeling","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"unique":true},"longitude":{"type":"float","required":true},"latitude":{"type":"float","required":true},"email":{"type":"email","required":true},"twitterLink":{"type":"string"},"facebookLink":{"type":"string"},"instagramLink":{"type":"string"},"contactpersonen":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user"},"slug":{"type":"uid","targetField":"name","required":true},"posts":{"type":"relation","relation":"oneToMany","target":"api::post.post","mappedBy":"afdeling"},"about":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"afdeling","connection":"default","uid":"api::afdeling.afdeling","apiName":"afdeling","globalId":"Afdeling","actions":{},"lifecycles":{}},"api::confidant.confidant":{"kind":"collectionType","collectionName":"confidants","info":{"singularName":"confidant","pluralName":"confidants","displayName":"Vertrouwenspersonen","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"email":{"type":"email","required":true},"phone":{"type":"string","required":true},"photo":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"about":{"type":"richtext","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"confidants","info":{"singularName":"confidant","pluralName":"confidants","displayName":"Vertrouwenspersonen","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"email":{"type":"email","required":true},"phone":{"type":"string","required":true},"photo":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"about":{"type":"richtext","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"confidant","connection":"default","uid":"api::confidant.confidant","apiName":"confidant","globalId":"Confidant","actions":{},"lifecycles":{}},"api::confidants-page.confidants-page":{"kind":"singleType","collectionName":"confidants_pages","info":{"singularName":"confidants-page","pluralName":"confidants-pages","displayName":"Vertrouwenspersonen-pagina","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"confidants_pages","info":{"singularName":"confidants-page","pluralName":"confidants-pages","displayName":"Vertrouwenspersonen-pagina","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelType":"contentType","modelName":"confidants-page","connection":"default","uid":"api::confidants-page.confidants-page","apiName":"confidants-page","globalId":"ConfidantsPage","actions":{},"lifecycles":{}},"api::fallback.fallback":{"kind":"singleType","collectionName":"fallbacks","info":{"singularName":"fallback","pluralName":"fallbacks","displayName":"Fallback","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"pageBanner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"fallbacks","info":{"singularName":"fallback","pluralName":"fallbacks","displayName":"Fallback","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"pageBanner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelType":"contentType","modelName":"fallback","connection":"default","uid":"api::fallback.fallback","apiName":"fallback","globalId":"Fallback","actions":{},"lifecycles":{}},"api::home.home":{"kind":"singleType","collectionName":"homes","info":{"singularName":"home","pluralName":"homes","displayName":"Home"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true},"bannerTitle":{"type":"string","required":true},"bannerSubtitle":{"type":"string","required":true},"shortAboutUs":{"type":"richtext","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"homes","info":{"singularName":"home","pluralName":"homes","displayName":"Home"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"allowedTypes":["images"],"type":"media","multiple":false,"required":true},"bannerTitle":{"type":"string","required":true},"bannerSubtitle":{"type":"string","required":true},"shortAboutUs":{"type":"richtext","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"home","connection":"default","uid":"api::home.home","apiName":"home","globalId":"Home","actions":{},"lifecycles":{}},"api::join-us.join-us":{"kind":"singleType","collectionName":"join_uses","info":{"singularName":"join-us","pluralName":"join-uses","displayName":"Word lid","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"join_uses","info":{"singularName":"join-us","pluralName":"join-uses","displayName":"Word lid","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelType":"contentType","modelName":"join-us","connection":"default","uid":"api::join-us.join-us","apiName":"join-us","globalId":"JoinUs","actions":{},"lifecycles":{}},"api::petition.petition":{"kind":"collectionType","collectionName":"petitions","info":{"singularName":"petition","pluralName":"petitions","displayName":"Petitie","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"hook":{"type":"string"},"signatures":{"type":"relation","relation":"oneToMany","target":"api::petition-signature.petition-signature","mappedBy":"petition"},"extraQuestions":{"type":"json"},"post":{"type":"relation","relation":"oneToOne","target":"api::post.post","inversedBy":"petition"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"petitions","info":{"singularName":"petition","pluralName":"petitions","displayName":"Petitie","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"hook":{"type":"string"},"signatures":{"type":"relation","relation":"oneToMany","target":"api::petition-signature.petition-signature","mappedBy":"petition"},"extraQuestions":{"type":"json"},"post":{"type":"relation","relation":"oneToOne","target":"api::post.post","inversedBy":"petition"}},"kind":"collectionType"},"modelType":"contentType","modelName":"petition","connection":"default","uid":"api::petition.petition","apiName":"petition","globalId":"Petition","actions":{},"lifecycles":{}},"api::petition-signature.petition-signature":{"kind":"collectionType","collectionName":"petition_signatures","info":{"singularName":"petition-signature","pluralName":"petition-signatures","displayName":"Petitie-ondertekening","description":""},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"confirmationCode":{"type":"string","unique":true,"private":true},"confirmed":{"type":"boolean"},"petition":{"type":"relation","relation":"manyToOne","target":"api::petition.petition","inversedBy":"signatures"},"questionAnswers":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"petition_signatures","info":{"singularName":"petition-signature","pluralName":"petition-signatures","displayName":"Petitie-ondertekening","description":""},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{},"attributes":{"name":{"type":"string"},"email":{"type":"email"},"confirmationCode":{"type":"string","unique":true,"private":true},"confirmed":{"type":"boolean"},"petition":{"type":"relation","relation":"manyToOne","target":"api::petition.petition","inversedBy":"signatures"},"questionAnswers":{"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"petition-signature","connection":"default","uid":"api::petition-signature.petition-signature","apiName":"petition-signature","globalId":"PetitionSignature","actions":{},"lifecycles":{}},"api::post.post":{"kind":"collectionType","collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true,"maxLength":100,"unique":true},"content":{"type":"richtext","required":true},"slug":{"type":"uid","targetField":"title","required":true},"afdeling":{"type":"relation","relation":"manyToOne","target":"api::afdeling.afdeling","inversedBy":"posts"},"author":{"type":"string","required":true,"maxLength":100,"default":"ROOD"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"type":{"type":"enumeration","enum":["nieuws","inzending","petitie"],"required":true},"frontpage":{"type":"boolean","required":true},"petition":{"type":"relation","relation":"oneToOne","target":"api::petition.petition","mappedBy":"post"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"posts","info":{"singularName":"post","pluralName":"posts","displayName":"Post","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","required":true,"maxLength":100,"unique":true},"content":{"type":"richtext","required":true},"slug":{"type":"uid","targetField":"title","required":true},"afdeling":{"type":"relation","relation":"manyToOne","target":"api::afdeling.afdeling","inversedBy":"posts"},"author":{"type":"string","required":true,"maxLength":100,"default":"ROOD"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"type":{"type":"enumeration","enum":["nieuws","inzending","petitie"],"required":true},"frontpage":{"type":"boolean","required":true},"petition":{"type":"relation","relation":"oneToOne","target":"api::petition.petition","mappedBy":"post"}},"kind":"collectionType"},"modelType":"contentType","modelName":"post","connection":"default","uid":"api::post.post","apiName":"post","globalId":"Post","actions":{},"lifecycles":{}},"api::privacybeleid.privacybeleid":{"kind":"singleType","collectionName":"privacybeleids","info":{"singularName":"privacybeleid","pluralName":"privacybeleids","displayName":"Privacybeleid","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"privacybeleids","info":{"singularName":"privacybeleid","pluralName":"privacybeleids","displayName":"Privacybeleid","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"privacybeleid","connection":"default","uid":"api::privacybeleid.privacybeleid","apiName":"privacybeleid","globalId":"Privacybeleid","actions":{},"lifecycles":{}},"api::program.program":{"kind":"singleType","collectionName":"programs","info":{"singularName":"program","pluralName":"programs","displayName":"Programma","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"programs","info":{"singularName":"program","pluralName":"programs","displayName":"Programma","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"richtext","required":true},"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelType":"contentType","modelName":"program","connection":"default","uid":"api::program.program","apiName":"program","globalId":"Program","actions":{},"lifecycles":{}},"api::workgroup.workgroup":{"kind":"collectionType","collectionName":"workgroups","info":{"singularName":"workgroup","pluralName":"workgroups","displayName":"Werkgroep","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"about":{"type":"richtext","required":true},"slug":{"type":"uid","targetField":"name","required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"workgroups","info":{"singularName":"workgroup","pluralName":"workgroups","displayName":"Werkgroep","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"about":{"type":"richtext","required":true},"slug":{"type":"uid","targetField":"name","required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"workgroup","connection":"default","uid":"api::workgroup.workgroup","apiName":"workgroup","globalId":"Workgroup","actions":{},"lifecycles":{}},"api::workgroups-page.workgroups-page":{"kind":"singleType","collectionName":"workgroups_pages","info":{"singularName":"workgroups-page","pluralName":"workgroups-pages","displayName":"Werkgroepen-pagina","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"content":{"type":"richtext","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"workgroups_pages","info":{"singularName":"workgroups-page","pluralName":"workgroups-pages","displayName":"Werkgroepen-pagina","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"banner":{"type":"media","multiple":false,"required":true,"allowedTypes":["images"]},"content":{"type":"richtext","required":true}},"kind":"singleType"},"modelType":"contentType","modelName":"workgroups-page","connection":"default","uid":"api::workgroups-page.workgroups-page","apiName":"workgroups-page","globalId":"WorkgroupsPage","actions":{},"lifecycles":{}},"admin::audit-log":{"kind":"collectionType","collectionName":"strapi_audit_logs","info":{"singularName":"audit-log","pluralName":"audit-logs","displayName":"Audit Log"},"options":{"draftAndPublish":false,"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true},"date":{"type":"datetime","required":true},"user":{"type":"relation","relation":"oneToOne","target":"admin::user"},"payload":{"type":"json"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"strapi_audit_logs","info":{"singularName":"audit-log","pluralName":"audit-logs","displayName":"Audit Log"},"options":{"draftAndPublish":false,"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true},"date":{"type":"datetime","required":true},"user":{"type":"relation","relation":"oneToOne","target":"admin::user"},"payload":{"type":"json"}},"kind":"collectionType"},"modelType":"contentType","modelName":"audit-log","connection":"default","uid":"admin::audit-log","plugin":"admin","globalId":"AdminAuditLog"}}	object	\N	\N
33	core_admin_project-settings	{"menuLogo":{"name":"rood-logo.png","hash":"rood_logo_32cfe2b1d9","url":"/uploads/rood_logo_32cfe2b1d9.png","width":256,"height":256,"ext":".png","size":10.48,"provider":"local"}}	object	\N	\N
20	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
32	plugin_content_manager_configuration_content_types::api::fallback.fallback	{"uid":"api::fallback.fallback","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"pageBanner":{"edit":{"label":"Pagina-banner","description":"Standaard banner op pagina's zonder pagina-specifieke banner","placeholder":"","visible":true,"editable":true},"list":{"label":"pageBanner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","pageBanner","createdAt"],"edit":[[{"name":"pageBanner","size":6}]]}}	object	\N	\N
23	plugin_content_manager_configuration_content_types::api::home.home	{"uid":"api::home.home","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"bannerTitle","defaultSortBy":"bannerTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Banner","searchable":false,"sortable":false}},"bannerTitle":{"edit":{"label":"Banner Titel","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"BannerTitle","searchable":true,"sortable":true}},"bannerSubtitle":{"edit":{"label":"Banner Ondertitel","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"BannerSubtitle","searchable":true,"sortable":true}},"shortAboutUs":{"edit":{"label":"Korte Over-ons","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ShortAboutUs","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","banner","bannerTitle","bannerSubtitle"],"edit":[[{"name":"banner","size":6}],[{"name":"bannerTitle","size":6},{"name":"bannerSubtitle","size":6}],[{"name":"shortAboutUs","size":12}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6}]]}}	object	\N	\N
30	plugin_content_manager_configuration_content_types::api::program.program	{"uid":"api::program.program","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"content":{"edit":{"label":"Inhoud","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","banner","createdAt","updatedAt"],"edit":[[{"name":"banner","size":6}],[{"name":"content","size":12}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::api::about-us.about-us	{"uid":"api::about-us.about-us","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"content":{"edit":{"label":"Inhoud","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","banner"],"edit":[[{"name":"banner","size":6}],[{"name":"content","size":12}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::api::afdeling.afdeling	{"uid":"api::afdeling.afdeling","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Naam","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Naam","searchable":true,"sortable":true}},"longitude":{"edit":{"label":"Lengtegraad","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Longitude","searchable":true,"sortable":true}},"latitude":{"edit":{"label":"Breedtegraad","description":"https://nominatim.openstreetmap.org/ui/search.html","placeholder":"","visible":true,"editable":true},"list":{"label":"Latitude","searchable":true,"sortable":true}},"email":{"edit":{"label":"E-mail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"twitterLink":{"edit":{"label":"Twitter-link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"TwitterLink","searchable":true,"sortable":true}},"facebookLink":{"edit":{"label":"Facebook-link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"FacebookLink","searchable":true,"sortable":true}},"instagramLink":{"edit":{"label":"Instagram-link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"InstagramLink","searchable":true,"sortable":true}},"contactpersonen":{"edit":{"label":"Contactpersonen","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"contactpersonen","searchable":false,"sortable":false}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"posts":{"edit":{"label":"Posts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Posts","searchable":false,"sortable":false}},"about":{"edit":{"label":"Over de afdeling","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"About","searchable":false,"sortable":false}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"contactpersonen","size":6}],[{"name":"latitude","size":4},{"name":"longitude","size":4}],[{"name":"email","size":6}],[{"name":"facebookLink","size":6},{"name":"twitterLink","size":6}],[{"name":"instagramLink","size":6}],[{"name":"banner","size":6}],[{"name":"about","size":12}]],"list":["banner","name","posts","contactpersonen"]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Gebruikersnaam","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Gebruikersnaam","searchable":true,"sortable":true}},"email":{"edit":{"label":"E-mail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"E-mail","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Wachtwoord","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Rol","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Voornaam","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Voornaam","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Achternaam","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Achternaam","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Phone","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"role","size":6},{"name":"password","size":6}],[{"name":"confirmed","size":4},{"name":"blocked","size":4}],[{"name":"phone","size":6}]],"list":["email","firstname","lastname","username","confirmed"]}}	object	\N	\N
39	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"AccessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AccessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::confidant.confidant	{"uid":"api::confidant.confidant","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Naam","description":"Inclusief voornaamwoorden","placeholder":"Jan Jansen (hij, hem)","visible":true,"editable":true},"list":{"label":"Naam","searchable":true,"sortable":true}},"email":{"edit":{"label":"E-mail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"E-mail","searchable":true,"sortable":true}},"phone":{"edit":{"label":"Telefoon","description":"","placeholder":"06 12345678","visible":true,"editable":true},"list":{"label":"Telefoon","searchable":true,"sortable":true}},"photo":{"edit":{"label":"Foto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Foto","searchable":false,"sortable":false}},"about":{"edit":{"label":"Over mij","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"About","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["photo","name","email","phone"],"edit":[[{"name":"name","size":6},{"name":"photo","size":6}],[{"name":"email","size":6},{"name":"phone","size":6}],[{"name":"about","size":12}]]}}	object	\N	\N
24	plugin_content_manager_configuration_content_types::api::join-us.join-us	{"uid":"api::join-us.join-us","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"content":{"edit":{"label":"Inhoud","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"banner":{"edit":{"label":"Banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","createdAt","updatedAt","banner"],"edit":[[{"name":"banner","size":6}],[{"name":"content","size":12}]]}}	object	\N	\N
38	plugin_upload_metrics	{"weeklySchedule":"45 37 19 * * 1","lastWeeklyUpdate":1714419465030}	object	\N	\N
40	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}	object	\N	\N
41	plugin_content_manager_configuration_content_types::api::petition.petition	{"uid":"api::petition.petition","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"hook","defaultSortBy":"hook","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"hook":{"edit":{"label":"hook","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hook","searchable":true,"sortable":true}},"signatures":{"edit":{"label":"signatures","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"signatures","searchable":false,"sortable":false}},"extraQuestions":{"edit":{"label":"extraQuestions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"extraQuestions","searchable":false,"sortable":false}},"post":{"edit":{"label":"post","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"post","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","hook","signatures","post"],"edit":[[{"name":"hook","size":6},{"name":"signatures","size":6}],[{"name":"extraQuestions","size":12}],[{"name":"post","size":6}]]}}	object	\N	\N
42	plugin_content_manager_configuration_content_types::api::petition-signature.petition-signature	{"uid":"api::petition-signature.petition-signature","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"confirmationCode":{"edit":{"label":"confirmationCode","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmationCode","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"petition":{"edit":{"label":"petition","description":"","placeholder":"","visible":true,"editable":true,"mainField":"hook"},"list":{"label":"petition","searchable":true,"sortable":true}},"questionAnswers":{"edit":{"label":"questionAnswers","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"questionAnswers","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","email","confirmationCode"],"edit":[[{"name":"name","size":6},{"name":"email","size":6}],[{"name":"confirmationCode","size":6},{"name":"confirmed","size":4}],[{"name":"petition","size":6}],[{"name":"questionAnswers","size":12}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"CreatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"CreatedAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"UpdatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"UpdatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
37	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"about_uses","indexes":[{"name":"about_uses_created_by_id_fk","columns":["created_by_id"]},{"name":"about_uses_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"about_uses_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"about_uses_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"afdelingen","indexes":[{"type":"unique","name":"afdelingen_slug_unique","columns":["slug"]},{"name":"afdelingen_created_by_id_fk","columns":["created_by_id"]},{"name":"afdelingen_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"afdelingen_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"afdelingen_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"longitude","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"latitude","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"twitter_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"facebook_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"instagram_link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"about","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"confidants","indexes":[{"name":"confidants_created_by_id_fk","columns":["created_by_id"]},{"name":"confidants_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"confidants_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"confidants_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"about","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"confidants_pages","indexes":[{"name":"confidants_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"confidants_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"confidants_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"confidants_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"fallbacks","indexes":[{"name":"fallbacks_created_by_id_fk","columns":["created_by_id"]},{"name":"fallbacks_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"fallbacks_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"fallbacks_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"homes","indexes":[{"name":"homes_created_by_id_fk","columns":["created_by_id"]},{"name":"homes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"homes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"homes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"banner_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"banner_subtitle","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"short_about_us","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"join_uses","indexes":[{"name":"join_uses_created_by_id_fk","columns":["created_by_id"]},{"name":"join_uses_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"join_uses_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"join_uses_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"petitions","indexes":[{"name":"petitions_created_by_id_fk","columns":["created_by_id"]},{"name":"petitions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"petitions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"petitions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"hook","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_questions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"petition_signatures","indexes":[{"name":"petition_signatures_created_by_id_fk","columns":["created_by_id"]},{"name":"petition_signatures_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"petition_signatures_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"petition_signatures_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"question_answers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts","indexes":[{"type":"unique","name":"posts_slug_unique","columns":["slug"]},{"name":"posts_created_by_id_fk","columns":["created_by_id"]},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"posts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"posts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"frontpage","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"privacybeleids","indexes":[{"name":"privacybeleids_created_by_id_fk","columns":["created_by_id"]},{"name":"privacybeleids_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"privacybeleids_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"privacybeleids_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"programs","indexes":[{"name":"programs_created_by_id_fk","columns":["created_by_id"]},{"name":"programs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"programs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"programs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"workgroups","indexes":[{"type":"unique","name":"workgroups_slug_unique","columns":["slug"]},{"name":"workgroups_created_by_id_fk","columns":["created_by_id"]},{"name":"workgroups_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"workgroups_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"workgroups_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"about","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"workgroups_pages","indexes":[{"name":"workgroups_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"workgroups_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"workgroups_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"workgroups_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_audit_logs","indexes":[{"name":"strapi_audit_logs_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_audit_logs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_audit_logs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_audit_logs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"payload","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"afdelingen_contactpersonen_links","indexes":[{"name":"afdelingen_contactpersonen_links_fk","columns":["afdeling_id"]},{"name":"afdelingen_contactpersonen_links_inv_fk","columns":["user_id"]},{"name":"afdelingen_contactpersonen_links_unique","columns":["afdeling_id","user_id"],"type":"unique"},{"name":"afdelingen_contactpersonen_links_order_fk","columns":["user_order"]}],"foreignKeys":[{"name":"afdelingen_contactpersonen_links_fk","columns":["afdeling_id"],"referencedColumns":["id"],"referencedTable":"afdelingen","onDelete":"CASCADE"},{"name":"afdelingen_contactpersonen_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"afdeling_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"petitions_post_links","indexes":[{"name":"petitions_post_links_fk","columns":["petition_id"]},{"name":"petitions_post_links_inv_fk","columns":["post_id"]},{"name":"petitions_post_links_unique","columns":["petition_id","post_id"],"type":"unique"}],"foreignKeys":[{"name":"petitions_post_links_fk","columns":["petition_id"],"referencedColumns":["id"],"referencedTable":"petitions","onDelete":"CASCADE"},{"name":"petitions_post_links_inv_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"petition_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"petition_signatures_petition_links","indexes":[{"name":"petition_signatures_petition_links_fk","columns":["petition_signature_id"]},{"name":"petition_signatures_petition_links_inv_fk","columns":["petition_id"]},{"name":"petition_signatures_petition_links_unique","columns":["petition_signature_id","petition_id"],"type":"unique"},{"name":"petition_signatures_petition_links_order_inv_fk","columns":["petition_signature_order"]}],"foreignKeys":[{"name":"petition_signatures_petition_links_fk","columns":["petition_signature_id"],"referencedColumns":["id"],"referencedTable":"petition_signatures","onDelete":"CASCADE"},{"name":"petition_signatures_petition_links_inv_fk","columns":["petition_id"],"referencedColumns":["id"],"referencedTable":"petitions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"petition_signature_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"petition_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"petition_signature_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"posts_afdeling_links","indexes":[{"name":"posts_afdeling_links_fk","columns":["post_id"]},{"name":"posts_afdeling_links_inv_fk","columns":["afdeling_id"]},{"name":"posts_afdeling_links_unique","columns":["post_id","afdeling_id"],"type":"unique"},{"name":"posts_afdeling_links_order_inv_fk","columns":["post_order"]}],"foreignKeys":[{"name":"posts_afdeling_links_fk","columns":["post_id"],"referencedColumns":["id"],"referencedTable":"posts","onDelete":"CASCADE"},{"name":"posts_afdeling_links_inv_fk","columns":["afdeling_id"],"referencedColumns":["id"],"referencedTable":"afdelingen","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"post_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"afdeling_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"post_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_audit_logs_user_links","indexes":[{"name":"strapi_audit_logs_user_links_fk","columns":["audit_log_id"]},{"name":"strapi_audit_logs_user_links_inv_fk","columns":["user_id"]},{"name":"strapi_audit_logs_user_links_unique","columns":["audit_log_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_audit_logs_user_links_fk","columns":["audit_log_id"],"referencedColumns":["id"],"referencedTable":"strapi_audit_logs","onDelete":"CASCADE"},{"name":"strapi_audit_logs_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"audit_log_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2023-04-06 18:17:00.14	ce2e68412d629de856da82e7115b018d
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.auth.connect	2022-01-29 03:00:18.588	2022-01-29 03:00:18.588	\N	\N
2	plugin::users-permissions.user.me	2022-01-29 03:00:18.588	2022-01-29 03:00:18.588	\N	\N
5	plugin::users-permissions.auth.callback	2022-01-29 03:00:18.596	2022-01-29 03:00:18.596	\N	\N
7	plugin::users-permissions.auth.connect	2022-01-29 03:00:18.596	2022-01-29 03:00:18.596	\N	\N
9	plugin::users-permissions.auth.register	2022-01-29 03:00:18.596	2022-01-29 03:00:18.596	\N	\N
11	plugin::users-permissions.user.me	2022-01-29 03:00:18.596	2022-01-29 03:00:18.596	\N	\N
13	api::about-us.about-us.find	2022-01-30 13:51:18.484	2022-01-30 13:51:18.484	\N	\N
14	api::afdeling.afdeling.find	2022-01-30 13:51:18.484	2022-01-30 13:51:18.484	\N	\N
15	api::afdeling.afdeling.findOne	2022-01-30 13:51:18.484	2022-01-30 13:51:18.484	\N	\N
17	api::about-us.about-us.find	2022-01-30 16:27:22.415	2022-01-30 16:27:22.415	\N	\N
19	api::afdeling.afdeling.find	2022-01-30 16:27:22.416	2022-01-30 16:27:22.416	\N	\N
20	api::afdeling.afdeling.findOne	2022-01-30 16:27:22.416	2022-01-30 16:27:22.416	\N	\N
32	api::privacybeleid.privacybeleid.find	2022-01-30 22:57:32.096	2022-01-30 22:57:32.096	\N	\N
33	api::post.post.find	2022-02-05 01:40:29.209	2022-02-05 01:40:29.209	\N	\N
34	api::post.post.findOne	2022-02-05 01:40:29.209	2022-02-05 01:40:29.209	\N	\N
35	api::home.home.find	2022-02-08 23:50:22.823	2022-02-08 23:50:22.823	\N	\N
36	api::join-us.join-us.find	2022-02-13 16:44:27.808	2022-02-13 16:44:27.808	\N	\N
40	api::confidant.confidant.find	2022-02-13 18:22:00.755	2022-02-13 18:22:00.755	\N	\N
41	api::confidant.confidant.findOne	2022-02-13 18:22:00.755	2022-02-13 18:22:00.755	\N	\N
42	api::confidants-page.confidants-page.find	2022-02-13 19:26:35.587	2022-02-13 19:26:35.587	\N	\N
43	api::workgroup.workgroup.find	2022-02-13 21:44:21.743	2022-02-13 21:44:21.743	\N	\N
44	api::workgroup.workgroup.findOne	2022-02-13 21:44:21.743	2022-02-13 21:44:21.743	\N	\N
45	api::program.program.find	2022-05-28 12:53:52.727	2022-05-28 12:53:52.727	\N	\N
47	api::fallback.fallback.find	2022-07-15 19:02:58.211	2022-07-15 19:02:58.211	\N	\N
48	api::petition.petition.findOne	2022-11-28 19:49:12.253	2022-11-28 19:49:12.253	\N	\N
49	api::petition.petition.find	2022-11-28 19:49:12.253	2022-11-28 19:49:12.253	\N	\N
50	api::petition-signature.petition-signature.add	2022-11-28 19:50:01.164	2022-11-28 19:50:01.164	\N	\N
51	api::petition-signature.petition-signature.confirm	2022-11-28 19:50:01.164	2022-11-28 19:50:01.164	\N	\N
52	api::workgroups-page.workgroups-page.find	2023-04-06 18:29:50.133	2023-04-06 18:29:50.133	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.up_permissions_role_links (permission_id, role_id, id, permission_order) FROM stdin;
1	1	1	\N
2	1	2	\N
7	2	3	\N
5	2	4	\N
9	2	5	\N
11	2	6	\N
13	2	7	\N
15	2	8	\N
14	2	9	\N
17	1	10	\N
19	1	11	\N
20	1	12	\N
32	2	13	\N
33	2	14	\N
34	2	15	\N
35	2	16	\N
36	2	17	\N
40	2	19	\N
41	2	20	\N
42	2	21	\N
43	2	22	\N
44	2	23	\N
45	2	24	\N
47	2	25	\N
48	2	26	1
49	2	27	1
50	2	28	2
51	2	29	2
52	2	30	3
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Lid	Rol voor normale leden	authenticated	2022-01-29 03:00:18.574	2022-01-30 16:27:22.41	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-01-29 03:00:18.579	2023-04-06 18:30:42.891	\N	\N
\.


--
-- Data for Name: workgroups; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.workgroups (id, name, about, created_at, updated_at, published_at, created_by_id, updated_by_id, slug) FROM stdin;
3	Webteam	Het webteam is een werkgroep verantwoordelijk voor het onderhouden van roodjongeren.nl en mijnrood.nl. Om de drie weken vergadert het webteam digitaal om tickets te prioriteren en het gedane werk te bespreken.\n\nWe horen graag van je als je technische vragen of opmerkingen hebt. Als je ROOD-lid bent met IT-kennis en je graag een steentje wilt bijdragen dan ben je natuurlijk van harte welkom om het webteam te versterken.\nJe kan contact met ons opnemen via [webteam@roodjongeren.nl](mailto:webteam@roodjongeren.nl).\n\nAls je suggesties hebt voor de website, of problemen wilt rapporteren, dan kan dat via de GitHub-repository van onze website op <https://github.com/roodjong/roodjongeren>.	2022-03-26 16:00:28.055	2022-11-03 14:32:31.168	2022-03-26 16:00:39.235	1	1	webteam
8	ROOD tegen het Patriarchaat	ROOD tegen het patriarchaat is de belangenwerkgroep voor vrouwen binnen ROOD. Hier staat het bespreken van problemen als genderongelijkheid, seksisme en het patriarchaat zowel binnen als buiten ROOD centraal. \n\nWil jij deze werkgroep komen versterken? Neem dan contact op met de voorzitter van ROOD tegen het Patriarchaat.	2022-08-11 19:27:41.482	2023-05-10 17:10:26.005	2022-08-21 19:04:22.792	1	1	rood-tegen-het-patriarchaat
6	Scholingswerkgroep	De scholingswerkgroep maakt scholingen. Ze maken ook discussiemomenten die in groepen worden besproken en dragen bij aan ander scholingsmateriaal.\n\nContactpersoon: Jules Maximus [scholingswerkgroep@roodjongeren.nl](mailto:scholingswerkgroep@roodjongeren.nl)	2022-06-07 18:45:27.056	2023-06-22 17:34:08.771	2022-06-07 18:45:28.395	1	1	scholingswerkgroep
9	Redactie	De redactie is verantwoordelijk voor het redigeren en plaatsen van stukken op de ROOD-site.\n\nWil je een stuk laten publiceren of op een andere manier hieraan bijdragen? Neem dan contact op via redactie@roodjongeren.nl.	2023-01-30 10:31:44.206	2023-05-07 17:54:49.898	2023-01-30 10:31:47.265	\N	1	redactie
4	Communicatiewerkgroep	De Communicatiewerkgroep van ROOD is verantwoordelijk voor het beheren van onze Twitter-, Instagram-, Facebook- en Tiktok-pagina's! Samen met het bestuur werken zij om ROOD van haar beste kant te laten zien op het internet. Dit doen ze door leuke posts te schrijven, maar ook door deze van een krachtige en strijdbare vormgeving te voorzien.\n\nWil jij deze werkgroep versterken? Neem dan contact op met de voorzitter van het social media team: Gijs Marteau via info@roodjongeren.nl	2022-04-09 14:40:05.634	2024-04-30 15:22:01.945	2022-04-09 14:40:08.004	1	1	communicatiewerkgroep
\.


--
-- Data for Name: workgroups_pages; Type: TABLE DATA; Schema: public; Owner: rood
--

COPY public.workgroups_pages (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	We hebben de volgende werkgroepen:	2023-04-06 18:48:09.219	2023-04-06 18:49:26.181	1	1
\.


--
-- Name: about_uses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.about_uses_id_seq', 1, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 469, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 253, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 7, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 65, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 103, true);


--
-- Name: afdelingen_contactpersonen_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.afdelingen_contactpersonen_links_id_seq', 37, true);


--
-- Name: afdelingen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.afdelingen_id_seq', 18, true);


--
-- Name: confidants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.confidants_id_seq', 5, true);


--
-- Name: confidants_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.confidants_pages_id_seq', 1, true);


--
-- Name: fallbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.fallbacks_id_seq', 1, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 67, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.files_id_seq', 313, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 653, true);


--
-- Name: homes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.homes_id_seq', 1, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 2, true);


--
-- Name: join_uses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.join_uses_id_seq', 1, true);


--
-- Name: petition_signatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.petition_signatures_id_seq', 623, true);


--
-- Name: petition_signatures_petition_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.petition_signatures_petition_links_id_seq', 623, true);


--
-- Name: petitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.petitions_id_seq', 4, true);


--
-- Name: petitions_post_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.petitions_post_links_id_seq', 4, true);


--
-- Name: posts_afdeling_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.posts_afdeling_links_id_seq', 230, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.posts_id_seq', 476, true);


--
-- Name: privacybeleids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.privacybeleids_id_seq', 1, true);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.programs_id_seq', 1, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_audit_logs_id_seq', 1, false);


--
-- Name: strapi_audit_logs_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_audit_logs_user_links_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 48, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 37, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 52, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 30, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.up_users_id_seq', 43, true);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 41, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 2, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: workgroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.workgroups_id_seq', 9, true);


--
-- Name: workgroups_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rood
--

SELECT pg_catalog.setval('public.workgroups_pages_id_seq', 1, true);


--
-- Name: about_uses about_uses_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.about_uses
    ADD CONSTRAINT about_uses_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: afdelingen_contactpersonen_links afdelingen_contactpersonen_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen_contactpersonen_links
    ADD CONSTRAINT afdelingen_contactpersonen_links_pkey PRIMARY KEY (id);


--
-- Name: afdelingen_contactpersonen_links afdelingen_contactpersonen_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen_contactpersonen_links
    ADD CONSTRAINT afdelingen_contactpersonen_links_unique UNIQUE (afdeling_id, user_id);


--
-- Name: afdelingen afdelingen_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen
    ADD CONSTRAINT afdelingen_pkey PRIMARY KEY (id);


--
-- Name: afdelingen afdelingen_slug_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen
    ADD CONSTRAINT afdelingen_slug_unique UNIQUE (slug);


--
-- Name: confidants_pages confidants_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants_pages
    ADD CONSTRAINT confidants_pages_pkey PRIMARY KEY (id);


--
-- Name: confidants confidants_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants
    ADD CONSTRAINT confidants_pkey PRIMARY KEY (id);


--
-- Name: fallbacks fallbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.fallbacks
    ADD CONSTRAINT fallbacks_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: homes homes_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.homes
    ADD CONSTRAINT homes_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: join_uses join_uses_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.join_uses
    ADD CONSTRAINT join_uses_pkey PRIMARY KEY (id);


--
-- Name: petition_signatures_petition_links petition_signatures_petition_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures_petition_links
    ADD CONSTRAINT petition_signatures_petition_links_pkey PRIMARY KEY (id);


--
-- Name: petition_signatures_petition_links petition_signatures_petition_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures_petition_links
    ADD CONSTRAINT petition_signatures_petition_links_unique UNIQUE (petition_signature_id, petition_id);


--
-- Name: petition_signatures petition_signatures_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures
    ADD CONSTRAINT petition_signatures_pkey PRIMARY KEY (id);


--
-- Name: petitions petitions_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions
    ADD CONSTRAINT petitions_pkey PRIMARY KEY (id);


--
-- Name: petitions_post_links petitions_post_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions_post_links
    ADD CONSTRAINT petitions_post_links_pkey PRIMARY KEY (id);


--
-- Name: petitions_post_links petitions_post_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions_post_links
    ADD CONSTRAINT petitions_post_links_unique UNIQUE (petition_id, post_id);


--
-- Name: posts_afdeling_links posts_afdeling_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts_afdeling_links
    ADD CONSTRAINT posts_afdeling_links_pkey PRIMARY KEY (id);


--
-- Name: posts_afdeling_links posts_afdeling_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts_afdeling_links
    ADD CONSTRAINT posts_afdeling_links_unique UNIQUE (post_id, afdeling_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- Name: privacybeleids privacybeleids_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.privacybeleids
    ADD CONSTRAINT privacybeleids_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_audit_logs strapi_audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs
    ADD CONSTRAINT strapi_audit_logs_pkey PRIMARY KEY (id);


--
-- Name: strapi_audit_logs_user_links strapi_audit_logs_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs_user_links
    ADD CONSTRAINT strapi_audit_logs_user_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_audit_logs_user_links strapi_audit_logs_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs_user_links
    ADD CONSTRAINT strapi_audit_logs_user_links_unique UNIQUE (audit_log_id, user_id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: workgroups_pages workgroups_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups_pages
    ADD CONSTRAINT workgroups_pages_pkey PRIMARY KEY (id);


--
-- Name: workgroups workgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_pkey PRIMARY KEY (id);


--
-- Name: workgroups workgroups_slug_unique; Type: CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_slug_unique UNIQUE (slug);


--
-- Name: about_uses_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX about_uses_created_by_id_fk ON public.about_uses USING btree (created_by_id);


--
-- Name: about_uses_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX about_uses_updated_by_id_fk ON public.about_uses USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: afdelingen_contactpersonen_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX afdelingen_contactpersonen_links_fk ON public.afdelingen_contactpersonen_links USING btree (afdeling_id);


--
-- Name: afdelingen_contactpersonen_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX afdelingen_contactpersonen_links_inv_fk ON public.afdelingen_contactpersonen_links USING btree (user_id);


--
-- Name: afdelingen_contactpersonen_links_order_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX afdelingen_contactpersonen_links_order_fk ON public.afdelingen_contactpersonen_links USING btree (user_order);


--
-- Name: afdelingen_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX afdelingen_created_by_id_fk ON public.afdelingen USING btree (created_by_id);


--
-- Name: afdelingen_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX afdelingen_updated_by_id_fk ON public.afdelingen USING btree (updated_by_id);


--
-- Name: confidants_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX confidants_created_by_id_fk ON public.confidants USING btree (created_by_id);


--
-- Name: confidants_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX confidants_pages_created_by_id_fk ON public.confidants_pages USING btree (created_by_id);


--
-- Name: confidants_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX confidants_pages_updated_by_id_fk ON public.confidants_pages USING btree (updated_by_id);


--
-- Name: confidants_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX confidants_updated_by_id_fk ON public.confidants USING btree (updated_by_id);


--
-- Name: fallbacks_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX fallbacks_created_by_id_fk ON public.fallbacks USING btree (created_by_id);


--
-- Name: fallbacks_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX fallbacks_updated_by_id_fk ON public.fallbacks USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: homes_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX homes_created_by_id_fk ON public.homes USING btree (created_by_id);


--
-- Name: homes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX homes_updated_by_id_fk ON public.homes USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: join_uses_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX join_uses_created_by_id_fk ON public.join_uses USING btree (created_by_id);


--
-- Name: join_uses_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX join_uses_updated_by_id_fk ON public.join_uses USING btree (updated_by_id);


--
-- Name: petition_signatures_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petition_signatures_created_by_id_fk ON public.petition_signatures USING btree (created_by_id);


--
-- Name: petition_signatures_petition_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petition_signatures_petition_links_fk ON public.petition_signatures_petition_links USING btree (petition_signature_id);


--
-- Name: petition_signatures_petition_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petition_signatures_petition_links_inv_fk ON public.petition_signatures_petition_links USING btree (petition_id);


--
-- Name: petition_signatures_petition_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petition_signatures_petition_links_order_inv_fk ON public.petition_signatures_petition_links USING btree (petition_signature_order);


--
-- Name: petition_signatures_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petition_signatures_updated_by_id_fk ON public.petition_signatures USING btree (updated_by_id);


--
-- Name: petitions_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petitions_created_by_id_fk ON public.petitions USING btree (created_by_id);


--
-- Name: petitions_post_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petitions_post_links_fk ON public.petitions_post_links USING btree (petition_id);


--
-- Name: petitions_post_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petitions_post_links_inv_fk ON public.petitions_post_links USING btree (post_id);


--
-- Name: petitions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX petitions_updated_by_id_fk ON public.petitions USING btree (updated_by_id);


--
-- Name: posts_afdeling_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX posts_afdeling_links_fk ON public.posts_afdeling_links USING btree (post_id);


--
-- Name: posts_afdeling_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX posts_afdeling_links_inv_fk ON public.posts_afdeling_links USING btree (afdeling_id);


--
-- Name: posts_afdeling_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX posts_afdeling_links_order_inv_fk ON public.posts_afdeling_links USING btree (post_order);


--
-- Name: posts_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX posts_created_by_id_fk ON public.posts USING btree (created_by_id);


--
-- Name: posts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX posts_updated_by_id_fk ON public.posts USING btree (updated_by_id);


--
-- Name: privacybeleids_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX privacybeleids_created_by_id_fk ON public.privacybeleids USING btree (created_by_id);


--
-- Name: privacybeleids_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX privacybeleids_updated_by_id_fk ON public.privacybeleids USING btree (updated_by_id);


--
-- Name: programs_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX programs_created_by_id_fk ON public.programs USING btree (created_by_id);


--
-- Name: programs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX programs_updated_by_id_fk ON public.programs USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_audit_logs_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_audit_logs_created_by_id_fk ON public.strapi_audit_logs USING btree (created_by_id);


--
-- Name: strapi_audit_logs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_audit_logs_updated_by_id_fk ON public.strapi_audit_logs USING btree (updated_by_id);


--
-- Name: strapi_audit_logs_user_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_audit_logs_user_links_fk ON public.strapi_audit_logs_user_links USING btree (audit_log_id);


--
-- Name: strapi_audit_logs_user_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_audit_logs_user_links_inv_fk ON public.strapi_audit_logs_user_links USING btree (user_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: workgroups_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX workgroups_created_by_id_fk ON public.workgroups USING btree (created_by_id);


--
-- Name: workgroups_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX workgroups_pages_created_by_id_fk ON public.workgroups_pages USING btree (created_by_id);


--
-- Name: workgroups_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX workgroups_pages_updated_by_id_fk ON public.workgroups_pages USING btree (updated_by_id);


--
-- Name: workgroups_updated_by_id_fk; Type: INDEX; Schema: public; Owner: rood
--

CREATE INDEX workgroups_updated_by_id_fk ON public.workgroups USING btree (updated_by_id);


--
-- Name: about_uses about_uses_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.about_uses
    ADD CONSTRAINT about_uses_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: about_uses about_uses_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.about_uses
    ADD CONSTRAINT about_uses_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: afdelingen_contactpersonen_links afdelingen_contactpersonen_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen_contactpersonen_links
    ADD CONSTRAINT afdelingen_contactpersonen_links_fk FOREIGN KEY (afdeling_id) REFERENCES public.afdelingen(id) ON DELETE CASCADE;


--
-- Name: afdelingen_contactpersonen_links afdelingen_contactpersonen_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen_contactpersonen_links
    ADD CONSTRAINT afdelingen_contactpersonen_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: afdelingen afdelingen_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen
    ADD CONSTRAINT afdelingen_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: afdelingen afdelingen_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.afdelingen
    ADD CONSTRAINT afdelingen_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: confidants confidants_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants
    ADD CONSTRAINT confidants_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: confidants_pages confidants_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants_pages
    ADD CONSTRAINT confidants_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: confidants_pages confidants_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants_pages
    ADD CONSTRAINT confidants_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: confidants confidants_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.confidants
    ADD CONSTRAINT confidants_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: fallbacks fallbacks_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.fallbacks
    ADD CONSTRAINT fallbacks_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: fallbacks fallbacks_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.fallbacks
    ADD CONSTRAINT fallbacks_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: homes homes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.homes
    ADD CONSTRAINT homes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: homes homes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.homes
    ADD CONSTRAINT homes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: join_uses join_uses_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.join_uses
    ADD CONSTRAINT join_uses_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: join_uses join_uses_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.join_uses
    ADD CONSTRAINT join_uses_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: petition_signatures petition_signatures_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures
    ADD CONSTRAINT petition_signatures_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: petition_signatures_petition_links petition_signatures_petition_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures_petition_links
    ADD CONSTRAINT petition_signatures_petition_links_fk FOREIGN KEY (petition_signature_id) REFERENCES public.petition_signatures(id) ON DELETE CASCADE;


--
-- Name: petition_signatures_petition_links petition_signatures_petition_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures_petition_links
    ADD CONSTRAINT petition_signatures_petition_links_inv_fk FOREIGN KEY (petition_id) REFERENCES public.petitions(id) ON DELETE CASCADE;


--
-- Name: petition_signatures petition_signatures_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petition_signatures
    ADD CONSTRAINT petition_signatures_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: petitions petitions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions
    ADD CONSTRAINT petitions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: petitions_post_links petitions_post_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions_post_links
    ADD CONSTRAINT petitions_post_links_fk FOREIGN KEY (petition_id) REFERENCES public.petitions(id) ON DELETE CASCADE;


--
-- Name: petitions_post_links petitions_post_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions_post_links
    ADD CONSTRAINT petitions_post_links_inv_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: petitions petitions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.petitions
    ADD CONSTRAINT petitions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: posts_afdeling_links posts_afdeling_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts_afdeling_links
    ADD CONSTRAINT posts_afdeling_links_fk FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts_afdeling_links posts_afdeling_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts_afdeling_links
    ADD CONSTRAINT posts_afdeling_links_inv_fk FOREIGN KEY (afdeling_id) REFERENCES public.afdelingen(id) ON DELETE CASCADE;


--
-- Name: posts posts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: posts posts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacybeleids privacybeleids_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.privacybeleids
    ADD CONSTRAINT privacybeleids_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacybeleids privacybeleids_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.privacybeleids
    ADD CONSTRAINT privacybeleids_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: programs programs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: programs programs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_audit_logs strapi_audit_logs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs
    ADD CONSTRAINT strapi_audit_logs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_audit_logs strapi_audit_logs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs
    ADD CONSTRAINT strapi_audit_logs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_audit_logs_user_links strapi_audit_logs_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs_user_links
    ADD CONSTRAINT strapi_audit_logs_user_links_fk FOREIGN KEY (audit_log_id) REFERENCES public.strapi_audit_logs(id) ON DELETE CASCADE;


--
-- Name: strapi_audit_logs_user_links strapi_audit_logs_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_audit_logs_user_links
    ADD CONSTRAINT strapi_audit_logs_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: workgroups workgroups_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: workgroups_pages workgroups_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups_pages
    ADD CONSTRAINT workgroups_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: workgroups_pages workgroups_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups_pages
    ADD CONSTRAINT workgroups_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: workgroups workgroups_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: rood
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

