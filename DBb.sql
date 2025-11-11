--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-11 19:23:24

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
1	기본 피싱 상식	OX 퀴즈용 시나리오	정보 사칭	1	https://example.com	2025-11-11 15:02:57.724187	2025-11-11 15:02:57.724187	{}
2	객관식 피싱 퀴즈	피싱 유형 객관식 문제	사회공학	2	https://example.com	2025-11-11 15:14:53.858936	2025-11-11 15:14:53.858936	{}
\.


--
-- TOC entry 4980 (class 0 OID 32778)
-- Dependencies: 228
-- Data for Name: quiz_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_choices (id, scenario_id, choice_text, correct) FROM stdin;
11	1	피싱문자에는 종종 당첨금, 환불, 세금환급 등 유혹적인 문구가 포함된다.	t
12	1	공공기관이나 은행은 절대 문자나 이메일로 계좌번호나 비밀번호를 요구하지 않는다.	t
13	1	피싱 사이트는 항상 공식 사이트와 완전히 동일한 주소를 사용하므로 URL 확인은 필요없다.	f
14	1	출처가 불분명한 앱 설치 요청이나 파일 첨부는 열어도 된다.	f
15	1	피싱문자나 메일에 포함된 링크를 클릭하기 전에는 발신자를 꼼꼼히 확인해야 한다.	t
16	1	카카오톡에서 친구가 "나 지금 급해서 그런데 돈 좀 빌려줘"라고 하면 바로 입금해주는 것이 맞다.	f
17	1	QR코드는 어디에서 찍든지 안전하다. 그냥 찍어도 상관없다.	f
18	1	이메일로 온 "세금 미납 안내"에 첨부된 압축파일은 안전하지 않을 수 있다.	t
19	1	앱 설치를 유도하는 메시지는 무조건 악성 피싱이다.	f
20	1	연휴 기간에는 피싱 공격이 줄어든다.	f
\.


--
-- TOC entry 4972 (class 0 OID 24717)
-- Dependencies: 220
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_questions (id, scenario, choice_text, correct, scenario_id, question_text, created_at, updated_at, difficulty_level) FROM stdin;
1	피싱 예방	영상통화를 피하고 문자만 사용	f	1	다음 중 "몸캠 피싱"에 가장 효과적인 사전 예방 방법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
2	피싱 예방	알 수 없는 링크 클릭 금지	f	1	다음 중 "몸캠 피싱"에 가장 효과적인 사전 예방 방법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
3	피싱 예방	스마트폰에 보안 앱 설치	f	1	다음 중 "몸캠 피싱"에 가장 효과적인 사전 예방 방법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
4	피싱 예방	낯선 사람과의 영상통화 중 민감한 행위 금지	t	1	다음 중 "몸캠 피싱"에 가장 효과적인 사전 예방 방법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
5	피싱 유형	상대방의 주민번호를 요구	f	1	다음 중 “로톡, 변호사 사칭 피싱”의 주요 특징은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
6	피싱 유형	법적 소송 진행 중이라며 합의금을 요구	t	1	다음 중 “로톡, 변호사 사칭 피싱”의 주요 특징은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
7	피싱 유형	병원 예약을 대신 진행해 준다	f	1	다음 중 “로톡, 변호사 사칭 피싱”의 주요 특징은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
8	피싱 유형	쇼핑몰 포인트를 제공한다	f	1	다음 중 “로톡, 변호사 사칭 피싱”의 주요 특징은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
9	피싱 대응	SNS에 글을 올려 사람들에게 알린다	f	1	다음 중 **피싱 피해 직후** 가장 먼저 해야 하는 조치는?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
10	피싱 대응	범죄자에게 다시 연락해본다	f	1	다음 중 **피싱 피해 직후** 가장 먼저 해야 하는 조치는?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
11	피싱 대응	경찰청 사이버범죄 신고 또는 금감원 지급정지 요청	t	1	다음 중 **피싱 피해 직후** 가장 먼저 해야 하는 조치는?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
12	피싱 대응	핸드폰을 껐다가 켠다	f	1	다음 중 **피싱 피해 직후** 가장 먼저 해야 하는 조치는?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
13	택배 피싱	배송 주소를 재입력하라는 메시지 링크 클릭	t	1	다음 중 ‘택배 피싱’에 해당하는 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
14	택배 피싱	택배 기사와 직접 통화	f	1	다음 중 ‘택배 피싱’에 해당하는 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
15	택배 피싱	쇼핑몰에서 배송조회 버튼 클릭	f	1	다음 중 ‘택배 피싱’에 해당하는 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
16	택배 피싱	마트에서 영수증 확인	f	1	다음 중 ‘택배 피싱’에 해당하는 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
17	문서형 피싱	전화번호 수집	f	1	청첩장, 부고장 피싱의 공통된 유도 방식은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
18	문서형 피싱	위장된 문서 파일 열기 유도	t	1	청첩장, 부고장 피싱의 공통된 유도 방식은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
19	문서형 피싱	고인 정보 조작	f	1	청첩장, 부고장 피싱의 공통된 유도 방식은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
20	문서형 피싱	로그인을 요구하는 게임	f	1	청첩장, 부고장 피싱의 공통된 유도 방식은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
21	피싱 일반	깔끔하고 맞춤법이 완벽하다.	f	1	피싱 문자나 이메일의 특징으로 가장 알맞은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
22	피싱 일반	공식 기관의 로고와 주소가 전혀 없다.	f	1	피싱 문자나 이메일의 특징으로 가장 알맞은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
23	피싱 일반	당첨, 환급 등 긴급하거나 유혹적인 내용이 많다.	t	1	피싱 문자나 이메일의 특징으로 가장 알맞은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
24	피싱 일반	개인정보를 절대 요구하지 않는다.	f	1	피싱 문자나 이메일의 특징으로 가장 알맞은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
25	피싱 예방 행동	모르는 링크라도 눌러서 내용을 확인한다.	f	1	피싱 피해를 막기 위해 가장 먼저 해야 할 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
26	피싱 예방 행동	발신자나 URL 주소를 꼼꼼히 확인한다.	t	1	피싱 피해를 막기 위해 가장 먼저 해야 할 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
27	피싱 예방 행동	문자에 적힌 번호로 바로 전화한다.	f	1	피싱 피해를 막기 위해 가장 먼저 해야 할 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
28	피싱 예방 행동	첨부파일은 무조건 열어본다.	f	1	피싱 피해를 막기 위해 가장 먼저 해야 할 행동은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
29	피싱 예방 습관	은행에서 온 문자라면 무조건 신뢰한다.	f	1	아래 중 피싱 피해 예방 방법으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
30	피싱 예방 습관	의심되는 문자는 지워도 상관없다.	f	1	아래 중 피싱 피해 예방 방법으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
31	피싱 예방 습관	보안 프로그램 업데이트를 미루어도 괜찮다.	f	1	아래 중 피싱 피해 예방 방법으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
32	피싱 예방 습관	링크를 누르기 전에 항상 발신처를 확인한다.	t	1	아래 중 피싱 피해 예방 방법으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
33	피싱 용어	이메일로 오는 피싱 공격이다.	f	1	스미싱에 대한 설명으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
34	피싱 용어	문자 메시지를 이용해 속이는 피싱의 한 형태다.	t	1	스미싱에 대한 설명으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
35	피싱 용어	금융기관에서 발송하는 정상 알림 서비스다.	f	1	스미싱에 대한 설명으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
36	피싱 용어	해킹과 관계없는 안전한 문자다.	f	1	스미싱에 대한 설명으로 옳은 것은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
37	피싱 피해 대응	비밀번호를 그대로 둔다.	f	1	피싱 피해를 입었을 때 올바른 대처법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
38	피싱 피해 대응	모르는 척하고 넘어간다.	f	1	피싱 피해를 입었을 때 올바른 대처법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
39	피싱 피해 대응	즉시 비밀번호를 변경하고 신고한다.	t	1	피싱 피해를 입었을 때 올바른 대처법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
40	피싱 피해 대응	피해 사실을 숨긴다.	f	1	피싱 피해를 입었을 때 올바른 대처법은?	2025-11-11 15:15:13.71801	2025-11-11 15:15:13.71801	1
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

SELECT pg_catalog.setval('public.phishing_scenarios_id_seq', 2, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 227
-- Name: quiz_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_choices_id_seq', 20, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 219
-- Name: quiz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_questions_id_seq', 40, true);


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


-- Completed on 2025-11-11 19:23:24

--
-- PostgreSQL database dump complete
--

