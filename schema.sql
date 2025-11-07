--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-07 14:53:46

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 40961)
-- Name: api_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_logs (
    id integer NOT NULL,
    user_id integer,
    endpoint character varying(200),
    request_body jsonb,
    response_body jsonb,
    status_code integer,
    called_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    method character varying(10),
    ip_address character varying(45),
    latency_ms integer,
    error_message text,
    ai_model character varying(100),
    ai_tokens_used integer,
    ai_latency_ms integer
);


ALTER TABLE public.api_logs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 40960)
-- Name: api_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_logs_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 229
-- Name: api_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_logs_id_seq OWNED BY public.api_logs.id;


--
-- TOC entry 226 (class 1259 OID 32769)
-- Name: phishing_scenarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phishing_scenarios (
    id integer NOT NULL,
    scenario text NOT NULL,
    title character varying(200),
    attack_type character varying(50),
    risk_level integer,
    source_url character varying(300),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    label_json jsonb
);


ALTER TABLE public.phishing_scenarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32768)
-- Name: phishing_scenarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phishing_scenarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phishing_scenarios_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 225
-- Name: phishing_scenarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phishing_scenarios_id_seq OWNED BY public.phishing_scenarios.id;


--
-- TOC entry 228 (class 1259 OID 32778)
-- Name: quiz_choices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_choices (
    id integer NOT NULL,
    scenario_id integer,
    choice_text text NOT NULL,
    correct boolean NOT NULL
);


ALTER TABLE public.quiz_choices OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32777)
-- Name: quiz_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_choices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_choices_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 227
-- Name: quiz_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_choices_id_seq OWNED BY public.quiz_choices.id;


--
-- TOC entry 220 (class 1259 OID 24717)
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    id integer NOT NULL,
    scenario text NOT NULL,
    choice_text text NOT NULL,
    correct boolean NOT NULL,
    scenario_id integer,
    question_text text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    difficulty_level integer DEFAULT 1
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24716)
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_questions_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 219
-- Name: quiz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_questions_id_seq OWNED BY public.quiz_questions.id;


--
-- TOC entry 224 (class 1259 OID 24739)
-- Name: quiz_responses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_responses (
    id integer NOT NULL,
    quiz_session_id integer,
    quiz_id integer,
    answer text NOT NULL,
    is_correct boolean,
    response_time_ms integer,
    ai_feedback text,
    score integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.quiz_responses OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24738)
-- Name: quiz_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_responses_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 223
-- Name: quiz_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_responses_id_seq OWNED BY public.quiz_responses.id;


--
-- TOC entry 222 (class 1259 OID 24726)
-- Name: quiz_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_sessions (
    id integer NOT NULL,
    user_id integer,
    started_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ended_at timestamp without time zone
);


ALTER TABLE public.quiz_sessions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24725)
-- Name: quiz_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 221
-- Name: quiz_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_sessions_id_seq OWNED BY public.quiz_sessions.id;


--
-- TOC entry 218 (class 1259 OID 24704)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    nickname character varying(50),
    provider character varying(20),
    provider_id text,
    email_verified boolean DEFAULT false,
    email_token text,
    token_created_at timestamp without time zone,
    registered_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24703)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4789 (class 2604 OID 40964)
-- Name: api_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs ALTER COLUMN id SET DEFAULT nextval('public.api_logs_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 32772)
-- Name: phishing_scenarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phishing_scenarios ALTER COLUMN id SET DEFAULT nextval('public.phishing_scenarios_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 32781)
-- Name: quiz_choices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_choices ALTER COLUMN id SET DEFAULT nextval('public.quiz_choices_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 24720)
-- Name: quiz_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 24742)
-- Name: quiz_responses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_responses ALTER COLUMN id SET DEFAULT nextval('public.quiz_responses_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 24729)
-- Name: quiz_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_sessions ALTER COLUMN id SET DEFAULT nextval('public.quiz_sessions_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 24707)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4982 (class 0 OID 40961)
-- Dependencies: 230
-- Data for Name: api_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_logs (id, user_id, endpoint, request_body, response_body, status_code, called_at, method, ip_address, latency_ms, error_message, ai_model, ai_tokens_used, ai_latency_ms) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 32769)
-- Dependencies: 226
-- Data for Name: phishing_scenarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phishing_scenarios (id, scenario, title, attack_type, risk_level, source_url, created_at, updated_at, label_json) FROM stdin;
\.


--
-- TOC entry 4980 (class 0 OID 32778)
-- Dependencies: 228
-- Data for Name: quiz_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_choices (id, scenario_id, choice_text, correct) FROM stdin;
\.


--
-- TOC entry 4972 (class 0 OID 24717)
-- Dependencies: 220
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_questions (id, scenario, choice_text, correct, scenario_id, question_text, created_at, updated_at, difficulty_level) FROM stdin;
\.


--
-- TOC entry 4976 (class 0 OID 24739)
-- Dependencies: 224
-- Data for Name: quiz_responses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_responses (id, quiz_session_id, quiz_id, answer, is_correct, response_time_ms, ai_feedback, score, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4974 (class 0 OID 24726)
-- Dependencies: 222
-- Data for Name: quiz_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_sessions (id, user_id, started_at, ended_at) FROM stdin;
\.


--
-- TOC entry 4970 (class 0 OID 24704)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, nickname, provider, provider_id, email_verified, email_token, token_created_at, registered_at) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 229
-- Name: api_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_logs_id_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 225
-- Name: phishing_scenarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phishing_scenarios_id_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 227
-- Name: quiz_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_choices_id_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 219
-- Name: quiz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_questions_id_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 223
-- Name: quiz_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_responses_id_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 221
-- Name: quiz_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_sessions_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4815 (class 2606 OID 40969)
-- Name: api_logs api_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT api_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 32776)
-- Name: phishing_scenarios phishing_scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phishing_scenarios
    ADD CONSTRAINT phishing_scenarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 32785)
-- Name: quiz_choices quiz_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_choices
    ADD CONSTRAINT quiz_choices_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 24724)
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 24746)
-- Name: quiz_responses quiz_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_responses
    ADD CONSTRAINT quiz_responses_pkey PRIMARY KEY (id);


--
-- TOC entry 4801 (class 2606 OID 24732)
-- Name: quiz_sessions quiz_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 24715)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4794 (class 2606 OID 24713)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 1259 OID 40979)
-- Name: api_logs_called_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_logs_called_at_idx ON public.api_logs USING btree (called_at DESC);


--
-- TOC entry 4813 (class 1259 OID 40980)
-- Name: api_logs_endpoint_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_logs_endpoint_idx ON public.api_logs USING btree (endpoint);


--
-- TOC entry 4816 (class 1259 OID 40981)
-- Name: api_logs_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_logs_status_idx ON public.api_logs USING btree (status_code);


--
-- TOC entry 4817 (class 1259 OID 40982)
-- Name: api_logs_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_logs_user_idx ON public.api_logs USING btree (user_id);


--
-- TOC entry 4795 (class 1259 OID 57373)
-- Name: quiz_questions_correct_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_questions_correct_idx ON public.quiz_questions USING btree (correct);


--
-- TOC entry 4796 (class 1259 OID 57372)
-- Name: quiz_questions_difficulty_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_questions_difficulty_idx ON public.quiz_questions USING btree (difficulty_level);


--
-- TOC entry 4799 (class 1259 OID 57371)
-- Name: quiz_questions_scenario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_questions_scenario_idx ON public.quiz_questions USING btree (scenario_id);


--
-- TOC entry 4802 (class 1259 OID 57379)
-- Name: quiz_responses_correct_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_responses_correct_idx ON public.quiz_responses USING btree (is_correct);


--
-- TOC entry 4803 (class 1259 OID 57380)
-- Name: quiz_responses_created_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_responses_created_idx ON public.quiz_responses USING btree (created_at DESC);


--
-- TOC entry 4806 (class 1259 OID 57378)
-- Name: quiz_responses_question_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_responses_question_idx ON public.quiz_responses USING btree (quiz_id);


--
-- TOC entry 4807 (class 1259 OID 57377)
-- Name: quiz_responses_session_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quiz_responses_session_idx ON public.quiz_responses USING btree (quiz_session_id);


--
-- TOC entry 4823 (class 2606 OID 40970)
-- Name: api_logs api_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_logs
    ADD CONSTRAINT api_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4818 (class 2606 OID 57366)
-- Name: quiz_questions fk_scenario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_scenario FOREIGN KEY (scenario_id) REFERENCES public.phishing_scenarios(id) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 32786)
-- Name: quiz_choices quiz_choices_scenario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_choices
    ADD CONSTRAINT quiz_choices_scenario_id_fkey FOREIGN KEY (scenario_id) REFERENCES public.phishing_scenarios(id);


--
-- TOC entry 4820 (class 2606 OID 24752)
-- Name: quiz_responses quiz_responses_quiz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_responses
    ADD CONSTRAINT quiz_responses_quiz_id_fkey FOREIGN KEY (quiz_id) REFERENCES public.quiz_questions(id) ON DELETE CASCADE;


--
-- TOC entry 4821 (class 2606 OID 24747)
-- Name: quiz_responses quiz_responses_quiz_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_responses
    ADD CONSTRAINT quiz_responses_quiz_session_id_fkey FOREIGN KEY (quiz_session_id) REFERENCES public.quiz_sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 24733)
-- Name: quiz_sessions quiz_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2025-11-07 14:53:46

--
-- PostgreSQL database dump complete
--

