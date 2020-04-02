--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO advaith;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO advaith;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO advaith;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO advaith;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO advaith;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO advaith;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO advaith;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO advaith;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO advaith;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO advaith;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO advaith;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO advaith;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: costs_grade; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.costs_grade (
    "Section" character varying(1000) NOT NULL,
    "Grade" integer NOT NULL,
    id integer NOT NULL,
    "Teacher1" character varying(10000) NOT NULL,
    "Teacher2" character varying(10000) NOT NULL,
    email_1 character varying(254) NOT NULL,
    email_2 character varying(254) NOT NULL,
    CONSTRAINT "costs_grade_Grade_check" CHECK (("Grade" >= 0))
);


ALTER TABLE public.costs_grade OWNER TO advaith;

--
-- Name: costs_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.costs_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.costs_grade_id_seq OWNER TO advaith;

--
-- Name: costs_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.costs_grade_id_seq OWNED BY public.costs_grade.id;


--
-- Name: costs_student; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.costs_student (
    student_grade integer NOT NULL,
    section character varying(1000) NOT NULL,
    "Student_id" integer NOT NULL,
    "Link_id" integer NOT NULL,
    "Student_Name" character varying(100000) NOT NULL,
    CONSTRAINT "costs_student_Student_id_check" CHECK (("Student_id" >= 0)),
    CONSTRAINT costs_student_student_grade_check CHECK ((student_grade >= 0))
);


ALTER TABLE public.costs_student OWNER TO advaith;

--
-- Name: database_book_ind; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.database_book_ind (
    "Ind_Book_ID" integer NOT NULL,
    "ISBN" integer NOT NULL,
    "Name" character varying(1000) NOT NULL,
    "Link_id" integer NOT NULL,
    CONSTRAINT "database_book_ind_ISBN_2f13980f_check" CHECK (("ISBN" >= 0)),
    CONSTRAINT "database_book_ind_Ind_Book_ID_check" CHECK (("Ind_Book_ID" >= 0))
);


ALTER TABLE public.database_book_ind OWNER TO advaith;

--
-- Name: database_books; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.database_books (
    "ISBN" integer NOT NULL,
    "Name" character varying(1000) NOT NULL,
    CONSTRAINT "database_books_ISBN_check" CHECK (("ISBN" >= 0))
);


ALTER TABLE public.database_books OWNER TO advaith;

--
-- Name: database_issues; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.database_issues (
    "Ind_Book_ID" integer NOT NULL,
    "Name" character varying(1000) NOT NULL,
    student_id integer NOT NULL,
    issue_date date NOT NULL,
    "ISBN" integer NOT NULL,
    return_date date NOT NULL,
    "Link_id" integer NOT NULL,
    CONSTRAINT "database_issues_ISBN_3f3fd459_check" CHECK (("ISBN" >= 0)),
    CONSTRAINT "database_issues_Ind_Book_ID_check" CHECK (("Ind_Book_ID" >= 0)),
    CONSTRAINT database_issues_student_id_check CHECK ((student_id >= 0))
);


ALTER TABLE public.database_issues OWNER TO advaith;

--
-- Name: database_late_dues; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.database_late_dues (
    student_id integer NOT NULL,
    "Ind_Book_ID" integer NOT NULL,
    return_date date NOT NULL,
    delay integer NOT NULL,
    "Link_id" integer NOT NULL,
    reported boolean NOT NULL,
    "Name" character varying(1000) NOT NULL,
    CONSTRAINT "database_late_dues_Ind_Book_ID_check" CHECK (("Ind_Book_ID" >= 0)),
    CONSTRAINT database_late_dues_delay_check CHECK ((delay >= 0)),
    CONSTRAINT database_late_dues_student_id_check CHECK ((student_id >= 0))
);


ALTER TABLE public.database_late_dues OWNER TO advaith;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO advaith;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO advaith;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO advaith;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO advaith;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO advaith;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: advaith
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO advaith;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advaith
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: advaith
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO advaith;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: costs_grade id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.costs_grade ALTER COLUMN id SET DEFAULT nextval('public.costs_grade_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_group (id, name) FROM stdin;
1	student
2	teacher
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add issues	7	add_issues
26	Can change issues	7	change_issues
27	Can delete issues	7	delete_issues
28	Can view issues	7	view_issues
29	Can add book_ind	8	add_book_ind
30	Can change book_ind	8	change_book_ind
31	Can delete book_ind	8	delete_book_ind
32	Can view book_ind	8	view_book_ind
33	Can add books	9	add_books
34	Can change books	9	change_books
35	Can delete books	9	delete_books
36	Can view books	9	view_books
37	Can add late_dues	10	add_late_dues
38	Can change late_dues	10	change_late_dues
39	Can delete late_dues	10	delete_late_dues
40	Can view late_dues	10	view_late_dues
41	Can add grade	11	add_grade
42	Can change grade	11	change_grade
43	Can delete grade	11	delete_grade
44	Can view grade	11	view_grade
45	Can add student	12	add_student
46	Can change student	12	change_student
47	Can delete student	12	delete_student
48	Can view student	12	view_student
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$afw2y00zQsNf$ZQCJA01ZLvcKnLcC+YyQ4xHIIcycYIRd2sP0ph9xHgQ=	2020-04-02 13:45:01.209973+05:30	t	admin			advaith.madhukar@gmail.com	t	t	2020-02-24 16:11:21+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	2
2	1	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: costs_grade; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.costs_grade ("Section", "Grade", id, "Teacher1", "Teacher2", email_1, email_2) FROM stdin;
yellow	11	1	Advaith	Advaith	teampaasta@gmail.com	teampaasta@gmail.com
\.


--
-- Data for Name: costs_student; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.costs_student (student_grade, section, "Student_id", "Link_id", "Student_Name") FROM stdin;
11	yellow	1	1	Advaith
\.


--
-- Data for Name: database_book_ind; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.database_book_ind ("Ind_Book_ID", "ISBN", "Name", "Link_id") FROM stdin;
11	1	hacked	1
\.


--
-- Data for Name: database_books; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.database_books ("ISBN", "Name") FROM stdin;
1	hacked
\.


--
-- Data for Name: database_issues; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.database_issues ("Ind_Book_ID", "Name", student_id, issue_date, "ISBN", return_date, "Link_id") FROM stdin;
11	hacked	1	2020-03-31	1	2020-03-30	1
\.


--
-- Data for Name: database_late_dues; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.database_late_dues (student_id, "Ind_Book_ID", return_date, delay, "Link_id", reported, "Name") FROM stdin;
1	11	2020-03-30	1	11	f	hacked
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-02-26 13:55:21.776311+05:30	1	student	1	[{"added": {}}]	3	1
2	2020-02-26 13:55:35.889681+05:30	2	teacher	1	[{"added": {}}]	3	1
3	2020-02-26 20:32:03.781777+05:30	1	admin	2	[{"changed": {"fields": ["Groups"]}}]	4	1
4	2020-03-24 19:26:26.426985+05:30	1	admin	2	[{"changed": {"fields": ["Groups"]}}]	4	1
5	2020-03-30 15:57:03.030114+05:30	11	book_ind object (11)	3		8	1
6	2020-03-31 11:14:30.90696+05:30	11	Issues object (11)	2	[{"changed": {"fields": ["Return date"]}}]	7	1
7	2020-03-31 11:31:24.063792+05:30	11	Late_dues object (11)	2	[{"changed": {"fields": ["Name"]}}]	10	1
8	2020-03-31 18:25:22.461972+05:30	1	student object (1)	2	[{"changed": {"fields": ["Student Name"]}}]	12	1
9	2020-03-31 21:45:58.567552+05:30	11	Issues object (11)	2	[{"changed": {"fields": ["Return date"]}}]	7	1
10	2020-03-31 21:49:16.42571+05:30	11	Late_dues object (11)	3		10	1
11	2020-03-31 22:06:31.293741+05:30	1	grade object (1)	2	[{"changed": {"fields": ["Teacher1", "Teacher2", "Email 1", "Email 2"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	database	issues
8	database	book_ind
9	database	books
10	database	late_dues
11	costs	grade
12	costs	student
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-24 15:40:08.526619+05:30
2	auth	0001_initial	2020-02-24 15:40:08.961377+05:30
3	admin	0001_initial	2020-02-24 15:40:09.89844+05:30
4	admin	0002_logentry_remove_auto_add	2020-02-24 15:40:10.009906+05:30
5	admin	0003_logentry_add_action_flag_choices	2020-02-24 15:40:10.036738+05:30
6	contenttypes	0002_remove_content_type_name	2020-02-24 15:40:10.087787+05:30
7	auth	0002_alter_permission_name_max_length	2020-02-24 15:40:10.110824+05:30
8	auth	0003_alter_user_email_max_length	2020-02-24 15:40:10.139747+05:30
9	auth	0004_alter_user_username_opts	2020-02-24 15:40:10.164679+05:30
10	auth	0005_alter_user_last_login_null	2020-02-24 15:40:10.191029+05:30
11	auth	0006_require_contenttypes_0002	2020-02-24 15:40:10.2124+05:30
12	auth	0007_alter_validators_add_error_messages	2020-02-24 15:40:10.233204+05:30
13	auth	0008_alter_user_username_max_length	2020-02-24 15:40:10.354285+05:30
14	auth	0009_alter_user_last_name_max_length	2020-02-24 15:40:10.376525+05:30
15	auth	0010_alter_group_name_max_length	2020-02-24 15:40:10.402876+05:30
16	auth	0011_update_proxy_permissions	2020-02-24 15:40:10.430612+05:30
17	sessions	0001_initial	2020-02-24 15:40:10.548239+05:30
18	database	0001_initial	2020-03-30 12:06:14.570714+05:30
19	database	0002_issues_return_date	2020-03-30 12:12:11.142921+05:30
20	database	0003_book_ind_name	2020-03-30 12:23:14.215596+05:30
21	database	0004_auto_20200330_1233	2020-03-30 12:33:13.986886+05:30
22	database	0005_auto_20200330_1605	2020-03-30 16:05:22.756248+05:30
23	database	0006_late_dues	2020-03-31 10:50:17.83843+05:30
24	database	0007_late_dues_reported	2020-03-31 11:01:21.834713+05:30
25	database	0008_late_dues_name	2020-03-31 11:30:26.343+05:30
26	costs	0001_initial	2020-03-31 12:34:42.935723+05:30
27	costs	0002_auto_20200331_1239	2020-03-31 12:40:27.962448+05:30
28	costs	0003_grade_id	2020-03-31 12:44:22.452136+05:30
29	costs	0004_auto_20200331_1243	2020-03-31 12:44:22.468415+05:30
30	costs	0005_auto_20200331_1244	2020-03-31 12:47:03.155881+05:30
31	costs	0006_student	2020-03-31 13:51:25.47704+05:30
32	costs	0007_student_student_name	2020-03-31 17:53:43.145368+05:30
33	costs	0008_auto_20200331_1812	2020-03-31 18:13:01.39159+05:30
34	costs	0009_auto_20200331_1821	2020-03-31 18:22:03.644185+05:30
35	costs	0010_auto_20200331_2001	2020-03-31 20:01:37.463747+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: advaith
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ryr726cdskez6dn22a62j4acjsmiacy5	NDFkYzU0NTZmMWNiN2VlODM0OTkwZTAzOTJiNDY1MDc2MDM1ZGExMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDI0OWQwZTNkZTgzZWYwYjIxNjc4OTg1MmFhZTBjYWMxMTdhYjMyIn0=	2020-03-11 13:54:59.743918+05:30
xs4giv6ldwsj30mclipf9bkwmctbsgoo	NDFkYzU0NTZmMWNiN2VlODM0OTkwZTAzOTJiNDY1MDc2MDM1ZGExMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDI0OWQwZTNkZTgzZWYwYjIxNjc4OTg1MmFhZTBjYWMxMTdhYjMyIn0=	2020-04-13 23:02:44.43855+05:30
pci9i1vv5xqmlydp6h92inoupinj3xfb	NDFkYzU0NTZmMWNiN2VlODM0OTkwZTAzOTJiNDY1MDc2MDM1ZGExMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDI0OWQwZTNkZTgzZWYwYjIxNjc4OTg1MmFhZTBjYWMxMTdhYjMyIn0=	2020-04-16 13:45:01.351199+05:30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: costs_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.costs_grade_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advaith
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: costs_grade costs_grade_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.costs_grade
    ADD CONSTRAINT costs_grade_pkey PRIMARY KEY (id);


--
-- Name: costs_student costs_student_Student_id_9406206b_pk; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.costs_student
    ADD CONSTRAINT "costs_student_Student_id_9406206b_pk" PRIMARY KEY ("Student_id");


--
-- Name: costs_student costs_student_Student_id_9406206b_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.costs_student
    ADD CONSTRAINT "costs_student_Student_id_9406206b_uniq" UNIQUE ("Student_id");


--
-- Name: database_book_ind database_book_ind_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_book_ind
    ADD CONSTRAINT database_book_ind_pkey PRIMARY KEY ("Ind_Book_ID");


--
-- Name: database_books database_books_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_books
    ADD CONSTRAINT database_books_pkey PRIMARY KEY ("ISBN");


--
-- Name: database_issues database_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_issues
    ADD CONSTRAINT database_issues_pkey PRIMARY KEY ("Ind_Book_ID");


--
-- Name: database_late_dues database_late_dues_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_late_dues
    ADD CONSTRAINT database_late_dues_pkey PRIMARY KEY ("Ind_Book_ID");


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: costs_student_Link_id_3f4b7858; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX "costs_student_Link_id_3f4b7858" ON public.costs_student USING btree ("Link_id");


--
-- Name: database_book_ind_Link_id_34eebc88; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX "database_book_ind_Link_id_34eebc88" ON public.database_book_ind USING btree ("Link_id");


--
-- Name: database_issues_Link_id_131941d5; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX "database_issues_Link_id_131941d5" ON public.database_issues USING btree ("Link_id");


--
-- Name: database_late_dues_Link_id_dca0363b; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX "database_late_dues_Link_id_dca0363b" ON public.database_late_dues USING btree ("Link_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: advaith
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: costs_student costs_student_Link_id_3f4b7858_fk_costs_grade_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.costs_student
    ADD CONSTRAINT "costs_student_Link_id_3f4b7858_fk_costs_grade_id" FOREIGN KEY ("Link_id") REFERENCES public.costs_grade(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_book_ind database_book_ind_Link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_book_ind
    ADD CONSTRAINT "database_book_ind_Link_id_fkey" FOREIGN KEY ("Link_id") REFERENCES public.database_books("ISBN") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_issues database_issues_Link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_issues
    ADD CONSTRAINT "database_issues_Link_id_fkey" FOREIGN KEY ("Link_id") REFERENCES public.database_books("ISBN") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_late_dues database_late_dues_Link_id_dca0363b_fk_database_; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.database_late_dues
    ADD CONSTRAINT "database_late_dues_Link_id_dca0363b_fk_database_" FOREIGN KEY ("Link_id") REFERENCES public.database_issues("Ind_Book_ID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advaith
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

