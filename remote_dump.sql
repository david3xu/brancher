--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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

--
-- Name: _analytics; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _analytics;


ALTER SCHEMA _analytics OWNER TO postgres;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO postgres;

--
-- Name: _supavisor; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _supavisor;


ALTER SCHEMA _supavisor OWNER TO postgres;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: hybrid_search(text, public.vector, integer, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hybrid_search(in_query text, in_embedding public.vector, in_match_count integer DEFAULT 3, full_text_weight double precision DEFAULT 1.0, semantic_weight double precision DEFAULT 1.0, rrf_k integer DEFAULT 50) RETURNS TABLE(id text, source text, source_id text, document_id text, url text, created_at timestamp with time zone, author text, content text, embedding public.vector, rank double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    WITH full_text_search AS (
        SELECT
            documents.id,
            ROW_NUMBER() OVER (ORDER BY ts_rank(to_tsvector('english', documents.content), plainto_tsquery(in_query)) DESC) AS rank
        FROM documents
        WHERE to_tsvector('english', documents.content) @@ plainto_tsquery(in_query)
        ORDER BY rank
        LIMIT rrf_k
    ),
    semantic_search AS (
        SELECT
            documents.id,
            ROW_NUMBER() OVER (ORDER BY (documents.embedding <#> in_embedding) DESC) AS rank
        FROM documents
        WHERE (documents.embedding <#> in_embedding) > 0.5
        ORDER BY rank
        LIMIT rrf_k
    )
    SELECT
        d.id,
        d.source,
        d.source_id,
        d.document_id,
        d.url,
        d.created_at,
        d.author,
        d.content,
        d.embedding,
        (COALESCE(fts.rank, 0) * full_text_weight + COALESCE(ss.rank, 0) * semantic_weight) AS rank
    FROM documents d
    LEFT JOIN full_text_search fts ON d.id = fts.id
    LEFT JOIN semantic_search ss ON d.id = ss.id
    WHERE fts.id IS NOT NULL OR ss.id IS NOT NULL
    ORDER BY rank DESC
    LIMIT in_match_count;
END;
$$;


ALTER FUNCTION public.hybrid_search(in_query text, in_embedding public.vector, in_match_count integer, full_text_weight double precision, semantic_weight double precision, rrf_k integer) OWNER TO postgres;

--
-- Name: match_page_sections(public.vector, integer, text, text, text, text, timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match_page_sections(in_embedding public.vector, in_match_count integer DEFAULT 3, in_document_id text DEFAULT '%%'::text, in_source_id text DEFAULT '%%'::text, in_source text DEFAULT '%%'::text, in_author text DEFAULT '%%'::text, in_start_date timestamp with time zone DEFAULT '-infinity'::timestamp with time zone, in_end_date timestamp with time zone DEFAULT 'infinity'::timestamp with time zone) RETURNS TABLE(id text, source text, source_id text, document_id text, url text, created_at timestamp with time zone, author text, content text, embedding public.vector, similarity double precision)
    LANGUAGE plpgsql
    AS $$
#variable_conflict use_variable
begin
return query
select
    documents.id,
    documents.source,
    documents.source_id,
    documents.document_id,
    documents.url,
    documents.created_at,
    documents.author,
    documents.content,
    documents.embedding,
    (documents.embedding <#> in_embedding) * -1 as similarity
from documents

where in_start_date <= documents.created_at and 
    documents.created_at <= in_end_date and
    (documents.source_id like in_source_id or documents.source_id is null) and
    (documents.source like in_source or documents.source is null) and
    (documents.author like in_author or documents.author is null) and
    (documents.document_id like in_document_id or documents.document_id is null)

order by documents.embedding <#> in_embedding

limit in_match_count;
end;
$$;


ALTER FUNCTION public.match_page_sections(in_embedding public.vector, in_match_count integer, in_document_id text, in_source_id text, in_source text, in_author text, in_start_date timestamp with time zone, in_end_date timestamp with time zone) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or action = 'DELETE'
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
  DECLARE
    request_id bigint;
    payload jsonb;
    url text := TG_ARGV[0]::text;
    method text := TG_ARGV[1]::text;
    headers jsonb DEFAULT '{}'::jsonb;
    params jsonb DEFAULT '{}'::jsonb;
    timeout_ms integer DEFAULT 1000;
  BEGIN
    IF url IS NULL OR url = 'null' THEN
      RAISE EXCEPTION 'url argument is missing';
    END IF;

    IF method IS NULL OR method = 'null' THEN
      RAISE EXCEPTION 'method argument is missing';
    END IF;

    IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
      headers = '{"Content-Type": "application/json"}'::jsonb;
    ELSE
      headers = TG_ARGV[2]::jsonb;
    END IF;

    IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
      params = '{}'::jsonb;
    ELSE
      params = TG_ARGV[3]::jsonb;
    END IF;

    IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
      timeout_ms = 1000;
    ELSE
      timeout_ms = TG_ARGV[4]::integer;
    END IF;

    CASE
      WHEN method = 'GET' THEN
        SELECT http_get INTO request_id FROM net.http_get(
          url,
          params,
          headers,
          timeout_ms
        );
      WHEN method = 'POST' THEN
        payload = jsonb_build_object(
          'old_record', OLD,
          'record', NEW,
          'type', TG_OP,
          'table', TG_TABLE_NAME,
          'schema', TG_TABLE_SCHEMA
        );

        SELECT http_post INTO request_id FROM net.http_post(
          url,
          payload,
          params,
          headers,
          timeout_ms
        );
      ELSE
        RAISE EXCEPTION 'method argument % is invalid', method;
    END CASE;

    INSERT INTO supabase_functions.hooks
      (hook_table_id, hook_name, request_id)
    VALUES
      (TG_RELID, TG_NAME, request_id);

    RETURN NEW;
  END
$$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: billing_accounts; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.billing_accounts (
    id bigint NOT NULL,
    latest_successful_stripe_session jsonb,
    stripe_customer character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    stripe_subscriptions jsonb,
    stripe_invoices jsonb,
    "lifetime_plan?" boolean DEFAULT false,
    lifetime_plan_invoice character varying(255),
    default_payment_method character varying(255),
    custom_invoice_fields jsonb[] DEFAULT ARRAY[]::jsonb[],
    lifetime_plan boolean DEFAULT false NOT NULL
);


ALTER TABLE _analytics.billing_accounts OWNER TO supabase_admin;

--
-- Name: billing_accounts_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.billing_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.billing_accounts_id_seq OWNER TO supabase_admin;

--
-- Name: billing_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.billing_accounts_id_seq OWNED BY _analytics.billing_accounts.id;


--
-- Name: billing_counts; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.billing_counts (
    id bigint NOT NULL,
    node character varying(255),
    count integer,
    user_id bigint,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.billing_counts OWNER TO supabase_admin;

--
-- Name: billing_counts_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.billing_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.billing_counts_id_seq OWNER TO supabase_admin;

--
-- Name: billing_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.billing_counts_id_seq OWNED BY _analytics.billing_counts.id;


--
-- Name: endpoint_queries; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.endpoint_queries (
    id bigint NOT NULL,
    name character varying(255),
    token uuid,
    query text,
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    source_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    sandboxable boolean DEFAULT false,
    cache_duration_seconds integer DEFAULT 3600,
    proactive_requerying_seconds integer DEFAULT 1800,
    max_limit integer DEFAULT 1000,
    enable_auth boolean DEFAULT false,
    sandbox_query_id bigint,
    language character varying(255) NOT NULL
);


ALTER TABLE _analytics.endpoint_queries OWNER TO supabase_admin;

--
-- Name: endpoint_queries_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.endpoint_queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.endpoint_queries_id_seq OWNER TO supabase_admin;

--
-- Name: endpoint_queries_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.endpoint_queries_id_seq OWNED BY _analytics.endpoint_queries.id;


--
-- Name: log_events_09ef132f_2484_45d7_944c_a4cebd801402; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_09ef132f_2484_45d7_944c_a4cebd801402 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_09ef132f_2484_45d7_944c_a4cebd801402 OWNER TO postgres;

--
-- Name: log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a OWNER TO postgres;

--
-- Name: log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5 OWNER TO postgres;

--
-- Name: log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4 OWNER TO postgres;

--
-- Name: log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4 OWNER TO postgres;

--
-- Name: log_events_9cae37bf_dd53_416a_834c_802c1ca62646; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_9cae37bf_dd53_416a_834c_802c1ca62646 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_9cae37bf_dd53_416a_834c_802c1ca62646 OWNER TO postgres;

--
-- Name: log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0 OWNER TO postgres;

--
-- Name: log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da OWNER TO postgres;

--
-- Name: log_events_d87540bb_882e_4304_9bec_7172047840e5; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.log_events_d87540bb_882e_4304_9bec_7172047840e5 (
    id character varying(255) NOT NULL,
    body jsonb,
    event_message text,
    "timestamp" timestamp without time zone
);


ALTER TABLE _analytics.log_events_d87540bb_882e_4304_9bec_7172047840e5 OWNER TO postgres;

--
-- Name: oauth_access_grants; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id bigint,
    token character varying(255) NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    revoked_at timestamp(0) without time zone,
    scopes character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.oauth_access_grants OWNER TO supabase_admin;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.oauth_access_grants_id_seq OWNER TO supabase_admin;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.oauth_access_grants_id_seq OWNED BY _analytics.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.oauth_access_tokens (
    id bigint NOT NULL,
    application_id bigint,
    resource_owner_id integer,
    token character varying(255) NOT NULL,
    refresh_token character varying(255),
    expires_in integer,
    revoked_at timestamp(0) without time zone,
    scopes character varying(255),
    previous_refresh_token character varying(255) DEFAULT ''::character varying NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    description text
);


ALTER TABLE _analytics.oauth_access_tokens OWNER TO supabase_admin;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.oauth_access_tokens_id_seq OWNER TO supabase_admin;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.oauth_access_tokens_id_seq OWNED BY _analytics.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.oauth_applications (
    id bigint NOT NULL,
    owner_id integer NOT NULL,
    name character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    secret character varying(255) DEFAULT ''::character varying NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scopes character varying(255) DEFAULT ''::character varying NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.oauth_applications OWNER TO supabase_admin;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.oauth_applications_id_seq OWNER TO supabase_admin;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.oauth_applications_id_seq OWNED BY _analytics.oauth_applications.id;


--
-- Name: partner_users; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.partner_users (
    id bigint NOT NULL,
    partner_id bigint,
    user_id bigint
);


ALTER TABLE _analytics.partner_users OWNER TO supabase_admin;

--
-- Name: partner_users_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.partner_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.partner_users_id_seq OWNER TO supabase_admin;

--
-- Name: partner_users_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.partner_users_id_seq OWNED BY _analytics.partner_users.id;


--
-- Name: partners; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.partners (
    id bigint NOT NULL,
    name bytea,
    token bytea
);


ALTER TABLE _analytics.partners OWNER TO supabase_admin;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.partners_id_seq OWNER TO supabase_admin;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.partners_id_seq OWNED BY _analytics.partners.id;


--
-- Name: payment_methods; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.payment_methods (
    id bigint NOT NULL,
    stripe_id character varying(255),
    price_id character varying(255),
    last_four character varying(255),
    brand character varying(255),
    exp_year integer,
    exp_month integer,
    customer_id character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.payment_methods OWNER TO supabase_admin;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.payment_methods_id_seq OWNER TO supabase_admin;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.payment_methods_id_seq OWNED BY _analytics.payment_methods.id;


--
-- Name: plans; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.plans (
    id bigint NOT NULL,
    name character varying(255),
    stripe_id character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    period character varying(255),
    price integer,
    limit_sources integer,
    limit_rate_limit integer,
    limit_alert_freq integer,
    limit_source_rate_limit integer,
    limit_saved_search_limit integer,
    limit_team_users_limit integer,
    limit_source_fields_limit integer,
    limit_source_ttl bigint DEFAULT 259200000,
    type character varying(255) DEFAULT 'standard'::character varying
);


ALTER TABLE _analytics.plans OWNER TO supabase_admin;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.plans_id_seq OWNER TO supabase_admin;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.plans_id_seq OWNED BY _analytics.plans.id;


--
-- Name: rules; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.rules (
    id bigint NOT NULL,
    regex character varying(255),
    sink uuid NOT NULL,
    source_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    regex_struct bytea,
    lql_string text DEFAULT ''::text NOT NULL,
    lql_filters bytea DEFAULT '\x836a'::bytea NOT NULL
);

ALTER TABLE ONLY _analytics.rules REPLICA IDENTITY FULL;


ALTER TABLE _analytics.rules OWNER TO supabase_admin;

--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.rules_id_seq OWNER TO supabase_admin;

--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.rules_id_seq OWNED BY _analytics.rules.id;


--
-- Name: saved_search_counters; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.saved_search_counters (
    id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    saved_search_id bigint NOT NULL,
    granularity text DEFAULT 'day'::text NOT NULL,
    non_tailing_count integer,
    tailing_count integer
);


ALTER TABLE _analytics.saved_search_counters OWNER TO supabase_admin;

--
-- Name: saved_search_counters_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.saved_search_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.saved_search_counters_id_seq OWNER TO supabase_admin;

--
-- Name: saved_search_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.saved_search_counters_id_seq OWNED BY _analytics.saved_search_counters.id;


--
-- Name: saved_searches; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.saved_searches (
    id bigint NOT NULL,
    querystring text,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    saved_by_user boolean,
    lql_filters jsonb,
    lql_charts jsonb,
    "tailing?" boolean DEFAULT true NOT NULL,
    tailing boolean DEFAULT true NOT NULL
);


ALTER TABLE _analytics.saved_searches OWNER TO supabase_admin;

--
-- Name: saved_searches_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.saved_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.saved_searches_id_seq OWNER TO supabase_admin;

--
-- Name: saved_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.saved_searches_id_seq OWNED BY _analytics.saved_searches.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations OWNER TO supabase_admin;

--
-- Name: schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402 OWNER TO postgres;

--
-- Name: schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a OWNER TO postgres;

--
-- Name: schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5 OWNER TO postgres;

--
-- Name: schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4 OWNER TO postgres;

--
-- Name: schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4 OWNER TO postgres;

--
-- Name: schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646 OWNER TO postgres;

--
-- Name: schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0 OWNER TO postgres;

--
-- Name: schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da OWNER TO postgres;

--
-- Name: schema_migrations_d87540bb_882e_4304_9bec_7172047840e5; Type: TABLE; Schema: _analytics; Owner: postgres
--

CREATE TABLE _analytics.schema_migrations_d87540bb_882e_4304_9bec_7172047840e5 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _analytics.schema_migrations_d87540bb_882e_4304_9bec_7172047840e5 OWNER TO postgres;

--
-- Name: source_backends; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.source_backends (
    id bigint NOT NULL,
    source_id bigint,
    type character varying(255),
    config jsonb,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.source_backends OWNER TO supabase_admin;

--
-- Name: source_backends_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.source_backends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.source_backends_id_seq OWNER TO supabase_admin;

--
-- Name: source_backends_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.source_backends_id_seq OWNED BY _analytics.source_backends.id;


--
-- Name: source_schemas; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.source_schemas (
    id bigint NOT NULL,
    bigquery_schema bytea,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    schema_flat_map bytea
);


ALTER TABLE _analytics.source_schemas OWNER TO supabase_admin;

--
-- Name: source_schemas_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.source_schemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.source_schemas_id_seq OWNER TO supabase_admin;

--
-- Name: source_schemas_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.source_schemas_id_seq OWNED BY _analytics.source_schemas.id;


--
-- Name: sources; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.sources (
    id bigint NOT NULL,
    name character varying(255),
    token uuid NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    user_id integer NOT NULL,
    public_token character varying(255),
    favorite boolean DEFAULT false NOT NULL,
    bigquery_table_ttl integer,
    api_quota integer DEFAULT 5 NOT NULL,
    webhook_notification_url character varying(255),
    slack_hook_url character varying(255),
    notifications jsonb DEFAULT '{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}'::jsonb NOT NULL,
    custom_event_message_keys character varying(255),
    log_events_updated_at timestamp(0) without time zone,
    bigquery_schema bytea,
    notifications_every integer DEFAULT 14400000,
    bq_table_partition_type text,
    lock_schema boolean DEFAULT false,
    validate_schema boolean DEFAULT true,
    drop_lql_filters bytea DEFAULT '\x836a'::bytea NOT NULL,
    drop_lql_string character varying(255),
    v2_pipeline boolean DEFAULT false,
    suggested_keys character varying(255) DEFAULT ''::character varying
);

ALTER TABLE ONLY _analytics.sources REPLICA IDENTITY FULL;


ALTER TABLE _analytics.sources OWNER TO supabase_admin;

--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.sources_id_seq OWNER TO supabase_admin;

--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.sources_id_seq OWNED BY _analytics.sources.id;


--
-- Name: system_metrics; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.system_metrics (
    id bigint NOT NULL,
    all_logs_logged bigint,
    node character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.system_metrics OWNER TO supabase_admin;

--
-- Name: system_metrics_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.system_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.system_metrics_id_seq OWNER TO supabase_admin;

--
-- Name: system_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.system_metrics_id_seq OWNED BY _analytics.system_metrics.id;


--
-- Name: team_users; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.team_users (
    id bigint NOT NULL,
    email character varying(255),
    token character varying(255),
    provider character varying(255),
    email_preferred character varying(255),
    name character varying(255),
    image character varying(255),
    email_me_product boolean DEFAULT false NOT NULL,
    phone character varying(255),
    valid_google_account boolean DEFAULT false NOT NULL,
    provider_uid character varying(255),
    team_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    preferences jsonb
);


ALTER TABLE _analytics.team_users OWNER TO supabase_admin;

--
-- Name: team_users_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.team_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.team_users_id_seq OWNER TO supabase_admin;

--
-- Name: team_users_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.team_users_id_seq OWNED BY _analytics.team_users.id;


--
-- Name: teams; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.teams (
    id bigint NOT NULL,
    name character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    token character varying(255) DEFAULT gen_random_uuid()
);


ALTER TABLE _analytics.teams OWNER TO supabase_admin;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.teams_id_seq OWNER TO supabase_admin;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.teams_id_seq OWNED BY _analytics.teams.id;


--
-- Name: users; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    api_key character varying(255) NOT NULL,
    old_api_key character varying(255),
    email_preferred character varying(255),
    name character varying(255),
    image character varying(255),
    email_me_product boolean DEFAULT true NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    phone character varying(255),
    bigquery_project_id character varying(255),
    api_quota integer DEFAULT 125 NOT NULL,
    bigquery_dataset_location character varying(255),
    bigquery_dataset_id character varying(255),
    valid_google_account boolean,
    provider_uid character varying(255),
    company character varying(255),
    bigquery_udfs_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    bigquery_processed_bytes_limit bigint DEFAULT '10000000000'::bigint NOT NULL,
    "billing_enabled?" boolean DEFAULT false NOT NULL,
    preferences jsonb,
    billing_enabled boolean DEFAULT false NOT NULL,
    endpoints_beta boolean DEFAULT false
);


ALTER TABLE _analytics.users OWNER TO supabase_admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.users_id_seq OWNER TO supabase_admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.users_id_seq OWNED BY _analytics.users.id;


--
-- Name: vercel_auths; Type: TABLE; Schema: _analytics; Owner: supabase_admin
--

CREATE TABLE _analytics.vercel_auths (
    id bigint NOT NULL,
    access_token character varying(255),
    installation_id character varying(255),
    team_id character varying(255),
    token_type character varying(255),
    vercel_user_id character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _analytics.vercel_auths OWNER TO supabase_admin;

--
-- Name: vercel_auths_id_seq; Type: SEQUENCE; Schema: _analytics; Owner: supabase_admin
--

CREATE SEQUENCE _analytics.vercel_auths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _analytics.vercel_auths_id_seq OWNER TO supabase_admin;

--
-- Name: vercel_auths_id_seq; Type: SEQUENCE OWNED BY; Schema: _analytics; Owner: supabase_admin
--

ALTER SEQUENCE _analytics.vercel_auths_id_seq OWNED BY _analytics.vercel_auths.id;


--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id text DEFAULT (gen_random_uuid())::text NOT NULL,
    source text,
    source_id text,
    content text,
    document_id text,
    author text,
    url text,
    created_at timestamp with time zone DEFAULT now(),
    embedding public.vector(1024)
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: billing_accounts id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_accounts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_accounts_id_seq'::regclass);


--
-- Name: billing_counts id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_counts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_counts_id_seq'::regclass);


--
-- Name: endpoint_queries id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.endpoint_queries ALTER COLUMN id SET DEFAULT nextval('_analytics.endpoint_queries_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_applications ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_applications_id_seq'::regclass);


--
-- Name: partner_users id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partner_users ALTER COLUMN id SET DEFAULT nextval('_analytics.partner_users_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partners ALTER COLUMN id SET DEFAULT nextval('_analytics.partners_id_seq'::regclass);


--
-- Name: payment_methods id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.payment_methods ALTER COLUMN id SET DEFAULT nextval('_analytics.payment_methods_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.plans ALTER COLUMN id SET DEFAULT nextval('_analytics.plans_id_seq'::regclass);


--
-- Name: rules id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.rules ALTER COLUMN id SET DEFAULT nextval('_analytics.rules_id_seq'::regclass);


--
-- Name: saved_search_counters id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_search_counters ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_search_counters_id_seq'::regclass);


--
-- Name: saved_searches id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_searches ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_searches_id_seq'::regclass);


--
-- Name: source_backends id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_backends ALTER COLUMN id SET DEFAULT nextval('_analytics.source_backends_id_seq'::regclass);


--
-- Name: source_schemas id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_schemas ALTER COLUMN id SET DEFAULT nextval('_analytics.source_schemas_id_seq'::regclass);


--
-- Name: sources id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.sources ALTER COLUMN id SET DEFAULT nextval('_analytics.sources_id_seq'::regclass);


--
-- Name: system_metrics id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.system_metrics ALTER COLUMN id SET DEFAULT nextval('_analytics.system_metrics_id_seq'::regclass);


--
-- Name: team_users id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.team_users ALTER COLUMN id SET DEFAULT nextval('_analytics.team_users_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.teams ALTER COLUMN id SET DEFAULT nextval('_analytics.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.users ALTER COLUMN id SET DEFAULT nextval('_analytics.users_id_seq'::regclass);


--
-- Name: vercel_auths id; Type: DEFAULT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.vercel_auths ALTER COLUMN id SET DEFAULT nextval('_analytics.vercel_auths_id_seq'::regclass);


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: billing_accounts; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.billing_accounts (id, latest_successful_stripe_session, stripe_customer, user_id, inserted_at, updated_at, stripe_subscriptions, stripe_invoices, "lifetime_plan?", lifetime_plan_invoice, default_payment_method, custom_invoice_fields, lifetime_plan) FROM stdin;
\.


--
-- Data for Name: billing_counts; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.billing_counts (id, node, count, user_id, source_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: endpoint_queries; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.endpoint_queries (id, name, token, query, user_id, inserted_at, updated_at, source_mapping, sandboxable, cache_duration_seconds, proactive_requerying_seconds, max_limit, enable_auth, sandbox_query_id, language) FROM stdin;
1	logs.all	135dd3b9-d96b-46a3-8050-9980e8fdb58d	with retention as (\n  select (\n    CASE\n      WHEN @project_tier = 'FREE' THEN TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 day)\n      WHEN @project_tier = 'PRO' THEN TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 day)\n      WHEN (@project_tier = 'PAYG' OR @project_tier = 'ENTERPRISE') THEN TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 day) \n      ELSE  TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 day) \n    END\n  ) as date\n),\n\nedge_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `cloudflare.logs.prod` as t\n  cross join unnest(metadata) as m\nwhere\n  -- order of the where clauses matters\n  -- project then timestamp then everything else\n  t.project = @project\n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\norder by\n  cast(t.timestamp as timestamp) desc\n),\n\npostgres_logs as (\n  select \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata\nfrom retention, `postgres.logs` as t\nwhere\n  -- order of the where clauses matters\n  -- project then timestamp then everything else\n  t.project = @project\n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\n  order by cast(t.timestamp as timestamp) desc\n),\n\nfunction_edge_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `deno-relay-logs` as t\n  cross join unnest(t.metadata) as m\nwhere\n  CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  and m.project_ref = @project\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\nfunction_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `deno-subhosting-events` as t\n  cross join unnest(t.metadata) as m\nwhere\n  -- order of the where clauses matters\n  -- project then timestamp then everything else\n  m.project_ref = @project\n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\nauth_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `gotrue.logs.prod` as t\n  cross join unnest(t.metadata) as m\nwhere\n  -- order of the where clauses matters\n  -- project then timestamp then everything else\n  -- m.project = @project\n  t.project = @project\n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\nrealtime_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `realtime.logs.prod` as t\n  cross join unnest(t.metadata) as m\nwhere\n  m.project = @project \n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\nstorage_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `storage.logs.prod.2` as t\n  cross join unnest(t.metadata) as m\nwhere\n  m.project = @project\n  AND CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\npostgrest_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `postgREST.logs.prod` as t\n  cross join unnest(t.metadata) as m\nwhere\n  CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND t.project = @project\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n),\n\npgbouncer_logs as (\nselect \n  t.timestamp,\n  t.id, \n  t.event_message, \n  t.metadata \nfrom retention, `pgbouncer.logs.prod` as t\n  cross join unnest(t.metadata) as m\nwhere\n  CASE WHEN COALESCE(@iso_timestamp_start, '') = '' THEN  TRUE ELSE  cast(t.timestamp as timestamp) > cast(@iso_timestamp_start as timestamp) END\n  AND CASE WHEN COALESCE(@iso_timestamp_end, '') = '' THEN TRUE ELSE cast(t.timestamp as timestamp) <= cast(@iso_timestamp_end as timestamp) END\n  AND t.project = @project\n  AND cast(t.timestamp as timestamp) > retention.date\norder by cast(t.timestamp as timestamp) desc\n)\n\nSELECT id, timestamp, event_message, metadata\nFROM edge_logs\nLIMIT 100	1	2024-09-03 07:40:40	2024-09-03 07:40:40	{"postgres.logs": "39cbcdc3-6963-4888-9bfb-6e686d1518c5", "deno-relay-logs": "551b8385-bfbb-4e5b-a653-2f9476d08ba4", "gotrue.logs.prod": "adbe9f86-4491-4434-ae30-4698ae99e1b0", "realtime.logs.prod": "4d039a66-f2f6-4333-84e2-6ed2164631b4", "pgbouncer.logs.prod": "bfc97cf7-7b43-4ffe-87bd-25c6789de6da", "postgREST.logs.prod": "d87540bb-882e-4304-9bec-7172047840e5", "storage.logs.prod.2": "09ef132f-2484-45d7-944c-a4cebd801402", "cloudflare.logs.prod": "9cae37bf-dd53-416a-834c-802c1ca62646", "deno-subhosting-events": "1f4e2106-b3b4-4d67-b39e-b36f95a74a2a"}	t	0	1800	1000	t	\N	bq_sql
2	usage.api-counts	f3ee439b-a609-45d5-8bea-ce3952d9a325	with \ndates as (\n  select (case\n    when @interval = 'hourly' then timestamp_sub(current_timestamp(), interval 1 hour)\n    when @interval = 'daily' then timestamp_sub(current_timestamp(), interval 7 day)\n    when @interval = 'minutely' then timestamp_sub(current_timestamp(), interval 60 minute)\n  end) as start\n),\nchart_counts as (\nselect\n  (case\n    when @interval = 'hourly' then timestamp_trunc(f0.timestamp,  hour)\n    when @interval = 'daily' then timestamp_trunc(f0.timestamp,  day)\n    when @interval = 'minutely' then timestamp_trunc(f0.timestamp,  minute)\n  end\n  ) as timestamp,\n  COUNTIF(REGEXP_CONTAINS(f2.path, '/rest')) as total_rest_requests,\n  COUNTIF(REGEXP_CONTAINS(f2.path, '/storage')) as total_storage_requests,\n  COUNTIF(REGEXP_CONTAINS(f2.path, '/auth')) as total_auth_requests,\n  COUNTIF(REGEXP_CONTAINS(f2.path, '/realtime')) as total_realtime_requests,\nFROM\n  dates, \n  `cloudflare.logs.prod` as f0\n  LEFT JOIN UNNEST(metadata) AS f1 ON TRUE\n  LEFT JOIN UNNEST(f1.request) AS f2 ON TRUE\nwhere\n  REGEXP_CONTAINS(f2.url, @project) AND f0.timestamp >= dates[0]\n  -- project = @project\nGROUP BY\n    timestamp\n)\nSELECT\n    datetime(chart_counts.timestamp, 'UTC') as timestamp,\n    COALESCE(SUM(chart_counts.total_rest_requests), 0) as total_rest_requests,\n    COALESCE(SUM(chart_counts.total_storage_requests), 0) as total_storage_requests,\n    COALESCE(SUM(chart_counts.total_auth_requests), 0) as total_auth_requests,\n    COALESCE(SUM(chart_counts.total_realtime_requests), 0) as total_realtime_requests,\nFROM  \n  chart_counts\nGROUP BY\n    timestamp\nORDER BY\n    timestamp asc;	1	2024-09-03 07:40:40	2024-09-03 07:40:40	{"cloudflare.logs.prod": "9cae37bf-dd53-416a-834c-802c1ca62646"}	t	900	300	1000	t	\N	bq_sql
3	functions.invocation-stats	652e0806-4ef5-4f3d-85c8-0946c9eaece2	with arr as (\n  SELECT  (\n      CASE\n        WHEN @interval = '5min' THEN  `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(5, "minute_second")\n        WHEN @interval = '15min' THEN  `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(15, "minute_minute")\n        WHEN @interval = '1hr' THEN `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(1, "hour_minute")\n        WHEN @interval = '1day' THEN `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(1, "day_hour")\n        WHEN @interval = '7day' THEN `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(7, "day_day")\n        ELSE `supabase-analytics-eu.logflare.generate_timestamp_trunc_array`(1, "day_hour")\n      END\n  ) as d\n),\ndates as (\n  select d from arr, unnest(`arr`.d) as d\n),\nagg as (\nSELECT \n  dates.d as timestamp,\n  count(id) as count,\n  avg(m.execution_time_ms) as avg_execution_time,\n  max(m.execution_time_ms) as max_execution_time,\n  min(m.execution_time_ms) as min_execution_time,\n  COUNTIF(r.status_code >= 400) as error_count,\n  COUNTIF(r.status_code >= 100 AND r.status_code < 200 ) as one_xx_status_code_count,\n  COUNTIF(r.status_code >= 200 AND r.status_code < 300 ) as two_xx_status_code_count,\n  COUNTIF(r.status_code >= 300 AND r.status_code < 400 ) as three_xx_status_code_count,\n  COUNTIF(r.status_code >= 400 AND r.status_code < 500 ) as four_xx_status_code_count,\n  COUNTIF(r.status_code >= 500 AND r.status_code < 600 ) as five_xx_status_code_count,\n  APPROX_QUANTILES(m.execution_time_ms, 100) as p95_array,\n  APPROX_QUANTILES(m.execution_time_ms, 100) as p99_array,\nFROM\n  arr, dates left join `deno-relay-logs` on dates.d = (\n        CASE\n            WHEN @interval = '5min' THEN timestamp_trunc(timestamp, second)\n            WHEN @interval = '15min' THEN timestamp_trunc(timestamp, minute)\n            WHEN @interval = '1hr' THEN timestamp_trunc(timestamp, minute)\n            WHEN @interval = '1day' THEN timestamp_trunc(timestamp, hour)\n            WHEN @interval = '7day' THEN timestamp_trunc(timestamp, day)\n        ELSE timestamp_trunc(timestamp, hour)\n      END)\nCROSS JOIN UNNEST(metadata) as m\nCROSS JOIN UNNEST(m.response) as r\nWHERE\n  m.project_ref = @project \n  AND CASE WHEN COALESCE(@function_id, '') = '' THEN  TRUE ELSE  m.function_id = @function_id END\n  and timestamp >= arr.d[offset(0)]\nGROUP BY\n  timestamp\nORDER BY\n  timestamp ASC\n)\n\nselect\n  timestamp,\n  min_execution_time,\n  max_execution_time,\n  avg_execution_time,\n  p95_array[offset(95)] as p95_execution_time,\n  p99_array[offset(99)] as p99_execution_time,\n  count,\n  error_count\nfrom\n  agg	1	2024-09-03 07:40:40	2024-09-03 07:40:40	{"deno-relay-logs": "551b8385-bfbb-4e5b-a653-2f9476d08ba4"}	t	900	300	1000	t	\N	bq_sql
\.


--
-- Data for Name: log_events_09ef132f_2484_45d7_944c_a4cebd801402; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_09ef132f_2484_45d7_944c_a4cebd801402 (id, body, event_message, "timestamp") FROM stdin;
9d3a8d44-25b2-40a0-a634-d21333c7f164	{"id": "9d3a8d44-25b2-40a0-a634-d21333c7f164", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.039Z"}, "timestamp": 1725349243040147, "event_message": "[Server] Received SIGTERM, shutting down"}	[Server] Received SIGTERM, shutting down	2024-09-03 07:40:43.040147
73c25f15-0a68-456d-832e-d950f5a97b67	{"id": "73c25f15-0a68-456d-832e-d950f5a97b67", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.041Z"}, "timestamp": 1725349243043374, "event_message": "[Server] Stopping"}	[Server] Stopping	2024-09-03 07:40:43.043374
dad7162e-f93f-43bc-991b-4b1470c8c9fc	{"id": "dad7162e-f93f-43bc-991b-4b1470c8c9fc", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.042Z"}, "timestamp": 1725349243043406, "event_message": "[Server] Exited"}	[Server] Exited	2024-09-03 07:40:43.043406
45797701-f775-4057-91e0-9fe5abfc96a8	{"id": "45797701-f775-4057-91e0-9fe5abfc96a8", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.042Z"}, "timestamp": 1725349243043412, "event_message": "[PubSub] Stopping"}	[PubSub] Stopping	2024-09-03 07:40:43.043412
6b5d87bc-ea87-4a45-bfb1-b4507e42e277	{"id": "6b5d87bc-ea87-4a45-bfb1-b4507e42e277", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.046Z"}, "timestamp": 1725349243047266, "event_message": "[PubSub] Exited"}	[PubSub] Exited	2024-09-03 07:40:43.047266
b8b819fb-70bb-4c24-a783-7bae9aa0939d	{"id": "b8b819fb-70bb-4c24-a783-7bae9aa0939d", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.048Z"}, "timestamp": 1725349243048737, "event_message": "[Server] SIGTERM Shutdown successfully"}	[Server] SIGTERM Shutdown successfully	2024-09-03 07:40:43.048737
8e35b2a9-1528-42f8-b51e-df719015e454	{"id": "8e35b2a9-1528-42f8-b51e-df719015e454", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:43.048Z"}, "timestamp": 1725349243048737, "event_message": "[Server] SIGTERM Shutdown successfully"}	[Server] SIGTERM Shutdown successfully	2024-09-03 07:40:43.048737
fd02f259-6e18-4b56-880e-b724a09699d1	{"id": "fd02f259-6e18-4b56-880e-b724a09699d1", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:45.786Z"}, "timestamp": 1725349245787673, "event_message": "Server listening at http://0.0.0.0:5000"}	Server listening at http://0.0.0.0:5000	2024-09-03 07:40:45.787673
a09dd663-6864-4df3-bef5-05bd6daebf40	{"id": "a09dd663-6864-4df3-bef5-05bd6daebf40", "appname": "supabase_storage_brancher", "metadata": {"level": 30, "context": [{"pid": 1, "host": "ca2c9714e909"}], "project": "default", "tenantId": "default", "timestamp": "2024-09-03T07:40:45.787Z"}, "timestamp": 1725349245790900, "event_message": "[Server] Started Successfully"}	[Server] Started Successfully	2024-09-03 07:40:45.7909
d67c72ad-df31-42c0-b722-d7efde51f446	{"id": "d67c72ad-df31-42c0-b722-d7efde51f446", "appname": "supabase_storage_brancher", "metadata": {"project": "default", "tenantId": "default"}, "timestamp": 1725349253630977, "event_message": "(node:1) [FSTDEP012] FastifyDeprecation: Request#context property access is deprecated. Please use \\"Request#routeConfig\\" or \\"Request#routeSchema\\" instead for accessing Route settings. The \\"Request#context\\" will be removed in `fastify@5`."}	(node:1) [FSTDEP012] FastifyDeprecation: Request#context property access is deprecated. Please use "Request#routeConfig" or "Request#routeSchema" instead for accessing Route settings. The "Request#context" will be removed in `fastify@5`.	2024-09-03 07:40:53.630977
5b42e308-1306-4b8e-9d6c-5d1537e8282a	{"id": "5b42e308-1306-4b8e-9d6c-5d1537e8282a", "appname": "supabase_storage_brancher", "metadata": {"project": "default", "tenantId": "default"}, "timestamp": 1725349253631028, "event_message": "(Use `node --trace-warnings ...` to show where the warning was created)"}	(Use `node --trace-warnings ...` to show where the warning was created)	2024-09-03 07:40:53.631028
\.


--
-- Data for Name: log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a (id, body, event_message, "timestamp") FROM stdin;
\.


--
-- Data for Name: log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5 (id, body, event_message, "timestamp") FROM stdin;
7fca4d53-1071-446f-a145-c0bf00dae71e	{"id": "7fca4d53-1071-446f-a145-c0bf00dae71e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225838993, "event_message": "selecting default shared_buffers ... 128MB"}	selecting default shared_buffers ... 128MB	2024-09-03 07:40:25.838993
33c5f707-dbfd-4b76-914b-d352f166fc19	{"id": "33c5f707-dbfd-4b76-914b-d352f166fc19", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225883701, "event_message": "selecting default time zone ... Etc/UTC"}	selecting default time zone ... Etc/UTC	2024-09-03 07:40:25.883701
75d8fdf9-be36-442a-b79d-45a36f5d739b	{"id": "75d8fdf9-be36-442a-b79d-45a36f5d739b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225884805, "event_message": "creating configuration files ... ok"}	creating configuration files ... ok	2024-09-03 07:40:25.884805
d778a6a8-2c47-4cd0-b84a-1404760ecdf3	{"id": "d778a6a8-2c47-4cd0-b84a-1404760ecdf3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226062621, "event_message": "running bootstrap script ... ok"}	running bootstrap script ... ok	2024-09-03 07:40:26.062621
eb9f6f2d-2139-4d42-bf4c-05d66cbab6a3	{"id": "eb9f6f2d-2139-4d42-bf4c-05d66cbab6a3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226443133, "event_message": "performing post-bootstrap initialization ... ok"}	performing post-bootstrap initialization ... ok	2024-09-03 07:40:26.443133
8b2ce05b-be48-4bdc-91aa-091cb2f64dc1	{"id": "8b2ce05b-be48-4bdc-91aa-091cb2f64dc1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226680936, "event_message": "syncing data to disk ... ok"}	syncing data to disk ... ok	2024-09-03 07:40:26.680936
0ddaced3-9a0d-4f0f-a07e-76e3b26315d9	{"id": "0ddaced3-9a0d-4f0f-a07e-76e3b26315d9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226680978, "event_message": "Success. You can now start the database server using:"}	Success. You can now start the database server using:	2024-09-03 07:40:26.680978
fd153940-108f-4f40-a1be-34d18a26cc23	{"id": "fd153940-108f-4f40-a1be-34d18a26cc23", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226680985, "event_message": "    /usr/bin/pg_ctl -D /var/lib/postgresql/data -l logfile start"}	    /usr/bin/pg_ctl -D /var/lib/postgresql/data -l logfile start	2024-09-03 07:40:26.680985
cc5d8666-54bb-4034-97ae-bc31a4eb0a5c	{"id": "cc5d8666-54bb-4034-97ae-bc31a4eb0a5c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789471, "event_message": "  LC_NUMERIC:  en_US.UTF-8"}	  LC_NUMERIC:  en_US.UTF-8	2024-09-03 07:40:25.789471
f6e9fffb-f392-412b-b923-d2c8b31dc3eb	{"id": "f6e9fffb-f392-412b-b923-d2c8b31dc3eb", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226942017, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00-schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00-schema.sql	2024-09-03 07:40:26.942017
9f66b7d6-a5ba-48bf-97cb-4dbbb3e722a7	{"id": "9f66b7d6-a5ba-48bf-97cb-4dbbb3e722a7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226960965, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:26.960965
52c36e76-b398-4c44-a43f-713c952e1351	{"id": "52c36e76-b398-4c44-a43f-713c952e1351", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226962462, "event_message": "REVOKE"}	REVOKE	2024-09-03 07:40:26.962462
4e122844-6960-42b6-ba45-52273c1716be	{"id": "4e122844-6960-42b6-ba45-52273c1716be", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226964382, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:26.964382
a5741f39-bcf9-4389-a7e5-9437d1c56a3d	{"id": "a5741f39-bcf9-4389-a7e5-9437d1c56a3d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226969284, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:26.969284
e03a3a36-b9b8-49b8-871c-e291f2c17852	{"id": "e03a3a36-b9b8-49b8-871c-e291f2c17852", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226970854, "event_message": "REVOKE"}	REVOKE	2024-09-03 07:40:26.970854
b7505003-e1d2-42f7-a621-14235da2f2f1	{"id": "b7505003-e1d2-42f7-a621-14235da2f2f1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226972006, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:26.972006
e5f7bec5-9b19-49bc-945c-068f160221e1	{"id": "e5f7bec5-9b19-49bc-945c-068f160221e1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226972882, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000000-initial-schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000000-initial-schema.sql	2024-09-03 07:40:26.972882
79c76ce2-583c-40e7-b5bc-1b2951809002	{"id": "79c76ce2-583c-40e7-b5bc-1b2951809002", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226985838, "event_message": "CREATE PUBLICATION"}	CREATE PUBLICATION	2024-09-03 07:40:26.985838
ca4afd72-f056-45ca-b3f4-acb51a69aa48	{"id": "ca4afd72-f056-45ca-b3f4-acb51a69aa48", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227059077, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.059077
f0085b8a-1b66-4195-8610-49ee9dc8b930	{"id": "f0085b8a-1b66-4195-8610-49ee9dc8b930", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227060388, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.060388
c859b230-6e0f-4b59-9816-e8bebf5c6ce1	{"id": "c859b230-6e0f-4b59-9816-e8bebf5c6ce1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227062142, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.062142
2e3205d8-88c9-40dd-aaea-8e674c78a261	{"id": "2e3205d8-88c9-40dd-aaea-8e674c78a261", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227063378, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.063378
ca0fdf02-dffe-4abf-a2f3-9119e8cf8e5f	{"id": "ca0fdf02-dffe-4abf-a2f3-9119e8cf8e5f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227064819, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.064819
66d2b039-c0e4-47e1-976e-1cc0266940ee	{"id": "66d2b039-c0e4-47e1-976e-1cc0266940ee", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227066200, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.0662
429ff124-2158-4e25-aff4-09f927888b00	{"id": "429ff124-2158-4e25-aff4-09f927888b00", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227069515, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.069515
8c89eba5-0ef0-4309-8cc2-ddb92d1b44f1	{"id": "8c89eba5-0ef0-4309-8cc2-ddb92d1b44f1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227070689, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.070689
ee955e50-6b0c-49a3-84ec-f461601d5373	{"id": "ee955e50-6b0c-49a3-84ec-f461601d5373", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225788937, "event_message": "The files belonging to this database system will be owned by user \\"postgres\\"."}	The files belonging to this database system will be owned by user "postgres".	2024-09-03 07:40:25.788937
39ebe092-1b15-461e-9621-8ed39f4fc5fc	{"id": "39ebe092-1b15-461e-9621-8ed39f4fc5fc", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789485, "event_message": "The default database encoding has accordingly been set to \\"UTF8\\"."}	The default database encoding has accordingly been set to "UTF8".	2024-09-03 07:40:25.789485
c8f793dd-bf2b-49e6-8296-834af93fba11	{"id": "c8f793dd-bf2b-49e6-8296-834af93fba11", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789437, "event_message": "The database cluster will be initialized with this locale configuration:"}	The database cluster will be initialized with this locale configuration:	2024-09-03 07:40:25.789437
c493359a-c23e-4640-bb85-75e125a0e4c3	{"id": "c493359a-c23e-4640-bb85-75e125a0e4c3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789453, "event_message": "  provider:    libc"}	  provider:    libc	2024-09-03 07:40:25.789453
e52096a4-ade9-48da-932e-3d3dc7b5c110	{"id": "e52096a4-ade9-48da-932e-3d3dc7b5c110", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789742, "event_message": "fixing permissions on existing directory /var/lib/postgresql/data ... ok"}	fixing permissions on existing directory /var/lib/postgresql/data ... ok	2024-09-03 07:40:25.789742
ab722d49-5c26-4718-ae27-b8a7acbcfa4d	{"id": "ab722d49-5c26-4718-ae27-b8a7acbcfa4d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225790800, "event_message": "creating subdirectories ... ok"}	creating subdirectories ... ok	2024-09-03 07:40:25.7908
3f2c84ba-9557-405f-982f-9a6231e562f8	{"id": "3f2c84ba-9557-405f-982f-9a6231e562f8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225791166, "event_message": "selecting dynamic shared memory implementation ... posix"}	selecting dynamic shared memory implementation ... posix	2024-09-03 07:40:25.791166
ec9cf61a-aec9-412d-be63-f96c388e4981	{"id": "ec9cf61a-aec9-412d-be63-f96c388e4981", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225811267, "event_message": "selecting default max_connections ... 100"}	selecting default max_connections ... 100	2024-09-03 07:40:25.811267
c00587c7-1a15-4f71-88aa-7c50578e1ccd	{"id": "c00587c7-1a15-4f71-88aa-7c50578e1ccd", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.878174719Z", "error_severity": "LOG"}}, "timestamp": 1725349226878174, "event_message": " 2024-09-03 07:40:26.877 UTC [62] LOG:  TimescaleDB background worker launcher connected to shared catalogs"}	 2024-09-03 07:40:26.877 UTC [62] LOG:  TimescaleDB background worker launcher connected to shared catalogs	2024-09-03 07:40:26.878174
65f004e4-a5eb-4fb8-b640-642de625b467	{"id": "65f004e4-a5eb-4fb8-b640-642de625b467", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.878539329Z", "error_severity": "LOG"}}, "timestamp": 1725349226878539, "event_message": " 2024-09-03 07:40:26.878 UTC [53] LOG:  database system is ready to accept connections"}	 2024-09-03 07:40:26.878 UTC [53] LOG:  database system is ready to accept connections	2024-09-03 07:40:26.878539
7b4daaba-b903-42b1-8c8f-fa73ac5fec7d	{"id": "7b4daaba-b903-42b1-8c8f-fa73ac5fec7d", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.885401066Z", "error_severity": "LOG"}}, "timestamp": 1725349226885401, "event_message": " 2024-09-03 07:40:26.885 UTC [64] LOG:  pg_cron scheduler started"}	 2024-09-03 07:40:26.885 UTC [64] LOG:  pg_cron scheduler started	2024-09-03 07:40:26.885401
7c2f311d-1bfe-451b-862a-60904ad2dd79	{"id": "7c2f311d-1bfe-451b-862a-60904ad2dd79", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226922093, "event_message": " done"}	 done	2024-09-03 07:40:26.922093
e299c052-bb2a-4400-b311-f383b420923e	{"id": "e299c052-bb2a-4400-b311-f383b420923e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226922116, "event_message": "server started"}	server started	2024-09-03 07:40:26.922116
58e1cf55-c932-4a24-8156-84d4d56379f9	{"id": "58e1cf55-c932-4a24-8156-84d4d56379f9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226938374, "event_message": "/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/init-scripts"}	/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/init-scripts	2024-09-03 07:40:26.938374
c76691c9-1695-49f6-9cb8-71f5967ed72c	{"id": "c76691c9-1695-49f6-9cb8-71f5967ed72c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226938384, "event_message": "/usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/migrate.sh"}	/usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/migrate.sh	2024-09-03 07:40:26.938384
ade355c1-989b-4041-81d6-77136dc842ba	{"id": "ade355c1-989b-4041-81d6-77136dc842ba", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227047712, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.047712
78ec8f89-36a9-47e6-b00d-4c9285c7da1e	{"id": "78ec8f89-36a9-47e6-b00d-4c9285c7da1e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226991504, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:26.991504
da1bb43d-347e-4dcd-97b7-e94d295afc8f	{"id": "da1bb43d-347e-4dcd-97b7-e94d295afc8f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226992667, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:26.992667
315bc40b-e56e-41a8-bc1a-c349eefa6025	{"id": "315bc40b-e56e-41a8-bc1a-c349eefa6025", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226994105, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:26.994105
8635b234-6209-4f3e-ac7e-d5ab22bd1112	{"id": "8635b234-6209-4f3e-ac7e-d5ab22bd1112", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226995276, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:26.995276
80f799d1-3d1e-4f05-90ac-f57c4afbed6f	{"id": "80f799d1-3d1e-4f05-90ac-f57c4afbed6f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227004484, "event_message": "CREATE EXTENSION"}	CREATE EXTENSION	2024-09-03 07:40:27.004484
9171c6e2-bac3-4dea-887e-c7201ca9f319	{"id": "9171c6e2-bac3-4dea-887e-c7201ca9f319", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227019085, "event_message": "CREATE EXTENSION"}	CREATE EXTENSION	2024-09-03 07:40:27.019085
837295bf-fc45-409c-a68c-3bda8c041281	{"id": "837295bf-fc45-409c-a68c-3bda8c041281", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227045639, "event_message": "CREATE EXTENSION"}	CREATE EXTENSION	2024-09-03 07:40:27.045639
241a2255-873a-454f-8aee-df67742b4afd	{"id": "241a2255-873a-454f-8aee-df67742b4afd", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227053042, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:27.053042
e8c06818-3d5c-4319-89a8-b2ebb9f204bf	{"id": "e8c06818-3d5c-4319-89a8-b2ebb9f204bf", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227053974, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:27.053974
9e72124d-6a32-412f-a897-bbe16be32d61	{"id": "9e72124d-6a32-412f-a897-bbe16be32d61", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227055226, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.055226
e685b00d-bc36-4baa-8cff-0a42ac37d3e5	{"id": "e685b00d-bc36-4baa-8cff-0a42ac37d3e5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227056893, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.056893
b85a78fa-070f-4b1a-bff3-acb015db9bef	{"id": "b85a78fa-070f-4b1a-bff3-acb015db9bef", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227057867, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.057867
d1d3025d-81cd-4c2d-8da7-9c38a5c17e5b	{"id": "d1d3025d-81cd-4c2d-8da7-9c38a5c17e5b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227135667, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.135667
74c0018c-16bc-49fb-b121-0771d3180233	{"id": "74c0018c-16bc-49fb-b121-0771d3180233", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227140070, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.14007
6ac2bceb-1ce3-48f6-8d42-42535650d115	{"id": "6ac2bceb-1ce3-48f6-8d42-42535650d115", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227151143, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.151143
e4921c39-0dec-41ea-a9d1-a87034202fd8	{"id": "e4921c39-0dec-41ea-a9d1-a87034202fd8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227155702, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.155702
0adca7ba-d441-4f56-a960-44263448b4f6	{"id": "0adca7ba-d441-4f56-a960-44263448b4f6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227160009, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.160009
0a46559c-c285-499f-9df1-e8c6f0d87a42	{"id": "0a46559c-c285-499f-9df1-e8c6f0d87a42", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227165592, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.165592
f2a2875c-152a-4c57-89ab-eb3e98623a22	{"id": "f2a2875c-152a-4c57-89ab-eb3e98623a22", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227169822, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.169822
97526997-69da-4beb-9c74-9b18022e5f53	{"id": "97526997-69da-4beb-9c74-9b18022e5f53", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227171732, "event_message": "INSERT 0 7"}	INSERT 0 7	2024-09-03 07:40:27.171732
55ad5454-f72b-4dd0-9a9a-3181de7535a5	{"id": "55ad5454-f72b-4dd0-9a9a-3181de7535a5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227173062, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.173062
91f0756a-fd1a-4f7e-a25b-c0d0467b0663	{"id": "91f0756a-fd1a-4f7e-a25b-c0d0467b0663", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227223402, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.223402
efd82281-95ae-43d4-982d-e77d568209c6	{"id": "efd82281-95ae-43d4-982d-e77d568209c6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227229988, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.229988
b7fd52e5-c7ee-43b9-81c2-45618f3f44ec	{"id": "b7fd52e5-c7ee-43b9-81c2-45618f3f44ec", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227242086, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.242086
0c2193dc-51e8-4e28-8390-45dedb8f21ce	{"id": "0c2193dc-51e8-4e28-8390-45dedb8f21ce", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227246522, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.246522
4380390a-6a6b-4473-b2d9-b1d2bc4c641e	{"id": "4380390a-6a6b-4473-b2d9-b1d2bc4c641e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227251342, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.251342
9e2e6ab5-14e4-4b7f-9c82-76399c28bd43	{"id": "9e2e6ab5-14e4-4b7f-9c82-76399c28bd43", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227252627, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.252627
69501f1f-a375-432c-a557-4e2c576fd607	{"id": "69501f1f-a375-432c-a557-4e2c576fd607", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227254390, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.25439
a8f787b4-70b4-4c05-856b-0c986747671a	{"id": "a8f787b4-70b4-4c05-856b-0c986747671a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227255694, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.255694
26fd4bd7-e2ab-4b43-a260-acf94777658e	{"id": "26fd4bd7-e2ab-4b43-a260-acf94777658e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227260224, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.260224
3b846805-ae0a-46ee-a3a0-71299d372c56	{"id": "3b846805-ae0a-46ee-a3a0-71299d372c56", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227261819, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.261819
8c3c14f6-bdcf-4d04-8621-60cb3c4f2dd4	{"id": "8c3c14f6-bdcf-4d04-8621-60cb3c4f2dd4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227313873, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.313873
551ea50b-d818-41ad-87de-ed00ac4f1fa9	{"id": "551ea50b-d818-41ad-87de-ed00ac4f1fa9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227314980, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.31498
bdced2c6-ecfb-4765-b723-9be4dd843317	{"id": "bdced2c6-ecfb-4765-b723-9be4dd843317", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227319509, "event_message": "DO"}	DO	2024-09-03 07:40:27.319509
7e881b27-4a53-412a-9a78-7b918565147a	{"id": "7e881b27-4a53-412a-9a78-7b918565147a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227320687, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.320687
d46051f5-7311-4026-90e2-45e470a80afc	{"id": "d46051f5-7311-4026-90e2-45e470a80afc", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227321996, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.321996
8997c6cc-a09d-4112-af23-7a6ec2c6d331	{"id": "8997c6cc-a09d-4112-af23-7a6ec2c6d331", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227323115, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.323115
9033b57d-1d13-4fa2-8edd-12a8df4e97be	{"id": "9033b57d-1d13-4fa2-8edd-12a8df4e97be", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227046734, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.046734
f89182e2-c23e-4c7f-ba65-fd5cf5f48ee3	{"id": "f89182e2-c23e-4c7f-ba65-fd5cf5f48ee3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227095112, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.095112
309cfb63-86fb-44b4-92de-961cffaae322	{"id": "309cfb63-86fb-44b4-92de-961cffaae322", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227098717, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.098717
401ea429-aa3b-4235-878e-d4f4b684eb64	{"id": "401ea429-aa3b-4235-878e-d4f4b684eb64", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227101943, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.101943
a94e1948-d8b6-49e3-960a-bb063a26f96c	{"id": "a94e1948-d8b6-49e3-960a-bb063a26f96c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227102897, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.102897
ed777dd6-170e-447c-afb8-80618cddc054	{"id": "ed777dd6-170e-447c-afb8-80618cddc054", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227111678, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.111678
39e98cd6-ddbd-4781-9380-1bdc5ff41fa5	{"id": "39e98cd6-ddbd-4781-9380-1bdc5ff41fa5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227115777, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.115777
9f4d8781-697f-451b-9d67-5202b2b52699	{"id": "9f4d8781-697f-451b-9d67-5202b2b52699", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227120729, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.120729
a4f2db53-4fae-4053-b23a-4c594ccab024	{"id": "a4f2db53-4fae-4053-b23a-4c594ccab024", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227181296, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.181296
4c644951-2213-466e-9bbb-ffe2ede5d303	{"id": "4c644951-2213-466e-9bbb-ffe2ede5d303", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227182464, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.182464
ef416ec7-1bc9-48b7-bc8d-b940e75fad2b	{"id": "ef416ec7-1bc9-48b7-bc8d-b940e75fad2b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227183582, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.183582
1e81bad5-ef52-4318-8453-f1acaf9e8461	{"id": "1e81bad5-ef52-4318-8453-f1acaf9e8461", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227184515, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.184515
630a3123-6cde-4e25-8e90-845a4640a2a8	{"id": "630a3123-6cde-4e25-8e90-845a4640a2a8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227185866, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.185866
c6e30a9d-d1c7-47a1-ab41-b756dfc0aa21	{"id": "c6e30a9d-d1c7-47a1-ab41-b756dfc0aa21", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227271875, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:27.271875
5259c0dd-66f2-499a-8cbf-b2b479759dae	{"id": "5259c0dd-66f2-499a-8cbf-b2b479759dae", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227273037, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.273037
200f4ef8-59b5-4c6a-a255-8e9230ee99de	{"id": "200f4ef8-59b5-4c6a-a255-8e9230ee99de", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227274244, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.274244
ceb7b1fc-0d8c-4d0f-9e37-e5fd5e06eb3b	{"id": "ceb7b1fc-0d8c-4d0f-9e37-e5fd5e06eb3b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227275920, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.27592
71eb7c18-9f3a-4b15-82fb-edf49357c7b6	{"id": "71eb7c18-9f3a-4b15-82fb-edf49357c7b6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227276179, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.276179
a548a7d5-6d7b-4fc7-906f-a18a0e18961b	{"id": "a548a7d5-6d7b-4fc7-906f-a18a0e18961b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227279531, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.279531
57023c0a-d7b5-450b-8b23-d550d01effbe	{"id": "57023c0a-d7b5-450b-8b23-d550d01effbe", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227281214, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.281214
086cab89-ccd8-48ec-96da-98701e8e7e8c	{"id": "086cab89-ccd8-48ec-96da-98701e8e7e8c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227286455, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.286455
2d8c3fd0-98b2-4a37-a8eb-b8f83ac84459	{"id": "2d8c3fd0-98b2-4a37-a8eb-b8f83ac84459", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227289424, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.289424
038c48b7-a7f8-4c96-be0d-a93a7e29102d	{"id": "038c48b7-a7f8-4c96-be0d-a93a7e29102d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227290995, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.290995
2fa0d121-219c-40e5-b1c8-313882f3e042	{"id": "2fa0d121-219c-40e5-b1c8-313882f3e042", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227291840, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000003-post-setup.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000003-post-setup.sql	2024-09-03 07:40:27.29184
8befbf82-3f22-47d8-b4c1-09bc6c75105a	{"id": "8befbf82-3f22-47d8-b4c1-09bc6c75105a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227304467, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.304467
98a77de0-9eb7-4888-9e47-e154705b6b6c	{"id": "98a77de0-9eb7-4888-9e47-e154705b6b6c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227305584, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.305584
b2707c89-ce7f-4339-8eb0-14171224b8e2	{"id": "b2707c89-ce7f-4339-8eb0-14171224b8e2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227309466, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.309466
41bde181-665b-4202-b6a1-887634ad2ff1	{"id": "41bde181-665b-4202-b6a1-887634ad2ff1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227311079, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.311079
28bdcbf8-a1e1-494d-a554-78abaf999587	{"id": "28bdcbf8-a1e1-494d-a554-78abaf999587", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227312263, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.312263
70a7f761-c20c-4570-8533-efbd41dd4623	{"id": "70a7f761-c20c-4570-8533-efbd41dd4623", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227071433, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000001-auth-schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000001-auth-schema.sql	2024-09-03 07:40:27.071433
f02edc56-6d0b-455e-8728-ea1a4b40e2c6	{"id": "f02edc56-6d0b-455e-8728-ea1a4b40e2c6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227081435, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:27.081435
1f893aa4-285d-4820-9006-e9337a8625c7	{"id": "1f893aa4-285d-4820-9006-e9337a8625c7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227174151, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.174151
c5579579-234d-4d88-b0ae-eef70c938149	{"id": "c5579579-234d-4d88-b0ae-eef70c938149", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227175203, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.175203
9c2c6a6b-4545-4587-a4b0-271522bb3351	{"id": "9c2c6a6b-4545-4587-a4b0-271522bb3351", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227176420, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.17642
f8c6ccca-33e2-4bcf-ae2d-c55f9023ae4a	{"id": "f8c6ccca-33e2-4bcf-ae2d-c55f9023ae4a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227180253, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.180253
56e3246e-44c5-4e0b-951b-956ae803dd4c	{"id": "56e3246e-44c5-4e0b-951b-956ae803dd4c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227124842, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:27.124842
dddc3833-a386-40f9-8bb5-4e47afc6cf14	{"id": "dddc3833-a386-40f9-8bb5-4e47afc6cf14", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227126144, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.126144
f3c53743-9eda-410c-8a3e-106320f02c8c	{"id": "f3c53743-9eda-410c-8a3e-106320f02c8c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227189742, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.189742
3bf663f5-768b-4dd6-8099-84f3aed68174	{"id": "3bf663f5-768b-4dd6-8099-84f3aed68174", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227190975, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.190975
8a9233de-3d4e-4f14-b8f3-bb1ef1a00455	{"id": "8a9233de-3d4e-4f14-b8f3-bb1ef1a00455", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227192413, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.192413
4d5199be-84ed-4263-9c9c-43ce87c4c7cd	{"id": "4d5199be-84ed-4263-9c9c-43ce87c4c7cd", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227193761, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.193761
99288838-b003-4c90-8600-a67d00e96d23	{"id": "99288838-b003-4c90-8600-a67d00e96d23", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227194284, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000002-storage-schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/init-scripts/00000000000002-storage-schema.sql	2024-09-03 07:40:27.194284
8a7c6de9-1aa7-4e3b-b521-f1b263db402e	{"id": "8a7c6de9-1aa7-4e3b-b521-f1b263db402e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227203301, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:27.203301
e38728ee-9aac-4af5-b5d6-e97939cb6439	{"id": "e38728ee-9aac-4af5-b5d6-e97939cb6439", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227204547, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.204547
be64f5eb-d14d-44dc-a212-8f6a010c3ced	{"id": "be64f5eb-d14d-44dc-a212-8f6a010c3ced", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227206046, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.206046
407735af-85ae-4299-a115-4c98d04c8e8c	{"id": "407735af-85ae-4299-a115-4c98d04c8e8c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227209768, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.209768
a935461c-1eda-42c3-bb32-722cc98d5b49	{"id": "a935461c-1eda-42c3-bb32-722cc98d5b49", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227211207, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.211207
f5c88abd-0e81-4b5e-a760-df9f0ee679e6	{"id": "f5c88abd-0e81-4b5e-a760-df9f0ee679e6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227282796, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.282796
f1a9092a-bad6-4fe2-94c7-a9c0214d469b	{"id": "f1a9092a-bad6-4fe2-94c7-a9c0214d469b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227284122, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.284122
2b3eeff4-ddd7-4398-ae62-41bd12a86d43	{"id": "2b3eeff4-ddd7-4398-ae62-41bd12a86d43", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227285298, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.285298
251f9b04-b43b-4ef2-8c46-ae2a9078c6a4	{"id": "251f9b04-b43b-4ef2-8c46-ae2a9078c6a4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227327363, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.327363
0fa72ff8-dd4f-4264-8f91-2438abae7446	{"id": "0fa72ff8-dd4f-4264-8f91-2438abae7446", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227328824, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.328824
55c4d64a-79bf-4aaa-8d04-1bf5dc136677	{"id": "55c4d64a-79bf-4aaa-8d04-1bf5dc136677", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227329124, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.329124
853cd57a-464e-4e81-be60-76fc5ec9ab23	{"id": "853cd57a-464e-4e81-be60-76fc5ec9ab23", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227329359, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.329359
1fd9de0a-43e3-4e10-9e19-10ae8af1a06f	{"id": "1fd9de0a-43e3-4e10-9e19-10ae8af1a06f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227332232, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.332232
9bc25651-b781-4ab0-8798-3313794387ba	{"id": "9bc25651-b781-4ab0-8798-3313794387ba", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227333712, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.333712
6de4e1b6-d606-4422-be91-59c592aebe77	{"id": "6de4e1b6-d606-4422-be91-59c592aebe77", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227439678, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.439678
8abdd534-df82-436b-84f0-a18bd3dfd99f	{"id": "8abdd534-df82-436b-84f0-a18bd3dfd99f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227324208, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.324208
4f531e31-15f1-467b-afa3-5d5b417a51f7	{"id": "4f531e31-15f1-467b-afa3-5d5b417a51f7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227325253, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.325253
63393f9e-45bd-469d-8dfc-e1d0ef2bab10	{"id": "63393f9e-45bd-469d-8dfc-e1d0ef2bab10", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227326931, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.326931
246b97a6-a627-43d8-9c8a-77b419aef9a4	{"id": "246b97a6-a627-43d8-9c8a-77b419aef9a4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227339501, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.339501
fbac1967-7e59-42b7-b833-a9abb25e21be	{"id": "fbac1967-7e59-42b7-b833-a9abb25e21be", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227360788, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.360788
accd1479-2cad-4a52-a498-83067aa1c632	{"id": "accd1479-2cad-4a52-a498-83067aa1c632", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227361692, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/00-extension.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/00-extension.sql	2024-09-03 07:40:27.361692
19ddb8c7-09bb-4b89-a491-c7bb4d07a44b	{"id": "19ddb8c7-09bb-4b89-a491-c7bb4d07a44b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227480321, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.480321
c7fd58ed-d174-4068-b4f8-f108270a9b16	{"id": "c7fd58ed-d174-4068-b4f8-f108270a9b16", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227481438, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.481438
4c083c99-a588-47d9-a1c9-05322d1f4950	{"id": "4c083c99-a588-47d9-a1c9-05322d1f4950", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227482784, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.482784
e1a24f86-f356-4b42-a36b-13babe1a8c17	{"id": "e1a24f86-f356-4b42-a36b-13babe1a8c17", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227432665, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.432665
e5d16e4c-e681-4e96-b068-e351b368e6f2	{"id": "e5d16e4c-e681-4e96-b068-e351b368e6f2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227433884, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.433884
0116ae6b-2006-4d95-a1d7-afece01ba8ff	{"id": "0116ae6b-2006-4d95-a1d7-afece01ba8ff", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227435297, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.435297
fae1301d-92da-49cf-8ba6-b0bd1cdee6d3	{"id": "fae1301d-92da-49cf-8ba6-b0bd1cdee6d3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227436731, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.436731
fe89a209-0329-4aeb-9feb-d44ffd1fc6e5	{"id": "fe89a209-0329-4aeb-9feb-d44ffd1fc6e5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227556339, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.556339
b7d96936-0790-4aa5-ae16-ae119ccb3bf6	{"id": "b7d96936-0790-4aa5-ae16-ae119ccb3bf6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227557238, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.557238
1ee994f8-6a0c-48f0-8e31-851847659e39	{"id": "1ee994f8-6a0c-48f0-8e31-851847659e39", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227558498, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211124212715_update-auth-owner.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211124212715_update-auth-owner.sql	2024-09-03 07:40:27.558498
1e577fa3-fff5-4772-8286-1a7811bc9ae1	{"id": "1e577fa3-fff5-4772-8286-1a7811bc9ae1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227583514, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.583514
91449e46-2bbe-42d3-b3db-63d7dcb45792	{"id": "91449e46-2bbe-42d3-b3db-63d7dcb45792", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227584969, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.584969
c921a7ba-6f5e-4216-a7dd-4a2128de3211	{"id": "c921a7ba-6f5e-4216-a7dd-4a2128de3211", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227586198, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:27.586198
46b97f56-cd1c-435a-85b6-a46385522af5	{"id": "46b97f56-cd1c-435a-85b6-a46385522af5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227587534, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211130151719_update-realtime-permissions.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211130151719_update-realtime-permissions.sql	2024-09-03 07:40:27.587534
647bd162-05ed-4333-a87c-7471f68edc2b	{"id": "647bd162-05ed-4333-a87c-7471f68edc2b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227612138, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.612138
e38fa9ea-afc9-4296-b3d5-aacc35e2de64	{"id": "e38fa9ea-afc9-4296-b3d5-aacc35e2de64", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227613256, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.613256
529d4c34-61a8-427b-ba65-2bd024d416ae	{"id": "529d4c34-61a8-427b-ba65-2bd024d416ae", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227746136, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:27.746136
d7daefd9-471d-46e4-ba09-9c880963de31	{"id": "d7daefd9-471d-46e4-ba09-9c880963de31", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.746382467Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227746382, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:5: NOTICE:  function graphql_public.graphql(text,text,jsonb) does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:5: NOTICE:  function graphql_public.graphql(text,text,jsonb) does not exist, skipping	2024-09-03 07:40:27.746382
1e988998-5889-450e-97e7-e87e11b9fab3	{"id": "1e988998-5889-450e-97e7-e87e11b9fab3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227763003, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.763003
cdc45362-ea52-45e7-84df-cd3fa2acc9c5	{"id": "cdc45362-ea52-45e7-84df-cd3fa2acc9c5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227764679, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.764679
02180fcf-84bc-4792-ac4f-ee8b6f027420	{"id": "02180fcf-84bc-4792-ac4f-ee8b6f027420", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.383745964Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227383745, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/00-extension.sql:1: NOTICE:  schema \\"extensions\\" already exists, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/00-extension.sql:1: NOTICE:  schema "extensions" already exists, skipping	2024-09-03 07:40:27.383745
ae090fca-abed-4a03-8d57-46969de1b315	{"id": "ae090fca-abed-4a03-8d57-46969de1b315", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227385676, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:27.385676
df255244-1b1f-4bdc-ad2e-53322e68cfd7	{"id": "df255244-1b1f-4bdc-ad2e-53322e68cfd7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227440861, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.440861
f48769ae-fe23-4578-9ad3-aa7a14cc1ea8	{"id": "f48769ae-fe23-4578-9ad3-aa7a14cc1ea8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227441106, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.441106
dee1680e-51d4-4f56-b2b9-1b77a5a3a4d2	{"id": "dee1680e-51d4-4f56-b2b9-1b77a5a3a4d2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227441366, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.441366
013440cc-d216-4217-b2e0-412c9b825e57	{"id": "013440cc-d216-4217-b2e0-412c9b825e57", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227443265, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.443265
33ef410c-e776-4c25-8218-e815f2cabfc6	{"id": "33ef410c-e776-4c25-8218-e815f2cabfc6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227444585, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.444585
63cdc44b-6d4e-4d12-9cb6-a34b4021b155	{"id": "63cdc44b-6d4e-4d12-9cb6-a34b4021b155", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227450315, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.450315
211d7aba-c979-4a06-a8ba-96de613e8503	{"id": "211d7aba-c979-4a06-a8ba-96de613e8503", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227451690, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.45169
8219ef06-882e-4412-9e1a-d2ea283ae20e	{"id": "8219ef06-882e-4412-9e1a-d2ea283ae20e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227453033, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211115181400_update-auth-permissions.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211115181400_update-auth-permissions.sql	2024-09-03 07:40:27.453033
d1e1c4ad-35d2-4ce0-b49d-57c6941c1f72	{"id": "d1e1c4ad-35d2-4ce0-b49d-57c6941c1f72", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227476052, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.476052
7075cc79-cd3e-49ba-ad4b-3a7de98928d2	{"id": "7075cc79-cd3e-49ba-ad4b-3a7de98928d2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227495928, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.495928
eca634c3-5c5a-4ce4-97b6-645568f57606	{"id": "eca634c3-5c5a-4ce4-97b6-645568f57606", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227500239, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.500239
3abeb4f2-dad8-47b9-9f27-9bff524e7632	{"id": "3abeb4f2-dad8-47b9-9f27-9bff524e7632", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227501274, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.501274
7ba45bd3-3b76-47e0-92ce-06ae4f6d0cb6	{"id": "7ba45bd3-3b76-47e0-92ce-06ae4f6d0cb6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227502594, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.502594
6822886e-46f1-46f0-b842-681027ba4274	{"id": "6822886e-46f1-46f0-b842-681027ba4274", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227503868, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211118015519_create-realtime-schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211118015519_create-realtime-schema.sql	2024-09-03 07:40:27.503868
13dfacbf-d08e-4ec2-8d2f-17928059ffe3	{"id": "13dfacbf-d08e-4ec2-8d2f-17928059ffe3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227530479, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:27.530479
c9ce0af2-d524-48d3-9a55-81f92187f1a1	{"id": "c9ce0af2-d524-48d3-9a55-81f92187f1a1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227531621, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211122051245_update-realtime-permissions.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20211122051245_update-realtime-permissions.sql	2024-09-03 07:40:27.531621
09330398-01e1-4f79-88e9-595a7ece89f4	{"id": "09330398-01e1-4f79-88e9-595a7ece89f4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227555565, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.555565
b404e4f9-591b-48b7-b78e-06adeb9f6e1d	{"id": "b404e4f9-591b-48b7-b78e-06adeb9f6e1d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227556152, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.556152
e1e040d6-0af3-4a52-b9b5-d476bf674fcb	{"id": "e1e040d6-0af3-4a52-b9b5-d476bf674fcb", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227668402, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.668402
37c5215e-c10d-4b53-a130-92012d84989b	{"id": "37c5215e-c10d-4b53-a130-92012d84989b", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.668538359Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227668538, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:59: NOTICE:  event trigger \\"pgrst_ddl_watch\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:59: NOTICE:  event trigger "pgrst_ddl_watch" does not exist, skipping	2024-09-03 07:40:27.668538
4b6d657e-7681-47c9-8de0-4bc4a891d49c	{"id": "4b6d657e-7681-47c9-8de0-4bc4a891d49c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227668654, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.668654
000b1bd6-ed58-4ff6-a922-2fda760c9dd9	{"id": "000b1bd6-ed58-4ff6-a922-2fda760c9dd9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227669993, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.669993
363952e9-e1a9-447f-ba4a-2c7cf078ecaa	{"id": "363952e9-e1a9-447f-ba4a-2c7cf078ecaa", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227404421, "event_message": "CREATE EXTENSION"}	CREATE EXTENSION	2024-09-03 07:40:27.404421
44f7b83a-1ed0-49d2-9c7e-dbcc62da2292	{"id": "44f7b83a-1ed0-49d2-9c7e-dbcc62da2292", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227405848, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/10000000000000_demote-postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/10000000000000_demote-postgres.sql	2024-09-03 07:40:27.405848
4f591e62-ddfb-458b-a902-d381bf727ab8	{"id": "4f591e62-ddfb-458b-a902-d381bf727ab8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227430232, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.430232
015f6293-5465-45c1-8eb6-33d757862434	{"id": "015f6293-5465-45c1-8eb6-33d757862434", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227431485, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.431485
dc957b36-9152-478c-b02f-384f87b339cc	{"id": "dc957b36-9152-478c-b02f-384f87b339cc", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227484027, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.484027
f0028887-488b-405c-b926-896e7bb43767	{"id": "f0028887-488b-405c-b926-896e7bb43767", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227485213, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.485213
de59e504-8077-4b43-ad69-019acbbe18c1	{"id": "de59e504-8077-4b43-ad69-019acbbe18c1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227486513, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.486513
63e86d1e-9473-44da-b902-558729eb75d6	{"id": "63e86d1e-9473-44da-b902-558729eb75d6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227490038, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:27.490038
56674155-a674-435d-92ec-048342d50af2	{"id": "56674155-a674-435d-92ec-048342d50af2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227491223, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.491223
9058a2a5-51d2-4159-b1d0-629c8b143ec1	{"id": "9058a2a5-51d2-4159-b1d0-629c8b143ec1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227492652, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.492652
641ed749-6fcb-48b0-9303-db4bbfbfc5a3	{"id": "641ed749-6fcb-48b0-9303-db4bbfbfc5a3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227493837, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.493837
d21dba77-29e4-4a50-a0d3-6e350bd909a4	{"id": "d21dba77-29e4-4a50-a0d3-6e350bd909a4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227614428, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.614428
baf54f49-4dbd-47e5-9653-498ca9ae9315	{"id": "baf54f49-4dbd-47e5-9653-498ca9ae9315", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227615769, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220118070449_enable-safeupdate-postgrest.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220118070449_enable-safeupdate-postgrest.sql	2024-09-03 07:40:27.615769
70fe4225-ede3-4338-906d-07f2119381c3	{"id": "70fe4225-ede3-4338-906d-07f2119381c3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227640796, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.640796
51ee1e39-ce67-4add-a1fd-1e5e9b283677	{"id": "51ee1e39-ce67-4add-a1fd-1e5e9b283677", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227642022, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql	2024-09-03 07:40:27.642022
6890cd0e-01d8-4d32-b543-8c9e65da4eed	{"id": "6890cd0e-01d8-4d32-b543-8c9e65da4eed", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.663944054Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227663944, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:3: NOTICE:  event trigger \\"api_restart\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:3: NOTICE:  event trigger "api_restart" does not exist, skipping	2024-09-03 07:40:27.663944
9217bdea-5b32-4b04-8568-a845335b6ec2	{"id": "9217bdea-5b32-4b04-8568-a845335b6ec2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227664073, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.664073
facde56a-77e0-439b-8c4e-db6263561c4e	{"id": "facde56a-77e0-439b-8c4e-db6263561c4e", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.664328515Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227664328, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:4: NOTICE:  function extensions.notify_api_restart() does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:4: NOTICE:  function extensions.notify_api_restart() does not exist, skipping	2024-09-03 07:40:27.664328
74fe8274-ba0b-41ef-80bf-3436c77229b8	{"id": "74fe8274-ba0b-41ef-80bf-3436c77229b8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227664405, "event_message": "DROP FUNCTION"}	DROP FUNCTION	2024-09-03 07:40:27.664405
3eb1df5a-fe8f-475b-a9d5-80eed045aa25	{"id": "3eb1df5a-fe8f-475b-a9d5-80eed045aa25", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227666924, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.666924
78d5aa7c-a5c1-4bac-b189-27fbf13afb8e	{"id": "78d5aa7c-a5c1-4bac-b189-27fbf13afb8e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227746742, "event_message": "DROP FUNCTION"}	DROP FUNCTION	2024-09-03 07:40:27.746742
f13ccb7c-2989-4d94-ba81-c3debd67d415	{"id": "f13ccb7c-2989-4d94-ba81-c3debd67d415", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227750475, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.750475
6a854790-7502-465f-99ba-23306d3cab7a	{"id": "6a854790-7502-465f-99ba-23306d3cab7a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227752011, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:27.752011
91c57ece-6c75-47ed-90e8-49011c532b38	{"id": "91c57ece-6c75-47ed-90e8-49011c532b38", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227753636, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.753636
1a1588f5-1f19-41d9-959e-051013eb0300	{"id": "1a1588f5-1f19-41d9-959e-051013eb0300", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.670080360Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227670080, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:64: NOTICE:  event trigger \\"pgrst_drop_watch\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220126121436_finer-postgrest-triggers.sql:64: NOTICE:  event trigger "pgrst_drop_watch" does not exist, skipping	2024-09-03 07:40:27.67008
ad83f906-9ccb-4559-b682-f1e9d976df22	{"id": "ad83f906-9ccb-4559-b682-f1e9d976df22", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227670190, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.67019
1e953df4-dd29-4cb8-82ef-8a9e748e7f4b	{"id": "1e953df4-dd29-4cb8-82ef-8a9e748e7f4b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227671283, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.671283
de0dabfa-a0ec-4981-96cb-e01019df9d62	{"id": "de0dabfa-a0ec-4981-96cb-e01019df9d62", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227672310, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220224211803_fix-postgrest-supautils.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220224211803_fix-postgrest-supautils.sql	2024-09-03 07:40:27.67231
24771c1c-78c3-45ef-a111-2338fed1e447	{"id": "24771c1c-78c3-45ef-a111-2338fed1e447", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227703420, "event_message": "DO"}	DO	2024-09-03 07:40:27.70342
6e0ab6b7-4266-4ad4-8de2-ef6921b7e807	{"id": "6e0ab6b7-4266-4ad4-8de2-ef6921b7e807", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227760538, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.760538
6c482a89-0d89-4d05-ac63-70f6eb722d7e	{"id": "6c482a89-0d89-4d05-ac63-70f6eb722d7e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227779913, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.779913
ed44186d-9eb6-4798-ad1c-e723256b2a52	{"id": "ed44186d-9eb6-4798-ad1c-e723256b2a52", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227820133, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.820133
a8bc50ba-490a-455f-849d-9e92d5b8085b	{"id": "a8bc50ba-490a-455f-849d-9e92d5b8085b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227821327, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.821327
c11660b8-7d12-4afc-8ba5-c83e5d04e7ce	{"id": "c11660b8-7d12-4afc-8ba5-c83e5d04e7ce", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227880598, "event_message": "DROP EXTENSION"}	DROP EXTENSION	2024-09-03 07:40:27.880598
e9efca53-82c5-448d-b2ba-428d422dcfcf	{"id": "e9efca53-82c5-448d-b2ba-428d422dcfcf", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227823878, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220322085208_gotrue-session-limit.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220322085208_gotrue-session-limit.sql	2024-09-03 07:40:27.823878
fb228089-ecc4-4ad2-bf1d-0472c1924b70	{"id": "fb228089-ecc4-4ad2-bf1d-0472c1924b70", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227843853, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:27.843853
2ce9c296-5224-44c3-98e1-75d9cda32469	{"id": "2ce9c296-5224-44c3-98e1-75d9cda32469", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227845294, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220404205710_pg_graphql-on-by-default.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220404205710_pg_graphql-on-by-default.sql	2024-09-03 07:40:27.845294
ae57a260-6fae-4f4e-9eba-08da446ce156	{"id": "ae57a260-6fae-4f4e-9eba-08da446ce156", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227872489, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.872489
62f71274-dbca-4138-8e06-ef648cd48ab8	{"id": "62f71274-dbca-4138-8e06-ef648cd48ab8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227874907, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.874907
fa02abc1-0c4b-4362-a5f5-f3001f6d430b	{"id": "fa02abc1-0c4b-4362-a5f5-f3001f6d430b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227880397, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.880397
04c0a8c2-b858-46a9-a1b5-a914390957bd	{"id": "04c0a8c2-b858-46a9-a1b5-a914390957bd", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228365737, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.365737
09fee4ab-42c5-418e-8b5f-21804753e316	{"id": "09fee4ab-42c5-418e-8b5f-21804753e316", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228366486, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230224042246_grant_extensions_perms_for_postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230224042246_grant_extensions_perms_for_postgres.sql	2024-09-03 07:40:28.366486
ed6cea42-e8ca-4f00-9a08-ff262d0fbd6e	{"id": "ed6cea42-e8ca-4f00-9a08-ff262d0fbd6e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228387375, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.387375
15930d9a-d3f9-4d40-9d09-c437e2e67c69	{"id": "15930d9a-d3f9-4d40-9d09-c437e2e67c69", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228391672, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.391672
fc07c9d3-50ea-4cb3-a80b-6f9f14c33c64	{"id": "fc07c9d3-50ea-4cb3-a80b-6f9f14c33c64", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228440804, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230529180330_alter_api_roles_for_inherit.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230529180330_alter_api_roles_for_inherit.sql	2024-09-03 07:40:28.440804
f74bf081-b0a0-4b99-bd0c-87355a6d2630	{"id": "f74bf081-b0a0-4b99-bd0c-87355a6d2630", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228464628, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.464628
3125ddfe-ed3d-4a2a-ab9b-9ebd0185c2b8	{"id": "3125ddfe-ed3d-4a2a-ab9b-9ebd0185c2b8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228395025, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.395025
9e14b096-1074-4138-b352-32edf2c64f75	{"id": "9e14b096-1074-4138-b352-32edf2c64f75", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.764842615Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227764842, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:90: NOTICE:  event trigger \\"issue_pg_graphql_access\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:90: NOTICE:  event trigger "issue_pg_graphql_access" does not exist, skipping	2024-09-03 07:40:27.764842
ca133016-ef02-4d7b-9edb-2685081d4753	{"id": "ca133016-ef02-4d7b-9edb-2685081d4753", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227764884, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.764884
d1ba998b-0e35-4d42-bed7-789a63ec3bf5	{"id": "d1ba998b-0e35-4d42-bed7-789a63ec3bf5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227766314, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.766314
9f737653-c34f-4333-916f-7ecb4e48ad20	{"id": "9f737653-c34f-4333-916f-7ecb4e48ad20", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227770288, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:27.770288
e10aed43-cf8d-4882-8145-0eb0969eed04	{"id": "e10aed43-cf8d-4882-8145-0eb0969eed04", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227774079, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.774079
f1ea4485-8c4e-4b3c-a8d7-9cd57d2f3a43	{"id": "f1ea4485-8c4e-4b3c-a8d7-9cd57d2f3a43", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227774201, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.774201
e587c7f3-75e7-4d1c-9fbb-e0bea7cc2f71	{"id": "e587c7f3-75e7-4d1c-9fbb-e0bea7cc2f71", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.774253814Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227774253, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:143: NOTICE:  event trigger \\"issue_graphql_placeholder\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql:143: NOTICE:  event trigger "issue_graphql_placeholder" does not exist, skipping	2024-09-03 07:40:27.774253
81e76279-efbe-4e80-8600-f72ddf846e14	{"id": "81e76279-efbe-4e80-8600-f72ddf846e14", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227778486, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.778486
d87af575-68e7-4013-a6f7-5b83669119f3	{"id": "d87af575-68e7-4013-a6f7-5b83669119f3", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.880531611Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227880531, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220404205710_pg_graphql-on-by-default.sql:142: NOTICE:  extension \\"pg_graphql\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220404205710_pg_graphql-on-by-default.sql:142: NOTICE:  extension "pg_graphql" does not exist, skipping	2024-09-03 07:40:27.880531
4671c76b-4d0b-4006-9e27-a4bde5681664	{"id": "4671c76b-4d0b-4006-9e27-a4bde5681664", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227822469, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:27.822469
42b1ae93-2a8f-4ce5-bc8c-8464c002c3cc	{"id": "42b1ae93-2a8f-4ce5-bc8c-8464c002c3cc", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227902598, "event_message": "DO"}	DO	2024-09-03 07:40:27.902598
7fc193e7-d303-4a0f-badf-2694b037a624	{"id": "7fc193e7-d303-4a0f-badf-2694b037a624", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227903956, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220609081115_grant-supabase-auth-admin-and-supabase-storage-admin-to-postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220609081115_grant-supabase-auth-admin-and-supabase-storage-admin-to-postgres.sql	2024-09-03 07:40:27.903956
664bc4f2-ec4e-412d-ac20-4feb05c082b2	{"id": "664bc4f2-ec4e-412d-ac20-4feb05c082b2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227929935, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:27.929935
51fe5fdb-2043-4890-bde2-d509e7e10ca2	{"id": "51fe5fdb-2043-4890-bde2-d509e7e10ca2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227930982, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220613123923_pg_graphql-pg-dump-perms.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220613123923_pg_graphql-pg-dump-perms.sql	2024-09-03 07:40:27.930982
90ba3b2b-f314-44b1-8fa1-777fa0475912	{"id": "90ba3b2b-f314-44b1-8fa1-777fa0475912", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227959593, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.959593
3a4738ec-adeb-4b92-8f92-8a0895b4f8c7	{"id": "3a4738ec-adeb-4b92-8f92-8a0895b4f8c7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227964902, "event_message": "DROP EXTENSION"}	DROP EXTENSION	2024-09-03 07:40:27.964902
51f75b1d-fe47-4c89-9c70-5391decad864	{"id": "51f75b1d-fe47-4c89-9c70-5391decad864", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227985461, "event_message": "DO"}	DO	2024-09-03 07:40:27.985461
2462b3cd-a71f-4868-9d4e-19b3c2d186ad	{"id": "2462b3cd-a71f-4868-9d4e-19b3c2d186ad", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228025129, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221028101028_set_authenticator_timeout.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221028101028_set_authenticator_timeout.sql	2024-09-03 07:40:28.025129
2432a622-10d7-417b-89a1-a4201b7b1a17	{"id": "2432a622-10d7-417b-89a1-a4201b7b1a17", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228050825, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.050825
b0d8d6e8-8104-4c25-8d9d-53c9ce472366	{"id": "b0d8d6e8-8104-4c25-8d9d-53c9ce472366", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228051894, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221103090837_revoke_admin.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221103090837_revoke_admin.sql	2024-09-03 07:40:28.051894
1408ad9f-f181-47aa-859d-607bc7858c20	{"id": "1408ad9f-f181-47aa-859d-607bc7858c20", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228075260, "event_message": "REVOKE ROLE"}	REVOKE ROLE	2024-09-03 07:40:28.07526
7c00b690-4196-431f-a6ca-de4a6ef26a9b	{"id": "7c00b690-4196-431f-a6ca-de4a6ef26a9b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227754987, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.754987
f1408531-e33c-41d3-9859-e7665cb0701f	{"id": "f1408531-e33c-41d3-9859-e7665cb0701f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227756156, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.756156
72c0d982-8dce-4379-af7b-a24dd87ef01e	{"id": "72c0d982-8dce-4379-af7b-a24dd87ef01e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227704508, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220317095840_pg_graphql.sql	2024-09-03 07:40:27.704508
0206512f-bf2f-4aa2-95b7-f7bd3bfaae4d	{"id": "0206512f-bf2f-4aa2-95b7-f7bd3bfaae4d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227761738, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:27.761738
e978100d-1b46-499e-b557-8a51365267b9	{"id": "e978100d-1b46-499e-b557-8a51365267b9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227781286, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql	2024-09-03 07:40:27.781286
29b9a50b-4b56-48c4-a5b2-6add4e16c62b	{"id": "29b9a50b-4b56-48c4-a5b2-6add4e16c62b", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.806039886Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227806039, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql:3: NOTICE:  event trigger \\"api_restart\\" does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql:3: NOTICE:  event trigger "api_restart" does not exist, skipping	2024-09-03 07:40:27.806039
acce8fc2-5ad7-4633-912f-f5fcf9b7dde1	{"id": "acce8fc2-5ad7-4633-912f-f5fcf9b7dde1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227806164, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.806164
a7f8b755-ae66-46db-af44-7067ac7b92d4	{"id": "a7f8b755-ae66-46db-af44-7067ac7b92d4", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:27.806437487Z", "error_severity": "NOTICE"}}, "timestamp": 1725349227806437, "event_message": "psql:/docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql:4: NOTICE:  function extensions.notify_api_restart() does not exist, skipping"}	psql:/docker-entrypoint-initdb.d/migrations/20220321174452_fix-postgrest-alter-type-event-trigger.sql:4: NOTICE:  function extensions.notify_api_restart() does not exist, skipping	2024-09-03 07:40:27.806437
4befd5e0-3e9c-4418-8252-3cd4e4563c2a	{"id": "4befd5e0-3e9c-4418-8252-3cd4e4563c2a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227807698, "event_message": "DROP FUNCTION"}	DROP FUNCTION	2024-09-03 07:40:27.807698
802b27d1-54e7-4569-8f04-e299e21b93fd	{"id": "802b27d1-54e7-4569-8f04-e299e21b93fd", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227812681, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.812681
10c186d3-7492-4107-9d53-ceb19f02f1a6	{"id": "10c186d3-7492-4107-9d53-ceb19f02f1a6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227815141, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:27.815141
2b6e60c6-1e39-49e5-a92d-841a7295d86f	{"id": "2b6e60c6-1e39-49e5-a92d-841a7295d86f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227816616, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:27.816616
9983a731-b1af-4cf2-983e-882a258dd347	{"id": "9983a731-b1af-4cf2-983e-882a258dd347", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227986957, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220713082019_pg_cron-pg_net-temp-perms-fix.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20220713082019_pg_cron-pg_net-temp-perms-fix.sql	2024-09-03 07:40:27.986957
a460819e-abdd-47bd-9b37-210d400ed92d	{"id": "a460819e-abdd-47bd-9b37-210d400ed92d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228017108, "event_message": "DO"}	DO	2024-09-03 07:40:28.017108
2e42b7e9-2ae5-4575-9768-ccb9d8559281	{"id": "2e42b7e9-2ae5-4575-9768-ccb9d8559281", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228023819, "event_message": "DO"}	DO	2024-09-03 07:40:28.023819
3e9633b6-9d18-4991-99dd-9fddf2099092	{"id": "3e9633b6-9d18-4991-99dd-9fddf2099092", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228415980, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230327032006_grant_auth_roles_to_supabase_storage_admin.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230327032006_grant_auth_roles_to_supabase_storage_admin.sql	2024-09-03 07:40:28.41598
d5780232-4563-484c-851d-374e74df53d5	{"id": "d5780232-4563-484c-851d-374e74df53d5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228439816, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.439816
6dc0caec-2665-4e69-8bb1-d8b733ac947a	{"id": "6dc0caec-2665-4e69-8bb1-d8b733ac947a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228392130, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.39213
3738b099-a78c-4e0b-85c7-44737f6cfb47	{"id": "3738b099-a78c-4e0b-85c7-44737f6cfb47", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228393862, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.393862
77c79421-ce7a-4daf-8ecc-cb1da8a5b4b9	{"id": "77c79421-ce7a-4daf-8ecc-cb1da8a5b4b9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228465829, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.465829
a41b40bb-fd22-4a00-a28c-2ec0d1148dc3	{"id": "a41b40bb-fd22-4a00-a28c-2ec0d1148dc3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228466975, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.466975
c686a245-a86c-4620-b6d1-de2d76a2c971	{"id": "c686a245-a86c-4620-b6d1-de2d76a2c971", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228076717, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221207154255_create_pgsodium_and_vault.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20221207154255_create_pgsodium_and_vault.sql	2024-09-03 07:40:28.076717
e2931a47-e48b-4b85-bd77-6b035905b894	{"id": "e2931a47-e48b-4b85-bd77-6b035905b894", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228349553, "event_message": "DO"}	DO	2024-09-03 07:40:28.349553
91b59b56-b7ba-481b-a029-79bd58eebb93	{"id": "91b59b56-b7ba-481b-a029-79bd58eebb93", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228350879, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230201083204_grant_auth_roles_to_postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230201083204_grant_auth_roles_to_postgres.sql	2024-09-03 07:40:28.350879
288b9c10-76be-4e91-b08c-921bba78568c	{"id": "288b9c10-76be-4e91-b08c-921bba78568c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228496374, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231017062225_grant_pg_graphql_permissions_for_custom_roles.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231017062225_grant_pg_graphql_permissions_for_custom_roles.sql	2024-09-03 07:40:28.496374
a0772ff2-9553-4831-a6e4-79dcbb3aefc5	{"id": "a0772ff2-9553-4831-a6e4-79dcbb3aefc5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228524216, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:28.524216
f22457d6-8cc3-4973-afb7-11376f946e33	{"id": "f22457d6-8cc3-4973-afb7-11376f946e33", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228530005, "event_message": "DROP EXTENSION"}	DROP EXTENSION	2024-09-03 07:40:28.530005
06c98ec0-3313-4928-b2b3-1da71988ac6c	{"id": "06c98ec0-3313-4928-b2b3-1da71988ac6c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228551265, "event_message": "DO"}	DO	2024-09-03 07:40:28.551265
118f21e3-140c-4952-9fd5-ee684aa7e1e1	{"id": "118f21e3-140c-4952-9fd5-ee684aa7e1e1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228552637, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231020085357_revoke_writes_on_cron_job_from_postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231020085357_revoke_writes_on_cron_job_from_postgres.sql	2024-09-03 07:40:28.552637
be408972-308d-43ff-9c42-55bf53ae04d3	{"id": "be408972-308d-43ff-9c42-55bf53ae04d3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228576936, "event_message": "DO"}	DO	2024-09-03 07:40:28.576936
346d2ff7-4190-4805-9688-b032de17d83c	{"id": "346d2ff7-4190-4805-9688-b032de17d83c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228582325, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:28.582325
d1774640-b09f-4f5b-98c6-03825f37a221	{"id": "d1774640-b09f-4f5b-98c6-03825f37a221", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228584267, "event_message": "DROP EVENT TRIGGER"}	DROP EVENT TRIGGER	2024-09-03 07:40:28.584267
9b81a467-32f1-4a87-abe8-1654568a463e	{"id": "9b81a467-32f1-4a87-abe8-1654568a463e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228585929, "event_message": "CREATE EVENT TRIGGER"}	CREATE EVENT TRIGGER	2024-09-03 07:40:28.585929
c99acfea-4125-4fe2-bc7e-e500abdcaff8	{"id": "c99acfea-4125-4fe2-bc7e-e500abdcaff8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228747389, "event_message": "ALTER SCHEMA"}	ALTER SCHEMA	2024-09-03 07:40:28.747389
7f5697bf-3b41-4826-98da-d118e2d2ed85	{"id": "7f5697bf-3b41-4826-98da-d118e2d2ed85", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228749012, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:28.749012
d0918cf8-fbce-413e-b6dc-199ee1612593	{"id": "d0918cf8-fbce-413e-b6dc-199ee1612593", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228751239, "event_message": "ALTER SCHEMA"}	ALTER SCHEMA	2024-09-03 07:40:28.751239
4467b202-dd9e-4cac-80e1-da7c1e1525bd	{"id": "4467b202-dd9e-4cac-80e1-da7c1e1525bd", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228752853, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:28.752853
630a3af5-7ecc-4337-819b-39582cf45654	{"id": "630a3af5-7ecc-4337-819b-39582cf45654", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228754291, "event_message": "ALTER SCHEMA"}	ALTER SCHEMA	2024-09-03 07:40:28.754291
238a257f-7488-471f-8fa3-b9384a950f2f	{"id": "238a257f-7488-471f-8fa3-b9384a950f2f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228754401, "event_message": "BEGIN"}	BEGIN	2024-09-03 07:40:28.754401
287f792c-8995-4102-9660-6df535774b65	{"id": "287f792c-8995-4102-9660-6df535774b65", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228791610, "event_message": "CREATE EXTENSION"}	CREATE EXTENSION	2024-09-03 07:40:28.79161
98b5fcdd-571b-42eb-a859-00e585580d4b	{"id": "98b5fcdd-571b-42eb-a859-00e585580d4b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228791854, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:28.791854
60d748a2-910d-40f7-b4db-bdf4e8597dd0	{"id": "60d748a2-910d-40f7-b4db-bdf4e8597dd0", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228792208, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.792208
e8a66fb6-94dd-436c-a8e3-dfa31d33f76e	{"id": "e8a66fb6-94dd-436c-a8e3-dfa31d33f76e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228792515, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.792515
6e245ef0-8436-42c1-aa7f-1b7ade5ccdc2	{"id": "6e245ef0-8436-42c1-aa7f-1b7ade5ccdc2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228833203, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:28.833203
7612590b-687d-49cb-804c-7c819c4d77f2	{"id": "7612590b-687d-49cb-804c-7c819c4d77f2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228833436, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:28.833436
b3d8be2a-b15e-4a97-a2a5-46703df20956	{"id": "b3d8be2a-b15e-4a97-a2a5-46703df20956", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228833914, "event_message": "DO"}	DO	2024-09-03 07:40:28.833914
38adf37a-888b-4705-950a-ab055fee0492	{"id": "38adf37a-888b-4705-950a-ab055fee0492", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228834168, "event_message": "INSERT 0 1"}	INSERT 0 1	2024-09-03 07:40:28.834168
99591034-4bd5-4a16-853c-72f3d3adc127	{"id": "99591034-4bd5-4a16-853c-72f3d3adc127", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228396425, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.396425
ba0964d3-f138-43a0-9fa4-efd0afbab9b0	{"id": "ba0964d3-f138-43a0-9fa4-efd0afbab9b0", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228468198, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.468198
d62a3149-b144-459e-8674-026b6e637b27	{"id": "d62a3149-b144-459e-8674-026b6e637b27", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228469535, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231013070755_grant_authenticator_to_supabase_storage_admin.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231013070755_grant_authenticator_to_supabase_storage_admin.sql	2024-09-03 07:40:28.469535
8abe00af-eb43-44e7-a20b-3e96548335c0	{"id": "8abe00af-eb43-44e7-a20b-3e96548335c0", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228493687, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.493687
a26171b8-219d-4acb-809c-d6c004a56295	{"id": "a26171b8-219d-4acb-809c-d6c004a56295", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228495133, "event_message": "REVOKE ROLE"}	REVOKE ROLE	2024-09-03 07:40:28.495133
916b7eb4-0074-4a65-9a94-3977e9a44510	{"id": "916b7eb4-0074-4a65-9a94-3977e9a44510", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228614074, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20240124080435_alter_lo_export_lo_import_owner.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20240124080435_alter_lo_export_lo_import_owner.sql	2024-09-03 07:40:28.614074
c3cb83c4-23d6-43aa-abb7-645f9c15c1c4	{"id": "c3cb83c4-23d6-43aa-abb7-645f9c15c1c4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228640402, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.640402
5cc09ec2-895e-4266-8199-3398b5851762	{"id": "5cc09ec2-895e-4266-8199-3398b5851762", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228641512, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.641512
98a3aa14-cc38-49ec-8678-bf3ee380a1ef	{"id": "98a3aa14-cc38-49ec-8678-bf3ee380a1ef", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228642934, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.642934
bef388f3-3d67-4686-976e-2df29bc93b0a	{"id": "bef388f3-3d67-4686-976e-2df29bc93b0a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228724960, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.72496
ef1e82e0-f027-42de-9659-eb4a5576ffd9	{"id": "ef1e82e0-f027-42de-9659-eb4a5576ffd9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228732795, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.732795
0699349d-4042-4149-8e18-04d3b69c47f0	{"id": "0699349d-4042-4149-8e18-04d3b69c47f0", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228738449, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.738449
ffd8e417-6322-4681-be9f-d04d1f140c98	{"id": "ffd8e417-6322-4681-be9f-d04d1f140c98", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228792866, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.792866
1a254e6b-fa17-497e-af6c-12141005cd3d	{"id": "1a254e6b-fa17-497e-af6c-12141005cd3d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228793281, "event_message": "ALTER DEFAULT PRIVILEGES"}	ALTER DEFAULT PRIVILEGES	2024-09-03 07:40:28.793281
b4bc5d76-ad3e-4951-8283-80661dbb8961	{"id": "b4bc5d76-ad3e-4951-8283-80661dbb8961", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228824618, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.824618
0bcecdda-6255-4363-941c-76c3043aabf3	{"id": "0bcecdda-6255-4363-941c-76c3043aabf3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228801198, "event_message": "INSERT 0 1"}	INSERT 0 1	2024-09-03 07:40:28.801198
2b8e268c-705e-4d08-b010-3865b4c542f5	{"id": "2b8e268c-705e-4d08-b010-3865b4c542f5", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228825515, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.825515
fdc4beef-312f-4d69-8da7-08cb6bcc4645	{"id": "fdc4beef-312f-4d69-8da7-08cb6bcc4645", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228825785, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.825785
213b6f9d-3d50-43d4-8c00-a8712cca3f7d	{"id": "213b6f9d-3d50-43d4-8c00-a8712cca3f7d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228827422, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:28.827422
d047c481-ed4f-4cb0-ac86-6af040e635c2	{"id": "d047c481-ed4f-4cb0-ac86-6af040e635c2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228820697, "event_message": "COMMENT"}	COMMENT	2024-09-03 07:40:28.820697
e8527a15-aa96-4fa5-933b-f4e5f815da46	{"id": "e8527a15-aa96-4fa5-933b-f4e5f815da46", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228828563, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.828563
ae5d310a-5e8c-4d51-b9e5-960482b774f1	{"id": "ae5d310a-5e8c-4d51-b9e5-960482b774f1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228828850, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.82885
10717a79-d722-4333-bd31-f95a5d54a891	{"id": "10717a79-d722-4333-bd31-f95a5d54a891", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228829407, "event_message": "DO"}	DO	2024-09-03 07:40:28.829407
3a66eafb-1253-44fd-b2b9-998f796ef2f8	{"id": "3a66eafb-1253-44fd-b2b9-998f796ef2f8", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228831538, "event_message": "DO"}	DO	2024-09-03 07:40:28.831538
fdcd5f4f-ab1c-4478-ab78-e4b82511e29c	{"id": "fdcd5f4f-ab1c-4478-ab78-e4b82511e29c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228861145, "event_message": "/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/migrations"}	/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/migrations	2024-09-03 07:40:28.861145
c24d1aa3-636a-464b-a00b-11114afb6baf	{"id": "c24d1aa3-636a-464b-a00b-11114afb6baf", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.863220363Z", "error_severity": "LOG"}}, "timestamp": 1725349228863220, "event_message": "waiting for server to shut down.... 2024-09-03 07:40:28.863 UTC [53] LOG:  received fast shutdown request"}	waiting for server to shut down.... 2024-09-03 07:40:28.863 UTC [53] LOG:  received fast shutdown request	2024-09-03 07:40:28.86322
fb3b1817-12ba-40cd-acce-66930df9eeb9	{"id": "fb3b1817-12ba-40cd-acce-66930df9eeb9", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228397948, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230306081037_grant_pg_monitor_to_postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20230306081037_grant_pg_monitor_to_postgres.sql	2024-09-03 07:40:28.397948
24194655-ae61-416a-8347-778bfcefcc8e	{"id": "24194655-ae61-416a-8347-778bfcefcc8e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228415294, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.415294
3fb44fbb-3221-4da0-b821-77a19ae1ece6	{"id": "3fb44fbb-3221-4da0-b821-77a19ae1ece6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228587444, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231130133139_set_lock_timeout_to_authenticator_role.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20231130133139_set_lock_timeout_to_authenticator_role.sql	2024-09-03 07:40:28.587444
f9d8bb56-f7f6-44b1-a390-ecd86aa2cca2	{"id": "f9d8bb56-f7f6-44b1-a390-ecd86aa2cca2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228612700, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.6127
f178bc9e-632e-45ba-be1a-f3717728aef3	{"id": "f178bc9e-632e-45ba-be1a-f3717728aef3", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228695358, "event_message": "ALTER DATABASE"}	ALTER DATABASE	2024-09-03 07:40:28.695358
f277d670-3da0-4309-a957-5cd6ccc88320	{"id": "f277d670-3da0-4309-a957-5cd6ccc88320", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228696828, "event_message": "ALTER DATABASE"}	ALTER DATABASE	2024-09-03 07:40:28.696828
93229978-4d45-425e-a76a-c62e0e814de7	{"id": "93229978-4d45-425e-a76a-c62e0e814de7", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228706281, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.706281
0be585b8-9a23-4675-91c7-ca235a432f80	{"id": "0be585b8-9a23-4675-91c7-ca235a432f80", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228715484, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.715484
81b85052-c1d7-4dda-b6c6-3be85f46c5fb	{"id": "81b85052-c1d7-4dda-b6c6-3be85f46c5fb", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228644149, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20240606060239_grant_predefined_roles_to_postgres.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /docker-entrypoint-initdb.d/migrations/20240606060239_grant_predefined_roles_to_postgres.sql	2024-09-03 07:40:28.644149
8586c1c4-e66d-4699-970d-4a77010ec139	{"id": "8586c1c4-e66d-4699-970d-4a77010ec139", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228667147, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:28.667147
76de0388-571b-4082-9002-ac59033b420d	{"id": "76de0388-571b-4082-9002-ac59033b420d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228668483, "event_message": "/docker-entrypoint-initdb.d/migrate.sh: running /etc/postgresql.schema.sql"}	/docker-entrypoint-initdb.d/migrate.sh: running /etc/postgresql.schema.sql	2024-09-03 07:40:28.668483
5de9727a-396b-40cf-9cda-07049a21b03a	{"id": "5de9727a-396b-40cf-9cda-07049a21b03a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228744075, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:28.744075
ba9462b1-b0a1-473a-bdce-c4da89a4f203	{"id": "ba9462b1-b0a1-473a-bdce-c4da89a4f203", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228746314, "event_message": "CREATE SCHEMA"}	CREATE SCHEMA	2024-09-03 07:40:28.746314
624cea79-32b1-4a4a-ae82-e13f9ebbb61e	{"id": "624cea79-32b1-4a4a-ae82-e13f9ebbb61e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228800663, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:28.800663
9fc4552b-cbd1-494f-b14f-877d21c0d432	{"id": "9fc4552b-cbd1-494f-b14f-877d21c0d432", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228825273, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.825273
da9a490a-8f8b-4c82-9c72-4050ba3a4e10	{"id": "da9a490a-8f8b-4c82-9c72-4050ba3a4e10", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228809030, "event_message": "CREATE TABLE"}	CREATE TABLE	2024-09-03 07:40:28.80903
4cba5128-3e24-4c4c-9938-fcc0324cfe39	{"id": "4cba5128-3e24-4c4c-9938-fcc0324cfe39", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228815336, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:28.815336
61f27790-1a86-47f8-858c-11e6aba0528b	{"id": "61f27790-1a86-47f8-858c-11e6aba0528b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228820315, "event_message": "CREATE INDEX"}	CREATE INDEX	2024-09-03 07:40:28.820315
0b92ce72-2f3b-4d93-b7c7-be23e0957e8b	{"id": "0b92ce72-2f3b-4d93-b7c7-be23e0957e8b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228828295, "event_message": "ALTER TABLE"}	ALTER TABLE	2024-09-03 07:40:28.828295
89080a0d-b783-45b7-bb38-5cb98de229f4	{"id": "89080a0d-b783-45b7-bb38-5cb98de229f4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228823387, "event_message": "CREATE FUNCTION"}	CREATE FUNCTION	2024-09-03 07:40:28.823387
6ee3a16a-3de6-469a-90a3-04047d224e55	{"id": "6ee3a16a-3de6-469a-90a3-04047d224e55", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228824067, "event_message": "DO"}	DO	2024-09-03 07:40:28.824067
8a847f80-6a87-483a-a4a0-154cd510e811	{"id": "8a847f80-6a87-483a-a4a0-154cd510e811", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859283, "event_message": " pg_stat_statements_reset "}	 pg_stat_statements_reset 	2024-09-03 07:40:28.859283
5597d154-0a51-4a34-91b2-4bf041ae69a4	{"id": "5597d154-0a51-4a34-91b2-4bf041ae69a4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859326, "event_message": "--------------------------"}	--------------------------	2024-09-03 07:40:28.859326
9d773f1d-ae45-4dac-b5da-07bed806c47b	{"id": "9d773f1d-ae45-4dac-b5da-07bed806c47b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859336, "event_message": "(1 row)"}	(1 row)	2024-09-03 07:40:28.859336
5d5383e1-3d76-439d-b18d-fe3375981cb1	{"id": "5d5383e1-3d76-439d-b18d-fe3375981cb1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859343, "event_message": " pg_stat_reset "}	 pg_stat_reset 	2024-09-03 07:40:28.859343
a0ad4a1e-f8b6-49b1-a36a-f21ebca345e1	{"id": "a0ad4a1e-f8b6-49b1-a36a-f21ebca345e1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228834610, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.83461
5d76a7a5-012d-4ab1-90f5-f59a36f04c61	{"id": "5d76a7a5-012d-4ab1-90f5-f59a36f04c61", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228834977, "event_message": "ALTER FUNCTION"}	ALTER FUNCTION	2024-09-03 07:40:28.834977
594872ba-e95e-4e14-97d4-499eadc6b735	{"id": "594872ba-e95e-4e14-97d4-499eadc6b735", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228835180, "event_message": "REVOKE"}	REVOKE	2024-09-03 07:40:28.83518
4c82cd81-cc86-4c9c-9ac7-baba85f9490b	{"id": "4c82cd81-cc86-4c9c-9ac7-baba85f9490b", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228835446, "event_message": "GRANT"}	GRANT	2024-09-03 07:40:28.835446
789f2952-e73f-4a7a-a5c1-ae6c5792e226	{"id": "789f2952-e73f-4a7a-a5c1-ae6c5792e226", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228837955, "event_message": "COMMIT"}	COMMIT	2024-09-03 07:40:28.837955
ac46b871-e1bc-4d0c-961e-e643f0203931	{"id": "ac46b871-e1bc-4d0c-961e-e643f0203931", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349229067192, "event_message": "PostgreSQL init process complete; ready for start up."}	PostgreSQL init process complete; ready for start up.	2024-09-03 07:40:29.067192
3621f323-d2f5-4fd7-a89f-d7ffda2342e9	{"id": "3621f323-d2f5-4fd7-a89f-d7ffda2342e9", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.104676085Z", "error_severity": "LOG"}}, "timestamp": 1725349229104676, "event_message": " 2024-09-03 07:40:29.104 UTC [10] LOG:  pgaudit extension initialized"}	 2024-09-03 07:40:29.104 UTC [10] LOG:  pgaudit extension initialized	2024-09-03 07:40:29.104676
a2be1d15-9fa6-41b2-8750-51abfd5e2b26	{"id": "a2be1d15-9fa6-41b2-8750-51abfd5e2b26", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.117468797Z", "error_severity": "LOG"}}, "timestamp": 1725349229117468, "event_message": " 2024-09-03 07:40:29.117 UTC [10] LOG:  pgsodium primary server secret key loaded"}	 2024-09-03 07:40:29.117 UTC [10] LOG:  pgsodium primary server secret key loaded	2024-09-03 07:40:29.117468
8ec356e0-9171-4d73-a7a1-680a92c3a6d3	{"id": "8ec356e0-9171-4d73-a7a1-680a92c3a6d3", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.185158365Z", "error_severity": "LOG"}}, "timestamp": 1725349229185158, "event_message": " 2024-09-03 07:40:29.185 UTC [10] LOG:  starting PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	 2024-09-03 07:40:29.185 UTC [10] LOG:  starting PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:29.185158
e4bd134e-4eb3-45df-8c16-e83748552cbf	{"id": "e4bd134e-4eb3-45df-8c16-e83748552cbf", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.185360015Z", "error_severity": "LOG"}}, "timestamp": 1725349229185360, "event_message": " 2024-09-03 07:40:29.185 UTC [10] LOG:  listening on IPv4 address \\"0.0.0.0\\", port 5432"}	 2024-09-03 07:40:29.185 UTC [10] LOG:  listening on IPv4 address "0.0.0.0", port 5432	2024-09-03 07:40:29.18536
f4642440-fc9e-4b4e-9da6-824b6a6a8451	{"id": "f4642440-fc9e-4b4e-9da6-824b6a6a8451", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.185385195Z", "error_severity": "LOG"}}, "timestamp": 1725349229185385, "event_message": " 2024-09-03 07:40:29.185 UTC [10] LOG:  listening on IPv6 address \\"::\\", port 5432"}	 2024-09-03 07:40:29.185 UTC [10] LOG:  listening on IPv6 address "::", port 5432	2024-09-03 07:40:29.185385
1750d620-9a56-43b6-b184-d07a911bc711	{"id": "1750d620-9a56-43b6-b184-d07a911bc711", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.988274978Z", "error_severity": "LOG"}}, "timestamp": 1725349228988274, "event_message": " 2024-09-03 07:40:28.988 UTC [53] LOG:  database system is shut down"}	 2024-09-03 07:40:28.988 UTC [53] LOG:  database system is shut down	2024-09-03 07:40:28.988274
cbac319f-1453-49e1-9c18-cff2925a2fba	{"id": "cbac319f-1453-49e1-9c18-cff2925a2fba", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349229065093, "event_message": " done"}	 done	2024-09-03 07:40:29.065093
fd31fce0-8fed-4ab5-95a5-ec6c5a53d314	{"id": "fd31fce0-8fed-4ab5-95a5-ec6c5a53d314", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:40.240055783Z", "error_severity": "LOG"}}, "timestamp": 1725349240240055, "event_message": "172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres LOG:  logical decoding found consistent point at 0/1A0AB30"}	172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres LOG:  logical decoding found consistent point at 0/1A0AB30	2024-09-03 07:40:40.240055
f8a36655-2a44-4745-bb2a-82700d1f4c22	{"id": "f8a36655-2a44-4745-bb2a-82700d1f4c22", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240088, "event_message": "172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres STATEMENT:  CREATE_REPLICATION_SLOT cainophile_76vuj5c2 TEMPORARY LOGICAL pgoutput NOEXPORT_SNAPSHOT"}	172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres STATEMENT:  CREATE_REPLICATION_SLOT cainophile_76vuj5c2 TEMPORARY LOGICAL pgoutput NOEXPORT_SNAPSHOT	2024-09-03 07:40:40.240088
6ddd3fbe-4947-49ee-b218-c75c17ccb8d1	{"id": "6ddd3fbe-4947-49ee-b218-c75c17ccb8d1", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:40.240682043Z", "error_severity": "LOG"}}, "timestamp": 1725349240240682, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  logical decoding found initial starting point at 0/1A05F40"}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  logical decoding found initial starting point at 0/1A05F40	2024-09-03 07:40:40.240682
e1a076f7-223f-4f86-87cb-15b3ae75900a	{"id": "e1a076f7-223f-4f86-87cb-15b3ae75900a", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:40.240760453Z", "error_severity": "LOG"}}, "timestamp": 1725349240240760, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  logical decoding found consistent point at 0/1A0AB30"}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  logical decoding found consistent point at 0/1A0AB30	2024-09-03 07:40:40.24076
022cc36e-c194-4dcd-aa07-f1c0305b6a70	{"id": "022cc36e-c194-4dcd-aa07-f1c0305b6a70", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859347, "event_message": "---------------"}	---------------	2024-09-03 07:40:28.859347
88c52536-de38-44ca-babc-93c59364ef42	{"id": "88c52536-de38-44ca-babc-93c59364ef42", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349228859355, "event_message": "(1 row)"}	(1 row)	2024-09-03 07:40:28.859355
4cd37996-1f89-4259-8483-c3dfd64f8ffa	{"id": "4cd37996-1f89-4259-8483-c3dfd64f8ffa", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.866090966Z", "error_severity": "FATAL"}}, "timestamp": 1725349228866090, "event_message": " 2024-09-03 07:40:28.865 UTC [62] FATAL:  terminating background worker \\"TimescaleDB Background Worker Launcher\\" due to administrator command"}	 2024-09-03 07:40:28.865 UTC [62] FATAL:  terminating background worker "TimescaleDB Background Worker Launcher" due to administrator command	2024-09-03 07:40:28.86609
70e0a59d-275c-40fa-923a-12e2a380bed2	{"id": "70e0a59d-275c-40fa-923a-12e2a380bed2", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.868266958Z", "error_severity": "LOG"}}, "timestamp": 1725349228868266, "event_message": " 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker \\"logical replication launcher\\" (PID 65) exited with exit code 1"}	 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker "logical replication launcher" (PID 65) exited with exit code 1	2024-09-03 07:40:28.868266
30163048-992d-4815-b90b-1a6464666085	{"id": "30163048-992d-4815-b90b-1a6464666085", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.212370962Z", "error_severity": "LOG"}}, "timestamp": 1725349229212370, "event_message": " 2024-09-03 07:40:29.212 UTC [10] LOG:  database system is ready to accept connections"}	 2024-09-03 07:40:29.212 UTC [10] LOG:  database system is ready to accept connections	2024-09-03 07:40:29.21237
4e1db77c-9e34-4ee3-862b-b9a3c18743df	{"id": "4e1db77c-9e34-4ee3-862b-b9a3c18743df", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.220197910Z", "error_severity": "LOG"}}, "timestamp": 1725349229220197, "event_message": " 2024-09-03 07:40:29.219 UTC [166] LOG:  pg_cron scheduler started"}	 2024-09-03 07:40:29.219 UTC [166] LOG:  pg_cron scheduler started	2024-09-03 07:40:29.220197
696db664-9150-442e-ab95-796bf6328a58	{"id": "696db664-9150-442e-ab95-796bf6328a58", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:30.182938043Z", "error_severity": "ERROR"}}, "timestamp": 1725349230182938, "event_message": "172.19.0.8 2024-09-03 07:40:30.182 UTC [173] supabase_admin@postgres ERROR:  relation \\"tenants\\" does not exist at character 297"}	172.19.0.8 2024-09-03 07:40:30.182 UTC [173] supabase_admin@postgres ERROR:  relation "tenants" does not exist at character 297	2024-09-03 07:40:30.182938
2552ff9a-d9b2-4a2d-aa9b-99f1f6fdb357	{"id": "2552ff9a-d9b2-4a2d-aa9b-99f1f6fdb357", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349230182958, "event_message": "172.19.0.8 2024-09-03 07:40:30.182 UTC [173] supabase_admin@postgres STATEMENT:  SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1)"}	172.19.0.8 2024-09-03 07:40:30.182 UTC [173] supabase_admin@postgres STATEMENT:  SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1)	2024-09-03 07:40:30.182958
020ef2bd-3915-4e2b-9bc9-68baee878dd9	{"id": "020ef2bd-3915-4e2b-9bc9-68baee878dd9", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:40.234682397Z", "error_severity": "LOG"}}, "timestamp": 1725349240234682, "event_message": "172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres LOG:  logical decoding found initial starting point at 0/1A05F40"}	172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres LOG:  logical decoding found initial starting point at 0/1A05F40	2024-09-03 07:40:40.234682
69772f70-ceb0-4d76-a595-680fa3982499	{"id": "69772f70-ceb0-4d76-a595-680fa3982499", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240234718, "event_message": "172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres DETAIL:  Waiting for transactions (approximately 1) older than 1138 to end."}	172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres DETAIL:  Waiting for transactions (approximately 1) older than 1138 to end.	2024-09-03 07:40:40.234718
b1ad44d1-b801-4da2-ac06-33363106ed09	{"id": "b1ad44d1-b801-4da2-ac06-33363106ed09", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240234722, "event_message": "172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres STATEMENT:  CREATE_REPLICATION_SLOT cainophile_76vuj5c2 TEMPORARY LOGICAL pgoutput NOEXPORT_SNAPSHOT"}	172.19.0.3 2024-09-03 07:40:40.234 UTC [223] supabase_admin@postgres STATEMENT:  CREATE_REPLICATION_SLOT cainophile_76vuj5c2 TEMPORARY LOGICAL pgoutput NOEXPORT_SNAPSHOT	2024-09-03 07:40:40.234722
3bd1ea5c-e2e8-4297-8c5c-067b224fd1a1	{"id": "3bd1ea5c-e2e8-4297-8c5c-067b224fd1a1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349229065135, "event_message": "server stopped"}	server stopped	2024-09-03 07:40:29.065135
0cfb5394-c7e5-4df6-9173-be455f3549a2	{"id": "0cfb5394-c7e5-4df6-9173-be455f3549a2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240084, "event_message": "172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres DETAIL:  There are no running transactions."}	172.19.0.3 2024-09-03 07:40:40.239 UTC [223] supabase_admin@postgres DETAIL:  There are no running transactions.	2024-09-03 07:40:40.240084
49200d26-83b0-4c93-9159-826b3d9d0056	{"id": "49200d26-83b0-4c93-9159-826b3d9d0056", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240652, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '\\"logflare_pub\\"')"}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '"logflare_pub"')	2024-09-03 07:40:40.240652
e37fc584-0ffb-4b8d-af7d-791996abddc3	{"id": "e37fc584-0ffb-4b8d-af7d-791996abddc3", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.865993106Z", "error_severity": "LOG"}}, "timestamp": 1725349228865993, "event_message": " 2024-09-03 07:40:28.865 UTC [53] LOG:  aborting any active transactions"}	 2024-09-03 07:40:28.865 UTC [53] LOG:  aborting any active transactions	2024-09-03 07:40:28.865993
84464486-07c5-489f-babd-d5aa9c78812b	{"id": "84464486-07c5-489f-babd-d5aa9c78812b", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.866071756Z", "error_severity": "LOG"}}, "timestamp": 1725349228866071, "event_message": " 2024-09-03 07:40:28.865 UTC [64] LOG:  pg_cron scheduler shutting down"}	 2024-09-03 07:40:28.865 UTC [64] LOG:  pg_cron scheduler shutting down	2024-09-03 07:40:28.866071
dab3ffd3-656b-4df2-917a-94c51e21f1ca	{"id": "dab3ffd3-656b-4df2-917a-94c51e21f1ca", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.868685409Z", "error_severity": "LOG"}}, "timestamp": 1725349228868685, "event_message": " 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker \\"pg_cron launcher\\" (PID 64) exited with exit code 1"}	 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker "pg_cron launcher" (PID 64) exited with exit code 1	2024-09-03 07:40:28.868685
3385fa4f-57d4-4bc1-a102-e33cd5293dfb	{"id": "3385fa4f-57d4-4bc1-a102-e33cd5293dfb", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.869075399Z", "error_severity": "LOG"}}, "timestamp": 1725349228869075, "event_message": " 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker \\"TimescaleDB Background Worker Launcher\\" (PID 62) exited with exit code 1"}	 2024-09-03 07:40:28.868 UTC [53] LOG:  background worker "TimescaleDB Background Worker Launcher" (PID 62) exited with exit code 1	2024-09-03 07:40:28.869075
263401fc-82bd-4dac-9db3-0a162fc7def1	{"id": "263401fc-82bd-4dac-9db3-0a162fc7def1", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.873669404Z", "error_severity": "LOG"}}, "timestamp": 1725349228873669, "event_message": " 2024-09-03 07:40:28.873 UTC [53] LOG:  background worker \\"pg_net 0.8.0 worker\\" (PID 63) exited with exit code 1"}	 2024-09-03 07:40:28.873 UTC [53] LOG:  background worker "pg_net 0.8.0 worker" (PID 63) exited with exit code 1	2024-09-03 07:40:28.873669
75c94b58-7eee-43c3-94c0-d3b9929040a0	{"id": "75c94b58-7eee-43c3-94c0-d3b9929040a0", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.873886304Z", "error_severity": "LOG"}}, "timestamp": 1725349228873886, "event_message": " 2024-09-03 07:40:28.873 UTC [57] LOG:  shutting down"}	 2024-09-03 07:40:28.873 UTC [57] LOG:  shutting down	2024-09-03 07:40:28.873886
c13c2e1a-a6d5-482f-8944-52fd5e0d68de	{"id": "c13c2e1a-a6d5-482f-8944-52fd5e0d68de", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.876137626Z", "error_severity": "LOG"}}, "timestamp": 1725349228876137, "event_message": " 2024-09-03 07:40:28.876 UTC [57] LOG:  checkpoint starting: shutdown immediate"}	 2024-09-03 07:40:28.876 UTC [57] LOG:  checkpoint starting: shutdown immediate	2024-09-03 07:40:28.876137
d6407771-98ed-4e06-a137-f741e3050798	{"id": "d6407771-98ed-4e06-a137-f741e3050798", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:28.945262625Z", "error_severity": "LOG"}}, "timestamp": 1725349228945262, "event_message": " 2024-09-03 07:40:28.945 UTC [57] LOG:  checkpoint complete: wrote 362 buffers (2.2%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.014 s, sync=0.048 s, total=0.072 s; sync files=213, longest=0.012 s, average=0.001 s; distance=2997 kB, estimate=2997 kB"}	 2024-09-03 07:40:28.945 UTC [57] LOG:  checkpoint complete: wrote 362 buffers (2.2%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.014 s, sync=0.048 s, total=0.072 s; sync files=213, longest=0.012 s, average=0.001 s; distance=2997 kB, estimate=2997 kB	2024-09-03 07:40:28.945262
16b689d7-5b53-419a-8ee1-c5844ee17c96	{"id": "16b689d7-5b53-419a-8ee1-c5844ee17c96", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.196101396Z", "error_severity": "LOG"}}, "timestamp": 1725349229196101, "event_message": " 2024-09-03 07:40:29.195 UTC [10] LOG:  listening on Unix socket \\"/var/run/postgresql/.s.PGSQL.5432\\""}	 2024-09-03 07:40:29.195 UTC [10] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"	2024-09-03 07:40:29.196101
8e797c3f-4131-4498-82e1-f40622ca7a85	{"id": "8e797c3f-4131-4498-82e1-f40622ca7a85", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.202999763Z", "error_severity": "LOG"}}, "timestamp": 1725349229202999, "event_message": " 2024-09-03 07:40:29.202 UTC [161] LOG:  database system was shut down at 2024-09-03 07:40:28 UTC"}	 2024-09-03 07:40:29.202 UTC [161] LOG:  database system was shut down at 2024-09-03 07:40:28 UTC	2024-09-03 07:40:29.202999
d25cf891-2108-444e-a480-3b5b4bb99fec	{"id": "d25cf891-2108-444e-a480-3b5b4bb99fec", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:29.212351332Z", "error_severity": "LOG"}}, "timestamp": 1725349229212351, "event_message": " 2024-09-03 07:40:29.212 UTC [164] LOG:  TimescaleDB background worker launcher connected to shared catalogs"}	 2024-09-03 07:40:29.212 UTC [164] LOG:  TimescaleDB background worker launcher connected to shared catalogs	2024-09-03 07:40:29.212351
d07c9f89-e77c-426c-aea3-e8f63c0a491d	{"id": "d07c9f89-e77c-426c-aea3-e8f63c0a491d", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:40.240598103Z", "error_severity": "LOG"}}, "timestamp": 1725349240240598, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  starting logical decoding for slot \\"cainophile_76vuj5c2\\""}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres LOG:  starting logical decoding for slot "cainophile_76vuj5c2"	2024-09-03 07:40:40.240598
2f3d908a-27f6-4236-8862-dc7da58f0f84	{"id": "2f3d908a-27f6-4236-8862-dc7da58f0f84", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240628, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  Streaming transactions committing after 0/1A0AB68, reading WAL from 0/1A05E50."}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  Streaming transactions committing after 0/1A0AB68, reading WAL from 0/1A05E50.	2024-09-03 07:40:40.240628
5aaf1dd8-f11a-453a-8c76-a9326e0d82b2	{"id": "5aaf1dd8-f11a-453a-8c76-a9326e0d82b2", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240697, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  Waiting for transactions (approximately 1) older than 1138 to end."}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  Waiting for transactions (approximately 1) older than 1138 to end.	2024-09-03 07:40:40.240697
47abedd1-f97a-4bf2-b4bc-22acc0b929a6	{"id": "47abedd1-f97a-4bf2-b4bc-22acc0b929a6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240772, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  There are no running transactions."}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres DETAIL:  There are no running transactions.	2024-09-03 07:40:40.240772
ba4b4371-563d-4f95-b4f9-ee0f3abb0387	{"id": "ba4b4371-563d-4f95-b4f9-ee0f3abb0387", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255744186, "event_message": "172.19.0.13 2024-09-03 07:40:55.743 UTC [271] postgres@postgres STATEMENT:  "}	172.19.0.13 2024-09-03 07:40:55.743 UTC [271] postgres@postgres STATEMENT:  	2024-09-03 07:40:55.744186
847888fa-7b4b-4c1f-b084-9c05c9b73c24	{"id": "847888fa-7b4b-4c1f-b084-9c05c9b73c24", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255744218, "event_message": "\\t-- date: 2024-09-03T07:40:55.713Z"}	\t-- date: 2024-09-03T07:40:55.713Z	2024-09-03 07:40:55.744218
4270b291-c124-4481-8388-8649f7c54f6e	{"id": "4270b291-c124-4481-8388-8649f7c54f6e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255766323, "event_message": "172.19.0.13 2024-09-03 07:40:55.766 UTC [276] postgres@postgres STATEMENT:  "}	172.19.0.13 2024-09-03 07:40:55.766 UTC [276] postgres@postgres STATEMENT:  	2024-09-03 07:40:55.766323
0c0e7c03-1e6f-4fee-815c-e4d60ce74da6	{"id": "0c0e7c03-1e6f-4fee-815c-e4d60ce74da6", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255766333, "event_message": "\\t-- date: 2024-09-03T07:40:55.746Z"}	\t-- date: 2024-09-03T07:40:55.746Z	2024-09-03 07:40:55.766333
73e00ee9-0cf3-4988-803f-4a70e2d80a9a	{"id": "73e00ee9-0cf3-4988-803f-4a70e2d80a9a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240701, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '\\"logflare_pub\\"')"}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '"logflare_pub"')	2024-09-03 07:40:40.240701
905883ab-d1cd-4094-80f9-889a3d24623f	{"id": "905883ab-d1cd-4094-80f9-889a3d24623f", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349240240777, "event_message": "172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '\\"logflare_pub\\"')"}	172.19.0.3 2024-09-03 07:40:40.240 UTC [223] supabase_admin@postgres STATEMENT:  START_REPLICATION SLOT cainophile_76vuj5c2 LOGICAL 0/0 (proto_version '1', publication_names '"logflare_pub"')	2024-09-03 07:40:40.240777
ddbbbb89-69fe-43d2-b487-6eab9e86c213	{"id": "ddbbbb89-69fe-43d2-b487-6eab9e86c213", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255744192, "event_message": "\\t-- source: dashboard"}	\t-- source: dashboard	2024-09-03 07:40:55.744192
498cd506-2440-4958-892f-05e76976f43a	{"id": "498cd506-2440-4958-892f-05e76976f43a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255744224, "event_message": "\\twith _temp as (select * from public.schema_migrations limit 100 offset 0) select *, case when length(\\"version\\"::text) > 10240 then concat(left(\\"version\\"::text, 10240), '...') else \\"version\\"::text end \\"version\\" from _temp"}	\twith _temp as (select * from public.schema_migrations limit 100 offset 0) select *, case when length("version"::text) > 10240 then concat(left("version"::text, 10240), '...') else "version"::text end "version" from _temp	2024-09-03 07:40:55.744224
88c3d01c-8c5f-4c10-94f4-0bb673777476	{"id": "88c3d01c-8c5f-4c10-94f4-0bb673777476", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255766327, "event_message": "\\t-- source: dashboard"}	\t-- source: dashboard	2024-09-03 07:40:55.766327
6d265d4d-be5c-450c-a61b-39f8c373f363	{"id": "6d265d4d-be5c-450c-a61b-39f8c373f363", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255766339, "event_message": "\\tselect (select count(*) from public.schema_migrations), false as is_estimate;"}	\tselect (select count(*) from public.schema_migrations), false as is_estimate;	2024-09-03 07:40:55.766339
0217e3e5-ed21-4c90-b69a-ba08bed70cf4	{"id": "0217e3e5-ed21-4c90-b69a-ba08bed70cf4", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:42.853697526Z", "error_severity": "WARNING"}}, "timestamp": 1725349242853697, "event_message": "172.19.0.1 2024-09-03 07:40:42.853 UTC [191] postgres@postgres WARNING:  SET LOCAL can only be used in transaction blocks"}	172.19.0.1 2024-09-03 07:40:42.853 UTC [191] postgres@postgres WARNING:  SET LOCAL can only be used in transaction blocks	2024-09-03 07:40:42.853697
9964eb52-74f6-4850-a02e-7d1e7d4bdb3c	{"id": "9964eb52-74f6-4850-a02e-7d1e7d4bdb3c", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:55.744149023Z", "error_severity": "ERROR"}}, "timestamp": 1725349255744149, "event_message": "172.19.0.13 2024-09-03 07:40:55.743 UTC [271] postgres@postgres ERROR:  relation \\"public.schema_migrations\\" does not exist at character 106"}	172.19.0.13 2024-09-03 07:40:55.743 UTC [271] postgres@postgres ERROR:  relation "public.schema_migrations" does not exist at character 106	2024-09-03 07:40:55.744149
2f25ba61-def6-4204-95ba-c05dcf64ae08	{"id": "2f25ba61-def6-4204-95ba-c05dcf64ae08", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255744198, "event_message": "\\t-- user: self host"}	\t-- user: self host	2024-09-03 07:40:55.744198
4e71bda3-0ae5-43b4-b3f5-864542fd19ff	{"id": "4e71bda3-0ae5-43b4-b3f5-864542fd19ff", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:55.766290065Z", "error_severity": "ERROR"}}, "timestamp": 1725349255766290, "event_message": "172.19.0.13 2024-09-03 07:40:55.766 UTC [276] postgres@postgres ERROR:  relation \\"public.schema_migrations\\" does not exist at character 106"}	172.19.0.13 2024-09-03 07:40:55.766 UTC [276] postgres@postgres ERROR:  relation "public.schema_migrations" does not exist at character 106	2024-09-03 07:40:55.76629
8b04ec5c-730f-4651-a00d-b60b4c62f515	{"id": "8b04ec5c-730f-4651-a00d-b60b4c62f515", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349255766331, "event_message": "\\t-- user: self host"}	\t-- user: self host	2024-09-03 07:40:55.766331
4b5659a1-fb98-4aac-a7aa-0eaa6104e3d4	{"id": "4b5659a1-fb98-4aac-a7aa-0eaa6104e3d4", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789481, "event_message": "  LC_TIME:     en_US.UTF-8"}	  LC_TIME:     en_US.UTF-8	2024-09-03 07:40:25.789481
9a80c138-c7d6-4a10-b45b-56bbfe6f3028	{"id": "9a80c138-c7d6-4a10-b45b-56bbfe6f3028", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225788992, "event_message": "This user must also own the server process."}	This user must also own the server process.	2024-09-03 07:40:25.788992
b51cc05d-f90d-4798-b497-32b0130fc00a	{"id": "b51cc05d-f90d-4798-b497-32b0130fc00a", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789489, "event_message": "The default text search configuration will be set to \\"english\\"."}	The default text search configuration will be set to "english".	2024-09-03 07:40:25.789489
b85f3b87-01b3-422f-a686-e276b1bc33de	{"id": "b85f3b87-01b3-422f-a686-e276b1bc33de", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789497, "event_message": "Data page checksums are disabled."}	Data page checksums are disabled.	2024-09-03 07:40:25.789497
e42def9b-30b1-4c3c-b59d-c01db770089e	{"id": "e42def9b-30b1-4c3c-b59d-c01db770089e", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789457, "event_message": "  LC_COLLATE:  C.UTF-8"}	  LC_COLLATE:  C.UTF-8	2024-09-03 07:40:25.789457
b38d66b3-9750-40b5-8e09-e9e6ca9a96d0	{"id": "b38d66b3-9750-40b5-8e09-e9e6ca9a96d0", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789460, "event_message": "  LC_CTYPE:    en_US.UTF-8"}	  LC_CTYPE:    en_US.UTF-8	2024-09-03 07:40:25.78946
ed2ad782-a2a4-4c57-ac86-dbde32b9f481	{"id": "ed2ad782-a2a4-4c57-ac86-dbde32b9f481", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789464, "event_message": "  LC_MESSAGES: en_US.UTF-8"}	  LC_MESSAGES: en_US.UTF-8	2024-09-03 07:40:25.789464
4292b4b3-ad5d-4914-8fec-af8b5669dc73	{"id": "4292b4b3-ad5d-4914-8fec-af8b5669dc73", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349225789467, "event_message": "  LC_MONETARY: en_US.UTF-8"}	  LC_MONETARY: en_US.UTF-8	2024-09-03 07:40:25.789467
7f0df1b2-55b3-4160-a840-dcc5d27cabda	{"id": "7f0df1b2-55b3-4160-a840-dcc5d27cabda", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226681001, "event_message": "initdb: warning: enabling \\"trust\\" authentication for local connections"}	initdb: warning: enabling "trust" authentication for local connections	2024-09-03 07:40:26.681001
4c6903b7-3f77-490c-9da6-55116a5ca9e1	{"id": "4c6903b7-3f77-490c-9da6-55116a5ca9e1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226681023, "event_message": "initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb."}	initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.	2024-09-03 07:40:26.681023
e05fa77f-6342-4fe8-9c0d-ceebf308a197	{"id": "e05fa77f-6342-4fe8-9c0d-ceebf308a197", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.755385766Z", "error_severity": "LOG"}}, "timestamp": 1725349226755385, "event_message": "waiting for server to start.... 2024-09-03 07:40:26.755 UTC [53] LOG:  pgaudit extension initialized"}	waiting for server to start.... 2024-09-03 07:40:26.755 UTC [53] LOG:  pgaudit extension initialized	2024-09-03 07:40:26.755385
da3a732d-ef63-45c6-ae9f-562616afa302	{"id": "da3a732d-ef63-45c6-ae9f-562616afa302", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.770262311Z", "error_severity": "LOG"}}, "timestamp": 1725349226770262, "event_message": " 2024-09-03 07:40:26.770 UTC [53] LOG:  pgsodium primary server secret key loaded"}	 2024-09-03 07:40:26.770 UTC [53] LOG:  pgsodium primary server secret key loaded	2024-09-03 07:40:26.770262
d9001657-186f-41e1-87a3-664070bd3692	{"id": "d9001657-186f-41e1-87a3-664070bd3692", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.840100231Z", "error_severity": "LOG"}}, "timestamp": 1725349226840100, "event_message": " 2024-09-03 07:40:26.839 UTC [53] LOG:  starting PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	 2024-09-03 07:40:26.839 UTC [53] LOG:  starting PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:26.8401
489e97d0-0280-4d97-8acb-f5d8fc2f5c21	{"id": "489e97d0-0280-4d97-8acb-f5d8fc2f5c21", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.848945139Z", "error_severity": "LOG"}}, "timestamp": 1725349226848945, "event_message": " 2024-09-03 07:40:26.848 UTC [53] LOG:  listening on Unix socket \\"/var/run/postgresql/.s.PGSQL.5432\\""}	 2024-09-03 07:40:26.848 UTC [53] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"	2024-09-03 07:40:26.848945
712f0ddc-e15e-483c-92a0-a5e06536c6fe	{"id": "712f0ddc-e15e-483c-92a0-a5e06536c6fe", "appname": "supabase_db_brancher", "project": "default", "metadata": {"host": "db-default", "parsed": {"timestamp": "2024-09-03T07:40:26.861438672Z", "error_severity": "LOG"}}, "timestamp": 1725349226861438, "event_message": " 2024-09-03 07:40:26.861 UTC [59] LOG:  database system was shut down at 2024-09-03 07:40:26 UTC"}	 2024-09-03 07:40:26.861 UTC [59] LOG:  database system was shut down at 2024-09-03 07:40:26 UTC	2024-09-03 07:40:26.861438
e5ae1944-6dcf-416c-b5db-dc9c64b3cfaf	{"id": "e5ae1944-6dcf-416c-b5db-dc9c64b3cfaf", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226989180, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:26.98918
b67949f4-c795-4f73-a926-3347d5b6ddbf	{"id": "b67949f4-c795-4f73-a926-3347d5b6ddbf", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349226990324, "event_message": "ALTER ROLE"}	ALTER ROLE	2024-09-03 07:40:26.990324
7ba787e8-2e38-4509-b895-55cb0f98c76d	{"id": "7ba787e8-2e38-4509-b895-55cb0f98c76d", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227048797, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.048797
f4f66e35-9dbb-4fe6-864d-c13bceb9335c	{"id": "f4f66e35-9dbb-4fe6-864d-c13bceb9335c", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227049954, "event_message": "CREATE ROLE"}	CREATE ROLE	2024-09-03 07:40:27.049954
b1779d21-ad8c-446b-a579-6a876b725192	{"id": "b1779d21-ad8c-446b-a579-6a876b725192", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227051086, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:27.051086
02386ca4-dc5f-4e47-b0fd-4d617f098fb1	{"id": "02386ca4-dc5f-4e47-b0fd-4d617f098fb1", "appname": "supabase_db_brancher", "project": "default", "timestamp": 1725349227052103, "event_message": "GRANT ROLE"}	GRANT ROLE	2024-09-03 07:40:27.052103
\.


--
-- Data for Name: log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4 (id, body, event_message, "timestamp") FROM stdin;
f9a508f1-9e33-4008-a8dd-b9790b05637a	{"id": "f9a508f1-9e33-4008-a8dd-b9790b05637a", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349227752409, "event_message": "Postgrex.Protocol (#PID<0.3112.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3112.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:27.752409
e978da1b-b199-4ef0-96fd-d35d48a0be48	{"id": "e978da1b-b199-4ef0-96fd-d35d48a0be48", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349227975652, "event_message": "Postgrex.Protocol (#PID<0.3114.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3114.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:27.975652
e0fd2867-8c99-48fb-9d63-17a39cb81934	{"id": "e0fd2867-8c99-48fb-9d63-17a39cb81934", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349228095501, "event_message": "Postgrex.Protocol (#PID<0.3113.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3113.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:28.095501
f26acedd-dd89-461d-8ec0-e9eddc2b13b0	{"id": "f26acedd-dd89-461d-8ec0-e9eddc2b13b0", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349228864499, "event_message": "Postgrex.Protocol (#PID<0.3108.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3108.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:28.864499
1a40b500-e7f4-45c2-88bb-346ed7d6493c	{"id": "1a40b500-e7f4-45c2-88bb-346ed7d6493c", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349229051563, "event_message": "Postgrex.Protocol (#PID<0.3109.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3109.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:29.051563
5253a1cc-13d5-4d6e-9e78-b2c0c65e2ee9	{"id": "5253a1cc-13d5-4d6e-9e78-b2c0c65e2ee9", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230182465, "event_message": "07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [info] HEAD /api/ping"}	07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [info] HEAD /api/ping	2024-09-03 07:40:30.182465
83160c5d-ba15-4471-9476-252da07105c0	{"id": "83160c5d-ba15-4471-9476-252da07105c0", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230182498, "event_message": "07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:40:30.182498
af5a7ad7-066d-45e0-97bb-cce28904aafc	{"id": "af5a7ad7-066d-45e0-97bb-cce28904aafc", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230182501, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:40:30.182501
bfd3b349-4da9-4b9e-95c9-c3582d5b0f02	{"id": "bfd3b349-4da9-4b9e-95c9-c3582d5b0f02", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230182503, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:40:30.182503
febe6086-f8a2-43e2-8313-7ef2349169a0	{"id": "febe6086-f8a2-43e2-8313-7ef2349169a0", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230182505, "event_message": "07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:40:30.182 request_id=F_Gr-8p_O6LXLeUAABIB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:40:30.182505
56cb8833-0d0a-491d-9e7e-92d1bf965b51	{"id": "56cb8833-0d0a-491d-9e7e-92d1bf965b51", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184866, "event_message": "        (ecto_sql 3.11.1) lib/ecto/adapters/sql.ex:952: Ecto.Adapters.SQL.execute/6"}	        (ecto_sql 3.11.1) lib/ecto/adapters/sql.ex:952: Ecto.Adapters.SQL.execute/6	2024-09-03 07:40:30.184866
57d283e0-aca6-47f6-82ed-05b4d726c8e3	{"id": "57d283e0-aca6-47f6-82ed-05b4d726c8e3", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184869, "event_message": "        (ecto 3.11.2) lib/ecto/repo/queryable.ex:232: Ecto.Repo.Queryable.execute/4"}	        (ecto 3.11.2) lib/ecto/repo/queryable.ex:232: Ecto.Repo.Queryable.execute/4	2024-09-03 07:40:30.184869
c6e043a8-ea89-4f15-9524-ae3d0d311c4c	{"id": "c6e043a8-ea89-4f15-9524-ae3d0d311c4c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184872, "event_message": "        (ecto 3.11.2) lib/ecto/repo/queryable.ex:19: Ecto.Repo.Queryable.all/3"}	        (ecto 3.11.2) lib/ecto/repo/queryable.ex:19: Ecto.Repo.Queryable.all/3	2024-09-03 07:40:30.184872
1bb034b7-5144-435b-ba3e-8995c3d382fb	{"id": "1bb034b7-5144-435b-ba3e-8995c3d382fb", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240223186, "event_message": "07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:40:40.223186
16a57a01-b928-4534-9889-c9d2409312f7	{"id": "16a57a01-b928-4534-9889-c9d2409312f7", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240225543, "event_message": "07:40:40.225 request_id=F_Gr_iD4rd4MdWcAABJB [debug] QUERY OK source=\\"tenants\\" db=1.8ms idle=1743.8ms"}	07:40:40.225 request_id=F_Gr_iD4rd4MdWcAABJB [debug] QUERY OK source="tenants" db=1.8ms idle=1743.8ms	2024-09-03 07:40:40.225543
b3f4d8e6-0f7f-45be-b3ea-c2bf67ea75d8	{"id": "b3f4d8e6-0f7f-45be-b3ea-c2bf67ea75d8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230183326, "event_message": "07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [debug] QUERY ERROR source=\\"tenants\\" db=0.6ms idle=284.8ms"}	07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [debug] QUERY ERROR source="tenants" db=0.6ms idle=284.8ms	2024-09-03 07:40:30.183326
af7ae8e8-1fb8-4143-b70e-1683e94c67eb	{"id": "af7ae8e8-1fb8-4143-b70e-1683e94c67eb", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230183353, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:40:30.183353
b062744d-b38b-462a-adaa-d818c085bcfa	{"id": "b062744d-b38b-462a-adaa-d818c085bcfa", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349225479900, "event_message": "Postgrex.Protocol (#PID<0.3112.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed"}	Postgrex.Protocol (#PID<0.3112.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed	2024-09-03 07:40:25.4799
ed4e465b-2a35-47a5-aaf8-010e73a8be5b	{"id": "ed4e465b-2a35-47a5-aaf8-010e73a8be5b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230183511, "event_message": "07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [debug] Converted error Postgrex.Error to 500 response"}	07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [debug] Converted error Postgrex.Error to 500 response	2024-09-03 07:40:30.183511
bbf707d9-0358-474e-9a6c-0c0dc0073e49	{"id": "bbf707d9-0358-474e-9a6c-0c0dc0073e49", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349230184808, "event_message": "#PID<0.3437.0> running RealtimeWeb.Endpoint (connection #PID<0.3436.0>, stream id 1) terminated"}	#PID<0.3437.0> running RealtimeWeb.Endpoint (connection #PID<0.3436.0>, stream id 1) terminated	2024-09-03 07:40:30.184808
0e1f55cd-7965-433a-9eb2-b2dc0086f82d	{"id": "0e1f55cd-7965-433a-9eb2-b2dc0086f82d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184852, "event_message": "Server: realtime-dev:80 (http)"}	Server: realtime-dev:80 (http)	2024-09-03 07:40:30.184852
705e790d-d4e7-4688-b50e-d47bdc4eb301	{"id": "705e790d-d4e7-4688-b50e-d47bdc4eb301", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184856, "event_message": "Request: HEAD /api/ping"}	Request: HEAD /api/ping	2024-09-03 07:40:30.184856
003b5053-d56d-4747-8d1b-6a8fccf456e2	{"id": "003b5053-d56d-4747-8d1b-6a8fccf456e2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184858, "event_message": "** (exit) an exception was raised:"}	** (exit) an exception was raised:	2024-09-03 07:40:30.184858
80e52cdf-5257-4028-90fb-3320b0c25996	{"id": "80e52cdf-5257-4028-90fb-3320b0c25996", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184861, "event_message": "    ** (Postgrex.Error) ERROR 42P01 (undefined_table) relation \\"tenants\\" does not exist"}	    ** (Postgrex.Error) ERROR 42P01 (undefined_table) relation "tenants" does not exist	2024-09-03 07:40:30.184861
fe4b9310-b50f-46ec-940d-29f4fa53c92d	{"id": "fe4b9310-b50f-46ec-940d-29f4fa53c92d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240223177, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:40:40.223177
c4dfdb41-3cc0-420c-bd5e-40aeb13f1e23	{"id": "c4dfdb41-3cc0-420c-bd5e-40aeb13f1e23", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240223182, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:40:40.223182
b97fab27-72d0-4aa8-a39b-cbb55e5956c9	{"id": "b97fab27-72d0-4aa8-a39b-cbb55e5956c9", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184874, "event_message": "        (ecto 3.11.2) lib/ecto/repo/queryable.ex:154: Ecto.Repo.Queryable.one/3"}	        (ecto 3.11.2) lib/ecto/repo/queryable.ex:154: Ecto.Repo.Queryable.one/3	2024-09-03 07:40:30.184874
1e9e80b4-36e6-4bc2-8e8b-9f549851f163	{"id": "1e9e80b4-36e6-4bc2-8e8b-9f549851f163", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184877, "event_message": "        (realtime 2.29.15) lib/realtime/api.ex:172: Realtime.Api.get_tenant_by_external_id/2"}	        (realtime 2.29.15) lib/realtime/api.ex:172: Realtime.Api.get_tenant_by_external_id/2	2024-09-03 07:40:30.184877
6c87463e-ea9b-4923-92f2-5160b23f8446	{"id": "6c87463e-ea9b-4923-92f2-5160b23f8446", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184880, "event_message": "        (realtime 2.29.15) lib/realtime_web/plugs/assign_tenant.ex:23: RealtimeWeb.Plugs.AssignTenant.call/2"}	        (realtime 2.29.15) lib/realtime_web/plugs/assign_tenant.ex:23: RealtimeWeb.Plugs.AssignTenant.call/2	2024-09-03 07:40:30.18488
f0d2efae-ebe9-48de-8cb7-24fe7c66b8e0	{"id": "f0d2efae-ebe9-48de-8cb7-24fe7c66b8e0", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184883, "event_message": "        (realtime 2.29.15) RealtimeWeb.Router.tenant_api/2"}	        (realtime 2.29.15) RealtimeWeb.Router.tenant_api/2	2024-09-03 07:40:30.184883
6c1c4304-1b6e-44d5-a4aa-200187910fb5	{"id": "6c1c4304-1b6e-44d5-a4aa-200187910fb5", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240223131, "event_message": "07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [info] HEAD /api/ping"}	07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [info] HEAD /api/ping	2024-09-03 07:40:40.223131
48db713f-d9c5-4239-9564-02b8807f46b2	{"id": "48db713f-d9c5-4239-9564-02b8807f46b2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240223169, "event_message": "07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:40:40.222 request_id=F_Gr_iD4rd4MdWcAABJB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:40:40.223169
e843d0b9-e94d-43be-9ca2-aa5b1ffd1d33	{"id": "e843d0b9-e94d-43be-9ca2-aa5b1ffd1d33", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240225574, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:40:40.225574
00955f48-704a-4a19-8726-e10550212804	{"id": "00955f48-704a-4a19-8726-e10550212804", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240227725, "event_message": "07:40:40.227 request_id=F_Gr_iD4rd4MdWcAABJB [debug] QUERY OK source=\\"extensions\\" db=2.0ms idle=1746.0ms"}	07:40:40.227 request_id=F_Gr_iD4rd4MdWcAABJB [debug] QUERY OK source="extensions" db=2.0ms idle=1746.0ms	2024-09-03 07:40:40.227725
37293906-0c71-490d-b2b4-186388964dfd	{"id": "37293906-0c71-490d-b2b4-186388964dfd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240227745, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:40:40.227745
1dc32430-0922-4fc6-ae87-ada3d2b487f7	{"id": "1dc32430-0922-4fc6-ae87-ada3d2b487f7", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480859, "event_message": "+ ERL_CRASH_DUMP=/tmp/erl_crash.dump"}	+ ERL_CRASH_DUMP=/tmp/erl_crash.dump	2024-09-03 07:40:44.480859
1fb40bba-8bb2-4ef9-996a-7048f79bbcef	{"id": "1fb40bba-8bb2-4ef9-996a-7048f79bbcef", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480977, "event_message": "Running migrations"}	Running migrations	2024-09-03 07:40:44.480977
322fdc28-3309-4516-8492-ec77e70e5971	{"id": "322fdc28-3309-4516-8492-ec77e70e5971", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480999, "event_message": "+ '[' false = true ']'"}	+ '[' false = true ']'	2024-09-03 07:40:44.480999
d7ea54d2-3632-4576-80bc-3538ee64e33c	{"id": "d7ea54d2-3632-4576-80bc-3538ee64e33c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244481007, "event_message": "+ echo 'Running migrations'"}	+ echo 'Running migrations'	2024-09-03 07:40:44.481007
0ed4ec79-78f1-423b-a905-735eef06ba3d	{"id": "0ed4ec79-78f1-423b-a905-735eef06ba3d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244481011, "event_message": "+ sudo -E -u nobody /app/bin/migrate"}	+ sudo -E -u nobody /app/bin/migrate	2024-09-03 07:40:44.481011
6644f419-23b0-4b95-b6f7-775d4de168e2	{"id": "6644f419-23b0-4b95-b6f7-775d4de168e2", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349245310111, "event_message": "Migrations already up"}	Migrations already up	2024-09-03 07:40:45.310111
e63dff41-3fc0-4263-a5aa-983e1fa154da	{"id": "e63dff41-3fc0-4263-a5aa-983e1fa154da", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349245334571, "event_message": "Seeding selfhosted Realtime"}	Seeding selfhosted Realtime	2024-09-03 07:40:45.334571
471a7e6a-ea41-4264-bb88-2436983812ce	{"id": "471a7e6a-ea41-4264-bb88-2436983812ce", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349245334606, "event_message": "+ echo 'Seeding selfhosted Realtime'"}	+ echo 'Seeding selfhosted Realtime'	2024-09-03 07:40:45.334606
2d70a7b2-63c0-42f4-a5d8-68925fb1fe01	{"id": "2d70a7b2-63c0-42f4-a5d8-68925fb1fe01", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349245334610, "event_message": "+ sudo -E -u nobody /app/bin/realtime eval 'Realtime.Release.seeds(Realtime.Repo)'"}	+ sudo -E -u nobody /app/bin/realtime eval 'Realtime.Release.seeds(Realtime.Repo)'	2024-09-03 07:40:45.33461
d1fc3b0e-0db1-44fc-b5b8-568086bae771	{"id": "d1fc3b0e-0db1-44fc-b5b8-568086bae771", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246108679, "event_message": "QUERY OK source=\\"extensions\\" db=5.8ms"}	QUERY OK source="extensions" db=5.8ms	2024-09-03 07:40:46.108679
75a388a2-a106-404c-a100-723bd9e7ec40	{"id": "75a388a2-a106-404c-a100-723bd9e7ec40", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246133447, "event_message": "10000"}	10000	2024-09-03 07:40:46.133447
b565fc79-71bd-4c04-ad0f-93212d3d3222	{"id": "b565fc79-71bd-4c04-ad0f-93212d3d3222", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815256, "event_message": "SYN[realtime@127.0.0.1] Adding node to scope <Elixir.RegionNodes>"}	SYN[realtime@127.0.0.1] Adding node to scope <Elixir.RegionNodes>	2024-09-03 07:40:47.815256
86af068f-efad-4ab0-a196-02e01b07afab	{"id": "86af068f-efad-4ab0-a196-02e01b07afab", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815292, "event_message": "SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.RegionNodes>"}	SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.RegionNodes>	2024-09-03 07:40:47.815292
7b7aaf43-65e3-48d7-811d-fbf5b9e4d8f1	{"id": "7b7aaf43-65e3-48d7-811d-fbf5b9e4d8f1", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815405, "event_message": "SYN[realtime@127.0.0.1|registry<Elixir.RegionNodes>] Discovering the cluster"}	SYN[realtime@127.0.0.1|registry<Elixir.RegionNodes>] Discovering the cluster	2024-09-03 07:40:47.815405
df683180-0fb8-4264-85fa-4270244868c3	{"id": "df683180-0fb8-4264-85fa-4270244868c3", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814577, "event_message": "SYN[realtime@127.0.0.1] Adding node to scope <users>"}	SYN[realtime@127.0.0.1] Adding node to scope <users>	2024-09-03 07:40:47.814577
37c7e958-1732-4740-a05b-d75a83665e44	{"id": "37c7e958-1732-4740-a05b-d75a83665e44", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480850, "event_message": "+ ulimit -Sn 10000"}	+ ulimit -Sn 10000	2024-09-03 07:40:44.48085
652bc62c-be72-4b4a-82b2-f8fe0f01bc34	{"id": "652bc62c-be72-4b4a-82b2-f8fe0f01bc34", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480855, "event_message": "+ export ERL_CRASH_DUMP=/tmp/erl_crash.dump"}	+ export ERL_CRASH_DUMP=/tmp/erl_crash.dump	2024-09-03 07:40:44.480855
8e69ce4b-aa2c-45b5-973d-166345053dba	{"id": "8e69ce4b-aa2c-45b5-973d-166345053dba", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349240228005, "event_message": "07:40:40.227 request_id=F_Gr_iD4rd4MdWcAABJB [info] Sent 200 in 5ms"}	07:40:40.227 request_id=F_Gr_iD4rd4MdWcAABJB [info] Sent 200 in 5ms	2024-09-03 07:40:40.228005
c4544448-85d3-4198-986b-f0b20d526a2a	{"id": "c4544448-85d3-4198-986b-f0b20d526a2a", "appname": "supabase_realtime_brancher", "metadata": {"level": "warning", "project": "default", "external_id": "default"}, "timestamp": 1725349243038750, "event_message": "Elixir.Realtime.SignalHandler: :sigterm received"}	Elixir.Realtime.SignalHandler: :sigterm received	2024-09-03 07:40:43.03875
b31d7fff-c995-461b-a17b-892e0a6ef31b	{"id": "b31d7fff-c995-461b-a17b-892e0a6ef31b", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246059506, "event_message": "QUERY OK source=\\"tenants\\" db=4.9ms"}	QUERY OK source="tenants" db=4.9ms	2024-09-03 07:40:46.059506
9980e3f6-b004-4cd0-8d5f-59df68a9d85a	{"id": "9980e3f6-b004-4cd0-8d5f-59df68a9d85a", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246059554, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:40:46.059554
29d1c8f5-302d-4f47-92b8-9fb66871c993	{"id": "29d1c8f5-302d-4f47-92b8-9fb66871c993", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246081917, "event_message": "QUERY OK source=\\"extensions\\" db=0.8ms"}	QUERY OK source="extensions" db=0.8ms	2024-09-03 07:40:46.081917
504f0043-915d-4f40-8275-e38b79274719	{"id": "504f0043-915d-4f40-8275-e38b79274719", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246081959, "event_message": "DELETE FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) [\\"realtime-dev\\"]"}	DELETE FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ["realtime-dev"]	2024-09-03 07:40:46.081959
7fb6a00b-3066-40fc-9ebe-5c6cbb073312	{"id": "7fb6a00b-3066-40fc-9ebe-5c6cbb073312", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246084840, "event_message": "QUERY OK source=\\"tenants\\" db=0.5ms"}	QUERY OK source="tenants" db=0.5ms	2024-09-03 07:40:46.08484
1c231d10-8011-4c2a-a5d7-99520f253e1b	{"id": "1c231d10-8011-4c2a-a5d7-99520f253e1b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246084863, "event_message": "DELETE FROM \\"tenants\\" WHERE \\"id\\" = $1 [\\"8b0c0c4e-6f97-428b-8619-ed832fbb6d77\\"]"}	DELETE FROM "tenants" WHERE "id" = $1 ["8b0c0c4e-6f97-428b-8619-ed832fbb6d77"]	2024-09-03 07:40:46.084863
9f5001a8-819c-4d5b-b186-13c8f77e20c0	{"id": "9f5001a8-819c-4d5b-b186-13c8f77e20c0", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246101692, "event_message": "QUERY OK source=\\"tenants\\" db=0.3ms"}	QUERY OK source="tenants" db=0.3ms	2024-09-03 07:40:46.101692
867222aa-8684-4247-9c64-19aaebbe6527	{"id": "867222aa-8684-4247-9c64-19aaebbe6527", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246101743, "event_message": "INSERT INTO \\"tenants\\" (\\"name\\",\\"suspend\\",\\"external_id\\",\\"jwt_secret\\",\\"max_bytes_per_second\\",\\"max_channels_per_client\\",\\"max_concurrent_users\\",\\"max_events_per_second\\",\\"max_joins_per_second\\",\\"inserted_at\\",\\"updated_at\\",\\"id\\") VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12) [\\"realtime-dev\\", false, \\"realtime-dev\\", \\"iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==\\", 100000, 100, 200, 100, 100, ~N[2024-09-03 07:40:46], ~N[2024-09-03 07:40:46], \\"af9514d3-3495-46bd-ae56-2da8db8c6135\\"]"}	INSERT INTO "tenants" ("name","suspend","external_id","jwt_secret","max_bytes_per_second","max_channels_per_client","max_concurrent_users","max_events_per_second","max_joins_per_second","inserted_at","updated_at","id") VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12) ["realtime-dev", false, "realtime-dev", "iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==", 100000, 100, 200, 100, 100, ~N[2024-09-03 07:40:46], ~N[2024-09-03 07:40:46], "af9514d3-3495-46bd-ae56-2da8db8c6135"]	2024-09-03 07:40:46.101743
810f76b6-8064-4e75-b29e-c40949a1c467	{"id": "810f76b6-8064-4e75-b29e-c40949a1c467", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247840983, "event_message": "SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.PostgresCdcStream>"}	SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.PostgresCdcStream>	2024-09-03 07:40:47.840983
a1b1ff41-eb3c-47e4-b3c2-f6c9b2f2ea91	{"id": "a1b1ff41-eb3c-47e4-b3c2-f6c9b2f2ea91", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247840989, "event_message": "SYN[realtime@127.0.0.1|registry<Elixir.PostgresCdcStream>] Discovering the cluster"}	SYN[realtime@127.0.0.1|registry<Elixir.PostgresCdcStream>] Discovering the cluster	2024-09-03 07:40:47.840989
3c918e9a-3497-47af-bab7-bd46d0e34eba	{"id": "3c918e9a-3497-47af-bab7-bd46d0e34eba", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247840999, "event_message": "SYN[realtime@127.0.0.1|pg<Elixir.PostgresCdcStream>] Discovering the cluster"}	SYN[realtime@127.0.0.1|pg<Elixir.PostgresCdcStream>] Discovering the cluster	2024-09-03 07:40:47.840999
2d4008c9-4915-4176-818d-c404754e6f32	{"id": "2d4008c9-4915-4176-818d-c404754e6f32", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246043789, "event_message": "begin []"}	begin []	2024-09-03 07:40:46.043789
706325cc-4aa2-498a-8830-3a58e8b47361	{"id": "706325cc-4aa2-498a-8830-3a58e8b47361", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246108727, "event_message": "INSERT INTO \\"extensions\\" (\\"type\\",\\"settings\\",\\"tenant_external_id\\",\\"inserted_at\\",\\"updated_at\\",\\"id\\") VALUES ($1,$2,$3,$4,$5,$6) [\\"postgres_cdc_rls\\", %{\\"db_host\\" => \\"z8IJXUcPtR3F9Acxkk4o29Syot96gkxH1Gko1b7Uh0w=\\", \\"db_name\\" => \\"sWBpZNdjggEPTQVlI52Zfw==\\", \\"db_password\\" => \\"sWBpZNdjggEPTQVlI52Zfw==\\", \\"db_port\\" => \\"+enMDFi1J/3IrrquHHwUmA==\\", \\"db_user\\" => \\"uxbEq/zz8DXVD53TOI1zmw==\\", \\"poll_interval_ms\\" => 100, \\"poll_max_changes\\" => 100, \\"poll_max_record_bytes\\" => 1048576, \\"publication\\" => \\"supabase_realtime\\", \\"region\\" => \\"us-east-1\\", \\"slot_name\\" => \\"supabase_realtime_replication_slot\\", \\"ssl_enforced\\" => false}, \\"realtime-dev\\", ~N[2024-09-03 07:40:46], ~N[2024-09-03 07:40:46], \\"88665551-5fb0-4af6-a8ba-c7bc31679ea2\\"]"}	INSERT INTO "extensions" ("type","settings","tenant_external_id","inserted_at","updated_at","id") VALUES ($1,$2,$3,$4,$5,$6) ["postgres_cdc_rls", %{"db_host" => "z8IJXUcPtR3F9Acxkk4o29Syot96gkxH1Gko1b7Uh0w=", "db_name" => "sWBpZNdjggEPTQVlI52Zfw==", "db_password" => "sWBpZNdjggEPTQVlI52Zfw==", "db_port" => "+enMDFi1J/3IrrquHHwUmA==", "db_user" => "uxbEq/zz8DXVD53TOI1zmw==", "poll_interval_ms" => 100, "poll_max_changes" => 100, "poll_max_record_bytes" => 1048576, "publication" => "supabase_realtime", "region" => "us-east-1", "slot_name" => "supabase_realtime_replication_slot", "ssl_enforced" => false}, "realtime-dev", ~N[2024-09-03 07:40:46], ~N[2024-09-03 07:40:46], "88665551-5fb0-4af6-a8ba-c7bc31679ea2"]	2024-09-03 07:40:46.108727
c21a1806-22ec-424f-a228-dc7edb242bb7	{"id": "c21a1806-22ec-424f-a228-dc7edb242bb7", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246115946, "event_message": "QUERY OK db=7.1ms"}	QUERY OK db=7.1ms	2024-09-03 07:40:46.115946
b30bbe82-4089-4465-8396-05e0567fc7d6	{"id": "b30bbe82-4089-4465-8396-05e0567fc7d6", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246115989, "event_message": "commit []"}	commit []	2024-09-03 07:40:46.115989
d929aa96-a80e-465d-a4aa-afbbd108ef1d	{"id": "d929aa96-a80e-465d-a4aa-afbbd108ef1d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246133363, "event_message": "+ echo 'Starting Realtime'"}	+ echo 'Starting Realtime'	2024-09-03 07:40:46.133363
d0b8875d-ba30-44c1-907a-02e5c2c9e292	{"id": "d0b8875d-ba30-44c1-907a-02e5c2c9e292", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246133392, "event_message": "+ ulimit -n"}	+ ulimit -n	2024-09-03 07:40:46.133392
ee209b45-7ee7-4b9c-8035-24b76681ec34	{"id": "ee209b45-7ee7-4b9c-8035-24b76681ec34", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246133394, "event_message": "+ exec /app/bin/server"}	+ exec /app/bin/server	2024-09-03 07:40:46.133394
62893636-3150-4a0d-847c-fbb20dbf5696	{"id": "62893636-3150-4a0d-847c-fbb20dbf5696", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349246133426, "event_message": "Starting Realtime"}	Starting Realtime	2024-09-03 07:40:46.133426
41f35a39-9094-4a3d-8f25-631953764bd4	{"id": "41f35a39-9094-4a3d-8f25-631953764bd4", "appname": "supabase_realtime_brancher", "metadata": {"level": "debug", "project": "default", "external_id": "default"}, "timestamp": 1725349246043750, "event_message": "QUERY OK db=0.9ms queue=104.0ms idle=0.0ms"}	QUERY OK db=0.9ms queue=104.0ms idle=0.0ms	2024-09-03 07:40:46.04375
f42f29b7-8e28-4d23-82d4-c7d10465cfcf	{"id": "f42f29b7-8e28-4d23-82d4-c7d10465cfcf", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349247813147, "event_message": "Elixir.Realtime.SignalHandler is being initialized..."}	Elixir.Realtime.SignalHandler is being initialized...	2024-09-03 07:40:47.813147
1ee14ce0-2645-41c3-9ffe-57f32fd84861	{"id": "1ee14ce0-2645-41c3-9ffe-57f32fd84861", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814313, "event_message": "SYN[realtime@127.0.0.1] Adding node to scope <Elixir.Realtime.Tenants.Connect>"}	SYN[realtime@127.0.0.1] Adding node to scope <Elixir.Realtime.Tenants.Connect>	2024-09-03 07:40:47.814313
fcbfcd17-5765-4b62-8c06-70669f63f6b4	{"id": "fcbfcd17-5765-4b62-8c06-70669f63f6b4", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814359, "event_message": "SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.Realtime.Tenants.Connect>"}	SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.Realtime.Tenants.Connect>	2024-09-03 07:40:47.814359
a72a7a0c-6a49-4845-b52a-c6f55f4d1b42	{"id": "a72a7a0c-6a49-4845-b52a-c6f55f4d1b42", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814555, "event_message": "SYN[realtime@127.0.0.1|pg<Elixir.Realtime.Tenants.Connect>] Discovering the cluster"}	SYN[realtime@127.0.0.1|pg<Elixir.Realtime.Tenants.Connect>] Discovering the cluster	2024-09-03 07:40:47.814555
733adb7c-27c6-4918-9ed3-d4c1166fe91d	{"id": "733adb7c-27c6-4918-9ed3-d4c1166fe91d", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815481, "event_message": "SYN[realtime@127.0.0.1|pg<Elixir.RegionNodes>] Discovering the cluster"}	SYN[realtime@127.0.0.1|pg<Elixir.RegionNodes>] Discovering the cluster	2024-09-03 07:40:47.815481
d2bd9d0d-d862-4161-bbe6-8c08add2e9e3	{"id": "d2bd9d0d-d862-4161-bbe6-8c08add2e9e3", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814721, "event_message": "SYN[realtime@127.0.0.1] Creating tables for scope <users>"}	SYN[realtime@127.0.0.1] Creating tables for scope <users>	2024-09-03 07:40:47.814721
8d671292-3ed7-493c-8d23-ccd430d77f5b	{"id": "8d671292-3ed7-493c-8d23-ccd430d77f5b", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349247840958, "event_message": "Access RealtimeWeb.Endpoint at http://realtime.fly.dev"}	Access RealtimeWeb.Endpoint at http://realtime.fly.dev	2024-09-03 07:40:47.840958
97c2cf01-4427-459e-bb21-6ab00cdfa1dc	{"id": "97c2cf01-4427-459e-bb21-6ab00cdfa1dc", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247841677, "event_message": "SYN[realtime@127.0.0.1] Adding node to scope <Elixir.Extensions.PostgresCdcRls>"}	SYN[realtime@127.0.0.1] Adding node to scope <Elixir.Extensions.PostgresCdcRls>	2024-09-03 07:40:47.841677
5ecbacad-4849-4a97-aceb-ae81dbaf3599	{"id": "5ecbacad-4849-4a97-aceb-ae81dbaf3599", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247814571, "event_message": "SYN[realtime@127.0.0.1|registry<Elixir.Realtime.Tenants.Connect>] Discovering the cluster"}	SYN[realtime@127.0.0.1|registry<Elixir.Realtime.Tenants.Connect>] Discovering the cluster	2024-09-03 07:40:47.814571
ae34b668-0f98-49f4-8b9e-dfc0db8a5537	{"id": "ae34b668-0f98-49f4-8b9e-dfc0db8a5537", "appname": "supabase_realtime_brancher", "metadata": {"level": "warning", "project": "default", "external_id": "default"}, "timestamp": 1725349247815550, "event_message": "Replica region not found, defaulting to Realtime.Repo"}	Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:40:47.81555
40d1e198-f63f-4181-ae28-b623605f5456	{"id": "40d1e198-f63f-4181-ae28-b623605f5456", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815056, "event_message": "SYN[realtime@127.0.0.1|registry<users>] Discovering the cluster"}	SYN[realtime@127.0.0.1|registry<users>] Discovering the cluster	2024-09-03 07:40:47.815056
bd31b56c-c560-49c2-a5e5-62a1f1d5d4e9	{"id": "bd31b56c-c560-49c2-a5e5-62a1f1d5d4e9", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247840962, "event_message": "SYN[realtime@127.0.0.1] Adding node to scope <Elixir.PostgresCdcStream>"}	SYN[realtime@127.0.0.1] Adding node to scope <Elixir.PostgresCdcStream>	2024-09-03 07:40:47.840962
b103c35c-7cef-4c77-a418-a57fab847ce0	{"id": "b103c35c-7cef-4c77-a418-a57fab847ce0", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247841884, "event_message": "SYN[realtime@127.0.0.1|registry<Elixir.Extensions.PostgresCdcRls>] Discovering the cluster"}	SYN[realtime@127.0.0.1|registry<Elixir.Extensions.PostgresCdcRls>] Discovering the cluster	2024-09-03 07:40:47.841884
63780453-fe76-46df-911a-12f7a0baa50c	{"id": "63780453-fe76-46df-911a-12f7a0baa50c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254536241, "event_message": "07:40:54.535 request_id=F_GsAXYXHcFPMEUAAAuB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:40:54.535 request_id=F_GsAXYXHcFPMEUAAAuB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:40:54.536241
ff474efb-f25f-4138-868c-4fab1f8e152f	{"id": "ff474efb-f25f-4138-868c-4fab1f8e152f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254536254, "event_message": "07:40:54.536 request_id=F_GsAXYXHcFPMEUAAAuB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:40:54.536 request_id=F_GsAXYXHcFPMEUAAAuB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:40:54.536254
2f65b2c8-ec6e-40bd-837a-049b0aef541d	{"id": "2f65b2c8-ec6e-40bd-837a-049b0aef541d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254541390, "event_message": "07:40:54.540 request_id=F_GsAXYXHcFPMEUAAAuB [debug] QUERY OK source=\\"extensions\\" db=1.2ms queue=1.3ms idle=715.1ms"}	07:40:54.540 request_id=F_GsAXYXHcFPMEUAAAuB [debug] QUERY OK source="extensions" db=1.2ms queue=1.3ms idle=715.1ms	2024-09-03 07:40:54.54139
6f239b10-62f0-4495-89d0-04221923d96d	{"id": "6f239b10-62f0-4495-89d0-04221923d96d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254542161, "event_message": "07:40:54.541 request_id=F_GsAXYXHcFPMEUAAAuB [info] Sent 200 in 6ms"}	07:40:54.541 request_id=F_GsAXYXHcFPMEUAAAuB [info] Sent 200 in 6ms	2024-09-03 07:40:54.542161
195b175d-036f-4ce7-89a4-7af722b07d0f	{"id": "195b175d-036f-4ce7-89a4-7af722b07d0f", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349247840919, "event_message": "Running RealtimeWeb.Endpoint with cowboy 2.12.0 at :::4000 (http)"}	Running RealtimeWeb.Endpoint with cowboy 2.12.0 at :::4000 (http)	2024-09-03 07:40:47.840919
5889e71d-8ec4-487e-9ae2-c17663b925e9	{"id": "5889e71d-8ec4-487e-9ae2-c17663b925e9", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247815242, "event_message": "SYN[realtime@127.0.0.1|pg<users>] Discovering the cluster"}	SYN[realtime@127.0.0.1|pg<users>] Discovering the cluster	2024-09-03 07:40:47.815242
eced296a-e81a-49c8-a233-0d06646cc159	{"id": "eced296a-e81a-49c8-a233-0d06646cc159", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247841706, "event_message": "SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.Extensions.PostgresCdcRls>"}	SYN[realtime@127.0.0.1] Creating tables for scope <Elixir.Extensions.PostgresCdcRls>	2024-09-03 07:40:47.841706
2befdbc5-9c7a-48fd-b96d-9366f7a296f8	{"id": "2befdbc5-9c7a-48fd-b96d-9366f7a296f8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254536204, "event_message": "07:40:54.535 request_id=F_GsAXYXHcFPMEUAAAuB [info] HEAD /api/ping"}	07:40:54.535 request_id=F_GsAXYXHcFPMEUAAAuB [info] HEAD /api/ping	2024-09-03 07:40:54.536204
4c8f028a-51d1-4860-b951-860b4f62d3f5	{"id": "4c8f028a-51d1-4860-b951-860b4f62d3f5", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254536250, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:40:54.53625
a74df1ce-9b7c-4a3c-add3-64b5fcc6bf85	{"id": "a74df1ce-9b7c-4a3c-add3-64b5fcc6bf85", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254538586, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:40:54.538586
e7a13abb-a3e3-4653-95c7-232bac998110	{"id": "e7a13abb-a3e3-4653-95c7-232bac998110", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349254541917, "event_message": "Starting Elixir.Realtime.RateCounter for: {:plug, :requests, \\"realtime-dev\\"}"}	Starting Elixir.Realtime.RateCounter for: {:plug, :requests, "realtime-dev"}	2024-09-03 07:40:54.541917
2625a98d-1acc-49d9-87a3-9aa8630daf19	{"id": "2625a98d-1acc-49d9-87a3-9aa8630daf19", "appname": "supabase_realtime_brancher", "metadata": {"level": "info", "project": "default", "external_id": "default"}, "timestamp": 1725349254542146, "event_message": "Starting Elixir.Realtime.RateCounter for: {:channel, :events, \\"realtime-dev\\"}"}	Starting Elixir.Realtime.RateCounter for: {:channel, :events, "realtime-dev"}	2024-09-03 07:40:54.542146
8bcbd6f0-6738-4c8d-85d9-5abb0fee6d14	{"id": "8bcbd6f0-6738-4c8d-85d9-5abb0fee6d14", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349247841894, "event_message": "SYN[realtime@127.0.0.1|pg<Elixir.Extensions.PostgresCdcRls>] Discovering the cluster"}	SYN[realtime@127.0.0.1|pg<Elixir.Extensions.PostgresCdcRls>] Discovering the cluster	2024-09-03 07:40:47.841894
2880f47a-b58a-4f66-b4ca-f9a10813174a	{"id": "2880f47a-b58a-4f66-b4ca-f9a10813174a", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254536246, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:40:54.536246
9658180b-7a43-4c31-9e2b-1fe87e926838	{"id": "9658180b-7a43-4c31-9e2b-1fe87e926838", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254538543, "event_message": "07:40:54.538 request_id=F_GsAXYXHcFPMEUAAAuB [debug] QUERY OK source=\\"tenants\\" db=0.8ms queue=0.9ms idle=713.0ms"}	07:40:54.538 request_id=F_GsAXYXHcFPMEUAAAuB [debug] QUERY OK source="tenants" db=0.8ms queue=0.9ms idle=713.0ms	2024-09-03 07:40:54.538543
e205247e-318d-45fe-ba80-f7ddd1444592	{"id": "e205247e-318d-45fe-ba80-f7ddd1444592", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349254541415, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:40:54.541415
132bb89c-b997-4e3b-aa84-0710a6295760	{"id": "132bb89c-b997-4e3b-aa84-0710a6295760", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264608268, "event_message": "07:41:04.608 request_id=F_GsA84NeVSiKOEAAAGP [info] Sent 200 in 6ms"}	07:41:04.608 request_id=F_GsA84NeVSiKOEAAAGP [info] Sent 200 in 6ms	2024-09-03 07:41:04.608268
fd6e81a7-4c3d-4ae9-9950-f6dec27f8afd	{"id": "fd6e81a7-4c3d-4ae9-9950-f6dec27f8afd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264602294, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:04.602294
de160243-3502-4908-ad54-a3dcdc338813	{"id": "de160243-3502-4908-ad54-a3dcdc338813", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264604863, "event_message": "07:41:04.604 request_id=F_GsA84NeVSiKOEAAAGP [debug] QUERY OK source=\\"tenants\\" db=2.2ms idle=779.0ms"}	07:41:04.604 request_id=F_GsA84NeVSiKOEAAAGP [debug] QUERY OK source="tenants" db=2.2ms idle=779.0ms	2024-09-03 07:41:04.604863
8ae46a70-493b-4226-b1b9-4dda460e47ff	{"id": "8ae46a70-493b-4226-b1b9-4dda460e47ff", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264608086, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:04.608086
ca249894-3bab-4616-a925-cd80733fc6e2	{"id": "ca249894-3bab-4616-a925-cd80733fc6e2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274659143, "event_message": "07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:14.659143
44d5bb7a-3655-4707-8e4c-593bf50c7342	{"id": "44d5bb7a-3655-4707-8e4c-593bf50c7342", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274659156, "event_message": "07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:14.659156
d938bdd7-cbec-4306-a0f2-bb83e6cf66d1	{"id": "d938bdd7-cbec-4306-a0f2-bb83e6cf66d1", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274663850, "event_message": "07:41:14.663 request_id=F_GsBiV_P-9ueQkAAAxB [debug] QUERY OK source=\\"extensions\\" db=1.9ms idle=837.9ms"}	07:41:14.663 request_id=F_GsBiV_P-9ueQkAAAxB [debug] QUERY OK source="extensions" db=1.9ms idle=837.9ms	2024-09-03 07:41:14.66385
c8281767-9134-411c-92f9-250417c030ef	{"id": "c8281767-9134-411c-92f9-250417c030ef", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284716099, "event_message": "07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [info] HEAD /api/ping"}	07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [info] HEAD /api/ping	2024-09-03 07:41:24.716099
927f9b76-9439-476f-84e1-2637460bca3e	{"id": "927f9b76-9439-476f-84e1-2637460bca3e", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284716212, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:24.716212
7bab1647-533a-4605-8380-d7b2651deeda	{"id": "7bab1647-533a-4605-8380-d7b2651deeda", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284717573, "event_message": "07:41:24.716 request_id=F_GsCHzwUrLGcuEAAAyB [debug] QUERY OK source=\\"tenants\\" db=0.8ms idle=892.5ms"}	07:41:24.716 request_id=F_GsCHzwUrLGcuEAAAyB [debug] QUERY OK source="tenants" db=0.8ms idle=892.5ms	2024-09-03 07:41:24.717573
ecd681d7-cc6b-4e96-a4e8-a1d11b8cdd3d	{"id": "ecd681d7-cc6b-4e96-a4e8-a1d11b8cdd3d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284719820, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:24.71982
529c3711-aa11-4793-bb9a-7e591b7f16bd	{"id": "529c3711-aa11-4793-bb9a-7e591b7f16bd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294770815, "event_message": "07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:34.770815
028e612a-2db6-4952-a001-2eac878a481b	{"id": "028e612a-2db6-4952-a001-2eac878a481b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294770832, "event_message": "07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:34.770832
2d03891b-8d55-4103-bc8e-ab873c52b7d3	{"id": "2d03891b-8d55-4103-bc8e-ab873c52b7d3", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294772893, "event_message": "07:41:34.772 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] QUERY OK source=\\"extensions\\" db=0.7ms idle=948.2ms"}	07:41:34.772 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] QUERY OK source="extensions" db=0.7ms idle=948.2ms	2024-09-03 07:41:34.772893
52b0765d-8701-459b-b0db-a1dff2566e93	{"id": "52b0765d-8701-459b-b0db-a1dff2566e93", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304823245, "event_message": "07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [info] HEAD /api/ping"}	07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [info] HEAD /api/ping	2024-09-03 07:41:44.823245
ed562a36-c099-4e28-888a-0759a90b2a79	{"id": "ed562a36-c099-4e28-888a-0759a90b2a79", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304823521, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:44.823521
279fe7f9-1287-430b-bda6-1b9806c52ba0	{"id": "279fe7f9-1287-430b-bda6-1b9806c52ba0", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264602201, "event_message": "07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [info] HEAD /api/ping"}	07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [info] HEAD /api/ping	2024-09-03 07:41:04.602201
cb2f2272-2b4e-4c54-a22a-cdaf805cb1c8	{"id": "cb2f2272-2b4e-4c54-a22a-cdaf805cb1c8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264602315, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:04.602315
31bccb61-5b24-4da0-bed3-4eb16e3444a7	{"id": "31bccb61-5b24-4da0-bed3-4eb16e3444a7", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264604899, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:04.604899
629e0455-43b5-4d94-97e7-11bdd424c771	{"id": "629e0455-43b5-4d94-97e7-11bdd424c771", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274659148, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:14.659148
753719d7-de17-4b6c-bfe8-990430ce487c	{"id": "753719d7-de17-4b6c-bfe8-990430ce487c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274661682, "event_message": "07:41:14.661 request_id=F_GsBiV_P-9ueQkAAAxB [debug] QUERY OK source=\\"tenants\\" db=2.0ms idle=835.6ms"}	07:41:14.661 request_id=F_GsBiV_P-9ueQkAAAxB [debug] QUERY OK source="tenants" db=2.0ms idle=835.6ms	2024-09-03 07:41:14.661682
ed4ad5b4-30e6-4d17-9eb6-32f44e347b3f	{"id": "ed4ad5b4-30e6-4d17-9eb6-32f44e347b3f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274663886, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:14.663886
820dd2ba-09d3-4134-b604-cf9c2c3cb07c	{"id": "820dd2ba-09d3-4134-b604-cf9c2c3cb07c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284720070, "event_message": "07:41:24.719 request_id=F_GsCHzwUrLGcuEAAAyB [info] Sent 200 in 4ms"}	07:41:24.719 request_id=F_GsCHzwUrLGcuEAAAyB [info] Sent 200 in 4ms	2024-09-03 07:41:24.72007
192870f9-ecf3-4e04-9ae5-7248eca5ae38	{"id": "192870f9-ecf3-4e04-9ae5-7248eca5ae38", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284716219, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:24.716219
dbb6c1ad-6d90-4c6b-80d6-670f3454ff91	{"id": "dbb6c1ad-6d90-4c6b-80d6-670f3454ff91", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284717618, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:24.717618
1b5d3d09-f223-4079-8219-13fbdb9c05af	{"id": "1b5d3d09-f223-4079-8219-13fbdb9c05af", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294770634, "event_message": "07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [info] HEAD /api/ping"}	07:41:34.770 request_id=F_GsCtQ8ITZFgdAAAAzB [info] HEAD /api/ping	2024-09-03 07:41:34.770634
8ec98372-b9b0-4f78-89c2-1e0a24f7ab99	{"id": "8ec98372-b9b0-4f78-89c2-1e0a24f7ab99", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294770829, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:34.770829
81c3fd6b-a1d9-4ecb-a513-07956c8a14f8	{"id": "81c3fd6b-a1d9-4ecb-a513-07956c8a14f8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294771756, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:34.771756
8c753a01-8673-4beb-a8bc-327609e8da81	{"id": "8c753a01-8673-4beb-a8bc-327609e8da81", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294773251, "event_message": "07:41:34.772 request_id=F_GsCtQ8ITZFgdAAAAzB [info] Sent 200 in 2ms"}	07:41:34.772 request_id=F_GsCtQ8ITZFgdAAAAzB [info] Sent 200 in 2ms	2024-09-03 07:41:34.773251
ce8d91fe-1f72-409e-a36d-f64edfcb89d5	{"id": "ce8d91fe-1f72-409e-a36d-f64edfcb89d5", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304823459, "event_message": "07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:44.823459
0649d4a3-3bdd-43ae-9403-7e288a653051	{"id": "0649d4a3-3bdd-43ae-9403-7e288a653051", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264602263, "event_message": "07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:04.602263
02bdd6a5-b1f7-4934-817a-f531dd3f3f52	{"id": "02bdd6a5-b1f7-4934-817a-f531dd3f3f52", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264602352, "event_message": "07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:04.601 request_id=F_GsA84NeVSiKOEAAAGP [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:04.602352
9ab10edc-06b1-4de9-a901-cc9a89c5973f	{"id": "9ab10edc-06b1-4de9-a901-cc9a89c5973f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349264608066, "event_message": "07:41:04.607 request_id=F_GsA84NeVSiKOEAAAGP [debug] QUERY OK source=\\"extensions\\" db=2.8ms idle=781.6ms"}	07:41:04.607 request_id=F_GsA84NeVSiKOEAAAGP [debug] QUERY OK source="extensions" db=2.8ms idle=781.6ms	2024-09-03 07:41:04.608066
46bfe850-8c91-4680-be32-04b613fb2bad	{"id": "46bfe850-8c91-4680-be32-04b613fb2bad", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274659102, "event_message": "07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [info] HEAD /api/ping"}	07:41:14.658 request_id=F_GsBiV_P-9ueQkAAAxB [info] HEAD /api/ping	2024-09-03 07:41:14.659102
bace375c-96fd-4321-bd38-a4dac00301ca	{"id": "bace375c-96fd-4321-bd38-a4dac00301ca", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274659152, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:14.659152
8e3c3d7f-a53b-4dc8-b222-de4eba8b6cc6	{"id": "8e3c3d7f-a53b-4dc8-b222-de4eba8b6cc6", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274661716, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:14.661716
9607aa88-2e16-42e2-b250-e4076e9bfed1	{"id": "9607aa88-2e16-42e2-b250-e4076e9bfed1", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349274664043, "event_message": "07:41:14.663 request_id=F_GsBiV_P-9ueQkAAAxB [info] Sent 200 in 5ms"}	07:41:14.663 request_id=F_GsBiV_P-9ueQkAAAxB [info] Sent 200 in 5ms	2024-09-03 07:41:14.664043
c2bb0b4a-2aaf-4a7c-be26-76942829e37f	{"id": "c2bb0b4a-2aaf-4a7c-be26-76942829e37f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284716171, "event_message": "07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:24.716171
000420c2-3948-416d-a0b0-cd407c74281b	{"id": "000420c2-3948-416d-a0b0-cd407c74281b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284716230, "event_message": "07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:24.715 request_id=F_GsCHzwUrLGcuEAAAyB [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:24.71623
36bbbf83-9805-41ba-bd22-1246cfe28693	{"id": "36bbbf83-9805-41ba-bd22-1246cfe28693", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349284719746, "event_message": "07:41:24.719 request_id=F_GsCHzwUrLGcuEAAAyB [debug] QUERY OK source=\\"extensions\\" db=2.0ms idle=893.6ms"}	07:41:24.719 request_id=F_GsCHzwUrLGcuEAAAyB [debug] QUERY OK source="extensions" db=2.0ms idle=893.6ms	2024-09-03 07:41:24.719746
a6789814-d2dc-4a7a-aee9-7ce2d753e6f2	{"id": "a6789814-d2dc-4a7a-aee9-7ce2d753e6f2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294770825, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:34.770825
01acae11-29e8-4fc8-8e0d-ab1306d25fc2	{"id": "01acae11-29e8-4fc8-8e0d-ab1306d25fc2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294771733, "event_message": "07:41:34.771 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] QUERY OK source=\\"tenants\\" db=0.6ms idle=947.3ms"}	07:41:34.771 request_id=F_GsCtQ8ITZFgdAAAAzB [debug] QUERY OK source="tenants" db=0.6ms idle=947.3ms	2024-09-03 07:41:34.771733
b56c5b26-b267-43f2-81ed-6db30251d12d	{"id": "b56c5b26-b267-43f2-81ed-6db30251d12d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349294772924, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:34.772924
853fa8f9-6816-4907-9755-37ae71376492	{"id": "853fa8f9-6816-4907-9755-37ae71376492", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304827343, "event_message": "07:41:44.827 request_id=F_GsDStn8vjVrEYAAAHP [info] Sent 200 in 4ms"}	07:41:44.827 request_id=F_GsDStn8vjVrEYAAAHP [info] Sent 200 in 4ms	2024-09-03 07:41:44.827343
30d85774-4759-413c-9bcf-1c9f6ee36edd	{"id": "30d85774-4759-413c-9bcf-1c9f6ee36edd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304823511, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:44.823511
18ad4584-5088-4470-9698-4fd2727189e4	{"id": "18ad4584-5088-4470-9698-4fd2727189e4", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304824483, "event_message": "07:41:44.824 request_id=F_GsDStn8vjVrEYAAAHP [debug] QUERY OK source=\\"tenants\\" db=0.7ms idle=999.7ms"}	07:41:44.824 request_id=F_GsDStn8vjVrEYAAAHP [debug] QUERY OK source="tenants" db=0.7ms idle=999.7ms	2024-09-03 07:41:44.824483
e48130bc-b1d0-4c11-9534-83043e36100a	{"id": "e48130bc-b1d0-4c11-9534-83043e36100a", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304823529, "event_message": "07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:44.822 request_id=F_GsDStn8vjVrEYAAAHP [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:44.823529
6ad59971-b24d-468a-ad53-7e950c48fe5c	{"id": "6ad59971-b24d-468a-ad53-7e950c48fe5c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304827282, "event_message": "07:41:44.826 request_id=F_GsDStn8vjVrEYAAAHP [debug] QUERY OK source=\\"extensions\\" db=2.5ms idle=1000.7ms"}	07:41:44.826 request_id=F_GsDStn8vjVrEYAAAHP [debug] QUERY OK source="extensions" db=2.5ms idle=1000.7ms	2024-09-03 07:41:44.827282
046e5110-8518-46ff-bae5-6ccf4baf16ff	{"id": "046e5110-8518-46ff-bae5-6ccf4baf16ff", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314882921, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:41:54.882921
03661a4b-118b-4ce7-9369-893ecf25a194	{"id": "03661a4b-118b-4ce7-9369-893ecf25a194", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314883937, "event_message": "07:41:54.883 request_id=F_GsD4MD6LBd8TsAAA0B [debug] QUERY OK source=\\"tenants\\" db=0.6ms idle=1059.4ms"}	07:41:54.883 request_id=F_GsD4MD6LBd8TsAAA0B [debug] QUERY OK source="tenants" db=0.6ms idle=1059.4ms	2024-09-03 07:41:54.883937
f28526d9-4337-4ed1-bd66-70a13bf868a8	{"id": "f28526d9-4337-4ed1-bd66-70a13bf868a8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314884952, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:54.884952
04067192-3fe3-4b57-947d-89a5cc50d27b	{"id": "04067192-3fe3-4b57-947d-89a5cc50d27b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324938181, "event_message": "07:42:04.937 request_id=F_GsEdokvxNevF4AAAzD [info] Sent 200 in 3ms"}	07:42:04.937 request_id=F_GsEdokvxNevF4AAAzD [info] Sent 200 in 3ms	2024-09-03 07:42:04.938181
e0faea0b-4b1b-444d-976d-c3d55a4dbaad	{"id": "e0faea0b-4b1b-444d-976d-c3d55a4dbaad", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324934893, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:04.934893
bb4573cf-996c-4d1f-95b3-c5d6d7613cda	{"id": "bb4573cf-996c-4d1f-95b3-c5d6d7613cda", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324936482, "event_message": "07:42:04.936 request_id=F_GsEdokvxNevF4AAAzD [debug] QUERY OK source=\\"tenants\\" db=1.5ms idle=1111.1ms"}	07:42:04.936 request_id=F_GsEdokvxNevF4AAAzD [debug] QUERY OK source="tenants" db=1.5ms idle=1111.1ms	2024-09-03 07:42:04.936482
0e2191da-2630-4eea-b647-66727ab5ad98	{"id": "0e2191da-2630-4eea-b647-66727ab5ad98", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324937917, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:04.937917
5710185b-3143-4400-bbbf-9749da5137fd	{"id": "5710185b-3143-4400-bbbf-9749da5137fd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334989946, "event_message": "07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [info] HEAD /api/ping"}	07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [info] HEAD /api/ping	2024-09-03 07:42:14.989946
455ac063-f246-48af-9c38-f8e02ed33e09	{"id": "455ac063-f246-48af-9c38-f8e02ed33e09", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334990130, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:14.99013
a022f622-6480-4eb6-9ec4-e86680b4b6a5	{"id": "a022f622-6480-4eb6-9ec4-e86680b4b6a5", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334991527, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:14.991527
8063c5c2-fce9-43e7-abae-3cf348409c2d	{"id": "8063c5c2-fce9-43e7-abae-3cf348409c2d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334993113, "event_message": "07:42:14.992 request_id=F_GsFDF8RSo4ZqYAAA1B [info] Sent 200 in 3ms"}	07:42:14.992 request_id=F_GsFDF8RSo4ZqYAAA1B [info] Sent 200 in 3ms	2024-09-03 07:42:14.993113
76e887bb-4d2c-47dc-b0ac-f7b0dfc1c6b3	{"id": "76e887bb-4d2c-47dc-b0ac-f7b0dfc1c6b3", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345049529, "event_message": "07:42:25.049 request_id=F_GsFojgajzqE24AAA2B [info] Sent 200 in 3ms"}	07:42:25.049 request_id=F_GsFojgajzqE24AAA2B [info] Sent 200 in 3ms	2024-09-03 07:42:25.049529
3d59ccf3-943e-42a7-a30d-be86f74434cd	{"id": "3d59ccf3-943e-42a7-a30d-be86f74434cd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345046116, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:25.046116
7f1ba888-b845-48ad-af33-9d72c55a61fe	{"id": "7f1ba888-b845-48ad-af33-9d72c55a61fe", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304824536, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:44.824536
3e9126b4-c3a8-41b6-a780-64480b1b2afa	{"id": "3e9126b4-c3a8-41b6-a780-64480b1b2afa", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314882913, "event_message": "07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:41:54.882913
0d941e50-8382-4256-8202-08c9570f0b71	{"id": "0d941e50-8382-4256-8202-08c9570f0b71", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314883001, "event_message": "07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [warning] Replica region not found, defaulting to Realtime.Repo"}	07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:41:54.883001
bde888b3-a9c6-4762-8bf1-47ae625fbd10	{"id": "bde888b3-a9c6-4762-8bf1-47ae625fbd10", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314884929, "event_message": "07:41:54.884 request_id=F_GsD4MD6LBd8TsAAA0B [debug] QUERY OK source=\\"extensions\\" db=0.6ms idle=1060.3ms"}	07:41:54.884 request_id=F_GsD4MD6LBd8TsAAA0B [debug] QUERY OK source="extensions" db=0.6ms idle=1060.3ms	2024-09-03 07:41:54.884929
f8e5c71c-3f12-472f-9d92-61f0f4870a88	{"id": "f8e5c71c-3f12-472f-9d92-61f0f4870a88", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324934820, "event_message": "07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [info] HEAD /api/ping"}	07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [info] HEAD /api/ping	2024-09-03 07:42:04.93482
254f1250-e703-46d5-98f1-a48ad152f2a7	{"id": "254f1250-e703-46d5-98f1-a48ad152f2a7", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324934900, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:04.9349
53874320-a747-4101-bbb6-7444365e1004	{"id": "53874320-a747-4101-bbb6-7444365e1004", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324936515, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:04.936515
f94c2b86-e7ae-44bb-8342-0e613f6a0313	{"id": "f94c2b86-e7ae-44bb-8342-0e613f6a0313", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334990115, "event_message": "07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:14.990115
d73c3b7e-8418-48c4-98a6-ba0c86e07e23	{"id": "d73c3b7e-8418-48c4-98a6-ba0c86e07e23", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334990136, "event_message": "07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:14.989 request_id=F_GsFDF8RSo4ZqYAAA1B [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:14.990136
bbc809b0-fefb-4457-90f2-d5bf3e427479	{"id": "bbc809b0-fefb-4457-90f2-d5bf3e427479", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334992477, "event_message": "07:42:14.991 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] QUERY OK source=\\"extensions\\" db=0.8ms queue=0.1ms idle=167.3ms"}	07:42:14.991 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] QUERY OK source="extensions" db=0.8ms queue=0.1ms idle=167.3ms	2024-09-03 07:42:14.992477
9b4f437c-4d0e-40ab-999f-b448918ecb2f	{"id": "9b4f437c-4d0e-40ab-999f-b448918ecb2f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345046039, "event_message": "07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [info] HEAD /api/ping"}	07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [info] HEAD /api/ping	2024-09-03 07:42:25.046039
47957b8c-ae13-47b9-8399-59e8dc5022a8	{"id": "47957b8c-ae13-47b9-8399-59e8dc5022a8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345046110, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:25.04611
3b76843d-1333-4ff7-8abe-902edfe82ca2	{"id": "3b76843d-1333-4ff7-8abe-902edfe82ca2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345048243, "event_message": "07:42:25.047 request_id=F_GsFojgajzqE24AAA2B [debug] QUERY OK source=\\"tenants\\" db=1.7ms idle=222.5ms"}	07:42:25.047 request_id=F_GsFojgajzqE24AAA2B [debug] QUERY OK source="tenants" db=1.7ms idle=222.5ms	2024-09-03 07:42:25.048243
e6f28b9a-9ae6-42b6-bff8-28923fdb109d	{"id": "e6f28b9a-9ae6-42b6-bff8-28923fdb109d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345049308, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:25.049308
a55810a0-e5df-43c1-bab6-7a827f92a004	{"id": "a55810a0-e5df-43c1-bab6-7a827f92a004", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349304827334, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:41:44.827334
f6d1107e-9868-43cb-807c-a3eba77f9224	{"id": "f6d1107e-9868-43cb-807c-a3eba77f9224", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314882866, "event_message": "07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [info] HEAD /api/ping"}	07:41:54.882 request_id=F_GsD4MD6LBd8TsAAA0B [info] HEAD /api/ping	2024-09-03 07:41:54.882866
96a75844-1aa7-4037-82fd-02c6e572bd81	{"id": "96a75844-1aa7-4037-82fd-02c6e572bd81", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314882926, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:41:54.882926
58d693a4-e9bb-4f45-8389-8fe547bbd3f2	{"id": "58d693a4-e9bb-4f45-8389-8fe547bbd3f2", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314883962, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:41:54.883962
9e0a8a1b-4b41-4f21-bf73-fd407f0db297	{"id": "9e0a8a1b-4b41-4f21-bf73-fd407f0db297", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349314885350, "event_message": "07:41:54.885 request_id=F_GsD4MD6LBd8TsAAA0B [info] Sent 200 in 2ms"}	07:41:54.885 request_id=F_GsD4MD6LBd8TsAAA0B [info] Sent 200 in 2ms	2024-09-03 07:41:54.88535
5aa7a0cf-80f9-45c0-8606-89af13e6bb19	{"id": "5aa7a0cf-80f9-45c0-8606-89af13e6bb19", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324934880, "event_message": "07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:04.93488
666c4540-8d2b-4d33-959d-865e5635dfd5	{"id": "666c4540-8d2b-4d33-959d-865e5635dfd5", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324934906, "event_message": "07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:04.934 request_id=F_GsEdokvxNevF4AAAzD [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:04.934906
0db9e022-3fe8-48eb-99ed-6466d43eb01d	{"id": "0db9e022-3fe8-48eb-99ed-6466d43eb01d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349324937876, "event_message": "07:42:04.937 request_id=F_GsEdokvxNevF4AAAzD [debug] QUERY OK source=\\"extensions\\" db=0.8ms idle=112.9ms"}	07:42:04.937 request_id=F_GsEdokvxNevF4AAAzD [debug] QUERY OK source="extensions" db=0.8ms idle=112.9ms	2024-09-03 07:42:04.937876
562b5287-ae99-42c1-80b8-ae0b51d67df7	{"id": "562b5287-ae99-42c1-80b8-ae0b51d67df7", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334990123, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:14.990123
e152df02-e5e7-431f-92a7-8c786c9378d3	{"id": "e152df02-e5e7-431f-92a7-8c786c9378d3", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334991469, "event_message": "07:42:14.990 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] QUERY OK source=\\"tenants\\" db=0.6ms idle=166.1ms"}	07:42:14.990 request_id=F_GsFDF8RSo4ZqYAAA1B [debug] QUERY OK source="tenants" db=0.6ms idle=166.1ms	2024-09-03 07:42:14.991469
f1aab444-f2c5-42f9-95d1-1d7c7402d1dd	{"id": "f1aab444-f2c5-42f9-95d1-1d7c7402d1dd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349334992515, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:14.992515
cbc1da8c-673c-440f-ac94-a13f0097676f	{"id": "cbc1da8c-673c-440f-ac94-a13f0097676f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345046101, "event_message": "07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:25.046101
83d4f62f-8b6f-471f-88e9-de6515d1741e	{"id": "83d4f62f-8b6f-471f-88e9-de6515d1741e", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345046122, "event_message": "07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:25.045 request_id=F_GsFojgajzqE24AAA2B [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:25.046122
f9759790-2f6f-4d0f-a805-d8af47faf9d6	{"id": "f9759790-2f6f-4d0f-a805-d8af47faf9d6", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345049285, "event_message": "07:42:25.048 request_id=F_GsFojgajzqE24AAA2B [debug] QUERY OK source=\\"extensions\\" db=0.7ms idle=224.5ms"}	07:42:25.048 request_id=F_GsFojgajzqE24AAA2B [debug] QUERY OK source="extensions" db=0.7ms idle=224.5ms	2024-09-03 07:42:25.049285
eea9c288-10f4-4f50-bbca-a167dcaf60f8	{"id": "eea9c288-10f4-4f50-bbca-a167dcaf60f8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355103226, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:35.103226
e4e262ee-f51c-424f-8744-af84a2d1b664	{"id": "e4e262ee-f51c-424f-8744-af84a2d1b664", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349345048285, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:25.048285
2d99132c-b919-4f4e-b729-23b5c2fa8889	{"id": "2d99132c-b919-4f4e-b729-23b5c2fa8889", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355103177, "event_message": "07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [info] HEAD /api/ping"}	07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [info] HEAD /api/ping	2024-09-03 07:42:35.103177
f16c9ecb-4493-4a77-ae66-2a54ec64e988	{"id": "f16c9ecb-4493-4a77-ae66-2a54ec64e988", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355103232, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:35.103232
e659e090-1dd0-4c62-b863-e70a739d0d2d	{"id": "e659e090-1dd0-4c62-b863-e70a739d0d2d", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355104123, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:35.104123
b87fd716-021c-4edd-b1e8-a4aff81c2dc6	{"id": "b87fd716-021c-4edd-b1e8-a4aff81c2dc6", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355105215, "event_message": "07:42:35.105 request_id=F_GsGOBR_0-5hEkAAA0D [info] Sent 200 in 2ms"}	07:42:35.105 request_id=F_GsGOBR_0-5hEkAAA0D [info] Sent 200 in 2ms	2024-09-03 07:42:35.105215
bc2cfc03-5713-44df-ad67-690ac7339534	{"id": "bc2cfc03-5713-44df-ad67-690ac7339534", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365153310, "event_message": "07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:45.15331
e1c21d6e-00ae-4957-8d11-189c834b7cbc	{"id": "e1c21d6e-00ae-4957-8d11-189c834b7cbc", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365153342, "event_message": "07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:45.153342
27d42cac-a29f-4bdf-a16d-d3fdd85c6d4e	{"id": "27d42cac-a29f-4bdf-a16d-d3fdd85c6d4e", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365155471, "event_message": "07:42:45.155 request_id=F_GsGzdb9d8NgMcAAAIP [debug] QUERY OK source=\\"extensions\\" db=0.8ms idle=330.9ms"}	07:42:45.155 request_id=F_GsGzdb9d8NgMcAAAIP [debug] QUERY OK source="extensions" db=0.8ms idle=330.9ms	2024-09-03 07:42:45.155471
ed16776e-061d-46e2-995f-f6a7be2a6621	{"id": "ed16776e-061d-46e2-995f-f6a7be2a6621", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375204347, "event_message": "07:42:55.203 request_id=F_GsHY50DR4mdT8AAAJP [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:55.203 request_id=F_GsHY50DR4mdT8AAAJP [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:55.204347
9e2789e0-4cbd-4397-80af-ee1a40141dba	{"id": "9e2789e0-4cbd-4397-80af-ee1a40141dba", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375204365, "event_message": "07:42:55.204 request_id=F_GsHY50DR4mdT8AAAJP [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:55.204 request_id=F_GsHY50DR4mdT8AAAJP [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:55.204365
ef8ab717-aed0-4fbd-bc91-a1981e7735b6	{"id": "ef8ab717-aed0-4fbd-bc91-a1981e7735b6", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375206530, "event_message": "07:42:55.206 request_id=F_GsHY50DR4mdT8AAAJP [debug] QUERY OK source=\\"extensions\\" db=0.8ms idle=381.7ms"}	07:42:55.206 request_id=F_GsHY50DR4mdT8AAAJP [debug] QUERY OK source="extensions" db=0.8ms idle=381.7ms	2024-09-03 07:42:55.20653
3d6d5bff-d88d-4209-b8e5-a7bfd0f12036	{"id": "3d6d5bff-d88d-4209-b8e5-a7bfd0f12036", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355103219, "event_message": "07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:42:35.103219
4f88970b-ef7a-41a1-b076-e7cd6ac6607b	{"id": "4f88970b-ef7a-41a1-b076-e7cd6ac6607b", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355103240, "event_message": "07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [warning] Replica region not found, defaulting to Realtime.Repo"}	07:42:35.102 request_id=F_GsGOBR_0-5hEkAAA0D [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:42:35.10324
f4072eb7-e5cf-444a-b922-d318b2683785	{"id": "f4072eb7-e5cf-444a-b922-d318b2683785", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355104993, "event_message": "07:42:35.104 request_id=F_GsGOBR_0-5hEkAAA0D [debug] QUERY OK source=\\"extensions\\" db=0.7ms idle=280.3ms"}	07:42:35.104 request_id=F_GsGOBR_0-5hEkAAA0D [debug] QUERY OK source="extensions" db=0.7ms idle=280.3ms	2024-09-03 07:42:35.104993
1dd1b109-679f-4f20-8b49-81f4f94c44c8	{"id": "1dd1b109-679f-4f20-8b49-81f4f94c44c8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365153234, "event_message": "07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [info] HEAD /api/ping"}	07:42:45.152 request_id=F_GsGzdb9d8NgMcAAAIP [info] HEAD /api/ping	2024-09-03 07:42:45.153234
aa64a4e8-a892-4f0d-bd61-f3a604a1043e	{"id": "aa64a4e8-a892-4f0d-bd61-f3a604a1043e", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365153338, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:45.153338
33fde59e-4e68-47ae-a8b9-c662d1b81edb	{"id": "33fde59e-4e68-47ae-a8b9-c662d1b81edb", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365154393, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:45.154393
2f506e56-706e-4df9-86e3-39ae431bbd5f	{"id": "2f506e56-706e-4df9-86e3-39ae431bbd5f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375204309, "event_message": "07:42:55.203 request_id=F_GsHY50DR4mdT8AAAJP [info] HEAD /api/ping"}	07:42:55.203 request_id=F_GsHY50DR4mdT8AAAJP [info] HEAD /api/ping	2024-09-03 07:42:55.204309
399cc7e2-c5ba-409a-966f-5f4a93ac3900	{"id": "399cc7e2-c5ba-409a-966f-5f4a93ac3900", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375204360, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:42:55.20436
0fe943d4-1c00-4e74-b526-154680b827ab	{"id": "0fe943d4-1c00-4e74-b526-154680b827ab", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375205281, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:42:55.205281
e5dfd81f-cf11-4e7b-a28f-905f7d35f339	{"id": "e5dfd81f-cf11-4e7b-a28f-905f7d35f339", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375206871, "event_message": "07:42:55.206 request_id=F_GsHY50DR4mdT8AAAJP [info] Sent 200 in 2ms"}	07:42:55.206 request_id=F_GsHY50DR4mdT8AAAJP [info] Sent 200 in 2ms	2024-09-03 07:42:55.206871
26c0802d-d730-475d-ae25-573b619e459f	{"id": "26c0802d-d730-475d-ae25-573b619e459f", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355104100, "event_message": "07:42:35.103 request_id=F_GsGOBR_0-5hEkAAA0D [debug] QUERY OK source=\\"tenants\\" db=0.5ms idle=279.4ms"}	07:42:35.103 request_id=F_GsGOBR_0-5hEkAAA0D [debug] QUERY OK source="tenants" db=0.5ms idle=279.4ms	2024-09-03 07:42:35.1041
b54e324b-5a2b-491c-b954-d513f9048bca	{"id": "b54e324b-5a2b-491c-b954-d513f9048bca", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349355105033, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:35.105033
f409c78a-29e8-44a8-9348-0f195b470101	{"id": "f409c78a-29e8-44a8-9348-0f195b470101", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365155616, "event_message": "07:42:45.155 request_id=F_GsGzdb9d8NgMcAAAIP [info] Sent 200 in 2ms"}	07:42:45.155 request_id=F_GsGzdb9d8NgMcAAAIP [info] Sent 200 in 2ms	2024-09-03 07:42:45.155616
c155c606-f9b2-41b3-853a-31593b467fd4	{"id": "c155c606-f9b2-41b3-853a-31593b467fd4", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365153334, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:45.153334
4c62ab5a-3f9d-4b06-bbcd-7c2088346704	{"id": "4c62ab5a-3f9d-4b06-bbcd-7c2088346704", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365154356, "event_message": "07:42:45.154 request_id=F_GsGzdb9d8NgMcAAAIP [debug] QUERY OK source=\\"tenants\\" db=0.7ms idle=329.8ms"}	07:42:45.154 request_id=F_GsGzdb9d8NgMcAAAIP [debug] QUERY OK source="tenants" db=0.7ms idle=329.8ms	2024-09-03 07:42:45.154356
233b4c19-58d5-4a54-9066-637a2b9369a1	{"id": "233b4c19-58d5-4a54-9066-637a2b9369a1", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349365155529, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:45.155529
0d90dce8-6df9-4717-b271-7f050b04b762	{"id": "0d90dce8-6df9-4717-b271-7f050b04b762", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375204354, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:42:55.204354
a27d4495-453e-4811-bb96-e4d90bc2f5dc	{"id": "a27d4495-453e-4811-bb96-e4d90bc2f5dc", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375205259, "event_message": "07:42:55.204 request_id=F_GsHY50DR4mdT8AAAJP [debug] QUERY OK source=\\"tenants\\" db=0.6ms idle=380.8ms"}	07:42:55.204 request_id=F_GsHY50DR4mdT8AAAJP [debug] QUERY OK source="tenants" db=0.6ms idle=380.8ms	2024-09-03 07:42:55.205259
5eda7741-df6e-4c42-b07d-f504c83a7226	{"id": "5eda7741-df6e-4c42-b07d-f504c83a7226", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349375206562, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:42:55.206562
9c261c0e-d697-4df6-aa4c-8ab8ae9a8bc8	{"id": "9c261c0e-d697-4df6-aa4c-8ab8ae9a8bc8", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385255869, "event_message": "07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [info] HEAD /api/ping"}	07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [info] HEAD /api/ping	2024-09-03 07:43:05.255869
f3cb0259-9385-4d76-a428-3d0df9336629	{"id": "f3cb0259-9385-4d76-a428-3d0df9336629", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385255919, "event_message": "  Pipelines: [:tenant_api]"}	  Pipelines: [:tenant_api]	2024-09-03 07:43:05.255919
ec06e5b4-e459-4f9a-8521-08b41e0f9b09	{"id": "ec06e5b4-e459-4f9a-8521-08b41e0f9b09", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385257406, "event_message": "SELECT t0.\\"id\\", t0.\\"name\\", t0.\\"external_id\\", t0.\\"jwt_secret\\", t0.\\"jwt_jwks\\", t0.\\"postgres_cdc_default\\", t0.\\"max_concurrent_users\\", t0.\\"max_events_per_second\\", t0.\\"max_bytes_per_second\\", t0.\\"max_channels_per_client\\", t0.\\"max_joins_per_second\\", t0.\\"suspend\\", t0.\\"inserted_at\\", t0.\\"updated_at\\" FROM \\"tenants\\" AS t0 WHERE (t0.\\"external_id\\" = $1) [\\"realtime-dev\\"]"}	SELECT t0."id", t0."name", t0."external_id", t0."jwt_secret", t0."jwt_jwks", t0."postgres_cdc_default", t0."max_concurrent_users", t0."max_events_per_second", t0."max_bytes_per_second", t0."max_channels_per_client", t0."max_joins_per_second", t0."suspend", t0."inserted_at", t0."updated_at" FROM "tenants" AS t0 WHERE (t0."external_id" = $1) ["realtime-dev"]	2024-09-03 07:43:05.257406
36a8f5f0-86d9-4b73-b071-bbd28b2a8276	{"id": "36a8f5f0-86d9-4b73-b071-bbd28b2a8276", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385258280, "event_message": "07:43:05.258 request_id=F_GsH-WTxbmEg5sAAAKP [info] Sent 200 in 2ms"}	07:43:05.258 request_id=F_GsH-WTxbmEg5sAAAKP [info] Sent 200 in 2ms	2024-09-03 07:43:05.25828
e94760e5-ad4c-4514-bdad-da8c27803440	{"id": "e94760e5-ad4c-4514-bdad-da8c27803440", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385255913, "event_message": "  Parameters: %{}"}	  Parameters: %{}	2024-09-03 07:43:05.255913
c6143a64-1c04-40d8-9c33-b810ed2279cd	{"id": "c6143a64-1c04-40d8-9c33-b810ed2279cd", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385257374, "event_message": "07:43:05.256 request_id=F_GsH-WTxbmEg5sAAAKP [debug] QUERY OK source=\\"tenants\\" db=0.7ms idle=432.5ms"}	07:43:05.256 request_id=F_GsH-WTxbmEg5sAAAKP [debug] QUERY OK source="tenants" db=0.7ms idle=432.5ms	2024-09-03 07:43:05.257374
ba463a0b-99f2-4d58-bee9-12e60a2d9d06	{"id": "ba463a0b-99f2-4d58-bee9-12e60a2d9d06", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385258190, "event_message": "SELECT e0.\\"id\\", e0.\\"type\\", e0.\\"settings\\", e0.\\"tenant_external_id\\", e0.\\"inserted_at\\", e0.\\"updated_at\\", e0.\\"tenant_external_id\\" FROM \\"extensions\\" AS e0 WHERE (e0.\\"tenant_external_id\\" = $1) ORDER BY e0.\\"tenant_external_id\\" [\\"realtime-dev\\"]"}	SELECT e0."id", e0."type", e0."settings", e0."tenant_external_id", e0."inserted_at", e0."updated_at", e0."tenant_external_id" FROM "extensions" AS e0 WHERE (e0."tenant_external_id" = $1) ORDER BY e0."tenant_external_id" ["realtime-dev"]	2024-09-03 07:43:05.25819
f5ef3a14-0b9e-46d1-9b08-dc792858c8cf	{"id": "f5ef3a14-0b9e-46d1-9b08-dc792858c8cf", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385255907, "event_message": "07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [debug] Processing with RealtimeWeb.PingController.ping/2"}	07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [debug] Processing with RealtimeWeb.PingController.ping/2	2024-09-03 07:43:05.255907
ebf51dfc-3aff-4a21-9227-bae32510083a	{"id": "ebf51dfc-3aff-4a21-9227-bae32510083a", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385255925, "event_message": "07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [warning] Replica region not found, defaulting to Realtime.Repo"}	07:43:05.255 request_id=F_GsH-WTxbmEg5sAAAKP [warning] Replica region not found, defaulting to Realtime.Repo	2024-09-03 07:43:05.255925
1b7b65fb-79e2-4dff-accb-eace392ad72a	{"id": "1b7b65fb-79e2-4dff-accb-eace392ad72a", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349385258135, "event_message": "07:43:05.257 request_id=F_GsH-WTxbmEg5sAAAKP [debug] QUERY OK source=\\"extensions\\" db=0.6ms idle=433.6ms"}	07:43:05.257 request_id=F_GsH-WTxbmEg5sAAAKP [debug] QUERY OK source="extensions" db=0.6ms idle=433.6ms	2024-09-03 07:43:05.258135
6374d6e6-72aa-41a5-beb4-a68015428408	{"id": "6374d6e6-72aa-41a5-beb4-a68015428408", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349225479841, "event_message": "Postgrex.Protocol (#PID<0.3108.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed"}	Postgrex.Protocol (#PID<0.3108.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed	2024-09-03 07:40:25.479841
dcc7627c-8eda-4a6b-91f0-d634b6dc5d30	{"id": "dcc7627c-8eda-4a6b-91f0-d634b6dc5d30", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349225479891, "event_message": "Postgrex.Protocol (#PID<0.3113.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed"}	Postgrex.Protocol (#PID<0.3113.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed	2024-09-03 07:40:25.479891
f3ae97d0-395e-4288-baf1-3b67155943b4	{"id": "f3ae97d0-395e-4288-baf1-3b67155943b4", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230183465, "event_message": "07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [info] Sent 500 in 1ms"}	07:40:30.183 request_id=F_Gr-8p_O6LXLeUAABIB [info] Sent 500 in 1ms	2024-09-03 07:40:30.183465
669b14bf-1821-4a33-aa28-7483b1ef728c	{"id": "669b14bf-1821-4a33-aa28-7483b1ef728c", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349225479908, "event_message": "Postgrex.Protocol (#PID<0.3114.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed"}	Postgrex.Protocol (#PID<0.3114.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed	2024-09-03 07:40:25.479908
408878f9-1138-4d8e-8014-09eadf3dec2f	{"id": "408878f9-1138-4d8e-8014-09eadf3dec2f", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226479871, "event_message": "Postgrex.Protocol (#PID<0.3109.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed"}	Postgrex.Protocol (#PID<0.3109.0>) disconnected: ** (DBConnection.ConnectionError) tcp recv (idle): closed	2024-09-03 07:40:26.479871
3ffdcd2d-1c1b-457e-a7dd-d9a724f50df8	{"id": "3ffdcd2d-1c1b-457e-a7dd-d9a724f50df8", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226482374, "event_message": "Postgrex.Protocol (#PID<0.3109.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3109.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:26.482374
211e85d0-a6cb-4b69-a71f-8499f152f415	{"id": "211e85d0-a6cb-4b69-a71f-8499f152f415", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226504091, "event_message": "Postgrex.Protocol (#PID<0.3112.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3112.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:26.504091
a1e9a699-7934-4bc8-b350-fa9d8a49b295	{"id": "a1e9a699-7934-4bc8-b350-fa9d8a49b295", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226504140, "event_message": "Postgrex.Protocol (#PID<0.3108.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3108.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:26.50414
ba9965ae-31a5-4388-b80d-773a25e77653	{"id": "ba9965ae-31a5-4388-b80d-773a25e77653", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226504144, "event_message": "Postgrex.Protocol (#PID<0.3114.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3114.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:26.504144
f05bcf1c-988d-406f-9020-b10eda303336	{"id": "f05bcf1c-988d-406f-9020-b10eda303336", "appname": "supabase_realtime_brancher", "metadata": {"level": "error", "project": "default", "external_id": "default"}, "timestamp": 1725349226504146, "event_message": "Postgrex.Protocol (#PID<0.3113.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused"}	Postgrex.Protocol (#PID<0.3113.0>) failed to connect: ** (DBConnection.ConnectionError) tcp connect (supabase_db_brancher:5432): connection refused - :econnrefused	2024-09-03 07:40:26.504146
d0bb8010-d4ba-4c88-962a-cc2bd7c1c0b0	{"id": "d0bb8010-d4ba-4c88-962a-cc2bd7c1c0b0", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349230184864, "event_message": "        (ecto_sql 3.11.1) lib/ecto/adapters/sql.ex:1054: Ecto.Adapters.SQL.raise_sql_call_error/1"}	        (ecto_sql 3.11.1) lib/ecto/adapters/sql.ex:1054: Ecto.Adapters.SQL.raise_sql_call_error/1	2024-09-03 07:40:30.184864
b97fe260-0b3f-4634-a594-323bf8c697f4	{"id": "b97fe260-0b3f-4634-a594-323bf8c697f4", "appname": "supabase_realtime_brancher", "metadata": {"level": "notice", "project": "default", "external_id": "default"}, "timestamp": 1725349243038785, "event_message": "SIGTERM received - shutting down"}	SIGTERM received - shutting down	2024-09-03 07:40:43.038785
c09f5a38-caa7-4b68-afb6-9b6d8cbc72ab	{"id": "c09f5a38-caa7-4b68-afb6-9b6d8cbc72ab", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480773, "event_message": "+ ulimit -n"}	+ ulimit -n	2024-09-03 07:40:44.480773
fc296768-7e59-4ffd-ae0c-4b4f06f73835	{"id": "fc296768-7e59-4ffd-ae0c-4b4f06f73835", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480814, "event_message": "1048576"}	1048576	2024-09-03 07:40:44.480814
eb607d89-3d5f-4f45-a513-3765edfe35a9	{"id": "eb607d89-3d5f-4f45-a513-3765edfe35a9", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480834, "event_message": "Setting RLIMIT_NOFILE to 10000"}	Setting RLIMIT_NOFILE to 10000	2024-09-03 07:40:44.480834
71d63505-1673-409b-9099-ee21275a408c	{"id": "71d63505-1673-409b-9099-ee21275a408c", "appname": "supabase_realtime_brancher", "metadata": {"project": "default", "external_id": "default"}, "timestamp": 1725349244480845, "event_message": "+ echo 'Setting RLIMIT_NOFILE to 10000'"}	+ echo 'Setting RLIMIT_NOFILE to 10000'	2024-09-03 07:40:44.480845
\.


--
-- Data for Name: log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4 (id, body, event_message, "timestamp") FROM stdin;
\.


--
-- Data for Name: log_events_9cae37bf_dd53_416a_834c_802c1ca62646; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_9cae37bf_dd53_416a_834c_802c1ca62646 (id, body, event_message, "timestamp") FROM stdin;
\.


--
-- Data for Name: log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0 (id, body, event_message, "timestamp") FROM stdin;
7a7cc9b6-8160-4615-8e27-c14f56d3434b	{"id": "7a7cc9b6-8160-4615-8e27-c14f56d3434b", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "received graceful shutdown signal", "time": "2024-09-03T07:40:43Z", "level": "info", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243037928, "event_message": "{\\"level\\":\\"info\\",\\"msg\\":\\"received graceful shutdown signal\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"level":"info","msg":"received graceful shutdown signal","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.037928
edfefd11-28ac-4720-9ea0-d748ef557088	{"id": "edfefd11-28ac-4720-9ea0-d748ef557088", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "received graceful shutdown signal", "time": "2024-09-03T07:40:43Z", "level": "info", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243037928, "event_message": "{\\"level\\":\\"info\\",\\"msg\\":\\"received graceful shutdown signal\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"level":"info","msg":"received graceful shutdown signal","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.037928
ba423012-7f9c-4f38-bc66-0e9220607ad3	{"id": "ba423012-7f9c-4f38-bc66-0e9220607ad3", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "Go runtime metrics collection started", "time": "2024-09-03T07:40:43Z", "level": "info", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243567469, "event_message": "{\\"level\\":\\"info\\",\\"msg\\":\\"Go runtime metrics collection started\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"level":"info","msg":"Go runtime metrics collection started","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.567469
297c5f67-286d-4300-8ad6-6b1a82cd3ffb	{"id": "297c5f67-286d-4300-8ad6-6b1a82cd3ffb", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "Migrations already up to date, nothing to apply", "time": "2024-09-03T07:40:43Z", "level": "info", "component": "pop", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243593414, "event_message": "{\\"component\\":\\"pop\\",\\"level\\":\\"info\\",\\"msg\\":\\"Migrations already up to date, nothing to apply\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"component":"pop","level":"info","msg":"Migrations already up to date, nothing to apply","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.593414
72291ca8-e28f-47e7-9e30-a3b353e8da5b	{"id": "72291ca8-e28f-47e7-9e30-a3b353e8da5b", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "%.4f seconds", "args": [0.024970025], "time": "2024-09-03T07:40:43Z", "level": "info", "component": "pop", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243593476, "event_message": "{\\"args\\":[0.024970025],\\"component\\":\\"pop\\",\\"level\\":\\"info\\",\\"msg\\":\\"%.4f seconds\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"args":[0.024970025],"component":"pop","level":"info","msg":"%.4f seconds","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.593476
39b6395b-b652-443e-a8ca-e6f584b9b27c	{"id": "39b6395b-b652-443e-a8ca-e6f584b9b27c", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "GoTrue migrations applied successfully", "time": "2024-09-03T07:40:43Z", "level": "info", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243593487, "event_message": "{\\"level\\":\\"info\\",\\"msg\\":\\"GoTrue migrations applied successfully\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"level":"info","msg":"GoTrue migrations applied successfully","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.593487
3d16b743-3bcc-4bc1-9d66-66155c302654	{"id": "3d16b743-3bcc-4bc1-9d66-66155c302654", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "DEPRECATION NOTICE: GOTRUE_JWT_ADMIN_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon", "time": "2024-09-03T07:40:43Z", "level": "warning", "component": "api", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243595321, "event_message": "{\\"component\\":\\"api\\",\\"level\\":\\"warning\\",\\"msg\\":\\"DEPRECATION NOTICE: GOTRUE_JWT_ADMIN_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"component":"api","level":"warning","msg":"DEPRECATION NOTICE: GOTRUE_JWT_ADMIN_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.595321
3e118027-8a76-4349-9d50-5e1e9654a915	{"id": "3e118027-8a76-4349-9d50-5e1e9654a915", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "DEPRECATION NOTICE: GOTRUE_JWT_DEFAULT_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon", "time": "2024-09-03T07:40:43Z", "level": "warning", "component": "api", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243595357, "event_message": "{\\"component\\":\\"api\\",\\"level\\":\\"warning\\",\\"msg\\":\\"DEPRECATION NOTICE: GOTRUE_JWT_DEFAULT_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"component":"api","level":"warning","msg":"DEPRECATION NOTICE: GOTRUE_JWT_DEFAULT_GROUP_NAME not supported by Supabase's GoTrue, will be removed soon","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.595357
3728769c-0105-4205-b88f-d4a856895d04	{"id": "3728769c-0105-4205-b88f-d4a856895d04", "appname": "supabase_auth_brancher", "project": "default", "metadata": {"msg": "GoTrue API started on: 0.0.0.0:9999", "time": "2024-09-03T07:40:43Z", "level": "info", "timestamp": "2024-09-03T07:40:43Z"}, "timestamp": 1725349243598305, "event_message": "{\\"level\\":\\"info\\",\\"msg\\":\\"GoTrue API started on: 0.0.0.0:9999\\",\\"time\\":\\"2024-09-03T07:40:43Z\\"}"}	{"level":"info","msg":"GoTrue API started on: 0.0.0.0:9999","time":"2024-09-03T07:40:43Z"}	2024-09-03 07:40:43.598305
\.


--
-- Data for Name: log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da (id, body, event_message, "timestamp") FROM stdin;
\.


--
-- Data for Name: log_events_d87540bb_882e_4304_9bec_7172047840e5; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.log_events_d87540bb_882e_4304_9bec_7172047840e5 (id, body, event_message, "timestamp") FROM stdin;
2140a7ae-daba-4f21-a0c9-0250750b3b09	{"id": "2140a7ae-daba-4f21-a0c9-0250750b3b09", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349232000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:32
088902be-5cd3-45ed-b604-7b4b35dd00fc	{"id": "088902be-5cd3-45ed-b604-7b4b35dd00fc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349225000000, "event_message": "Failed listening for notifications on the \\"pgrst\\" channel. server closed the connection unexpectedly This probably means the server terminated abnormally before or while processing the request."}	Failed listening for notifications on the "pgrst" channel. server closed the connection unexpectedly This probably means the server terminated abnormally before or while processing the request.	2024-09-03 07:40:25
3e1203b2-187a-4b71-819a-87f63eec7730	{"id": "3e1203b2-187a-4b71-819a-87f63eec7730", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:36
1e372ff4-66dc-4ba0-889c-e6c0d05a2275	{"id": "1e372ff4-66dc-4ba0-889c-e6c0d05a2275", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349232000000, "event_message": "Schema cache queried in 6.1 milliseconds"}	Schema cache queried in 6.1 milliseconds	2024-09-03 07:40:32
497ee45a-ae95-465f-89bc-e9bfb32fbb28	{"id": "497ee45a-ae95-465f-89bc-e9bfb32fbb28", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
3707885b-7d0f-42d2-9e05-fa2cd911e6ff	{"id": "3707885b-7d0f-42d2-9e05-fa2cd911e6ff", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349225000000, "event_message": "Retrying listening for notifications in 1 seconds..."}	Retrying listening for notifications in 1 seconds...	2024-09-03 07:40:25
06723900-38bb-46d2-8c46-cdbecd522850	{"id": "06723900-38bb-46d2-8c46-cdbecd522850", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349232000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:32
bd9b64bd-5386-4e5d-a9e0-fb4a2ee1cfc6	{"id": "bd9b64bd-5386-4e5d-a9e0-fb4a2ee1cfc6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:36
09f21593-3cc1-4243-af9e-7f0f9daf05ea	{"id": "09f21593-3cc1-4243-af9e-7f0f9daf05ea", "appname": "supabase_rest_brancher", "project": "default", "timestamp": 1725349226054045, "event_message": "03/Sep/2024:07:40:26 +0000: Failed listening for notifications on the \\"pgrst\\" channel. Just \\"connection to server at \\\\\\"supabase_db_brancher\\\\\\" (172.19.0.2), port 5432 failed: Connection refused\\\\n\\\\tIs the server running on that host and accepting TCP/IP connections?\\\\n\\""}	03/Sep/2024:07:40:26 +0000: Failed listening for notifications on the "pgrst" channel. Just "connection to server at \\"supabase_db_brancher\\" (172.19.0.2), port 5432 failed: Connection refused\\n\\tIs the server running on that host and accepting TCP/IP connections?\\n"	2024-09-03 07:40:26.054045
e7253b5b-68f8-444f-9b61-035c267eb385	{"id": "e7253b5b-68f8-444f-9b61-035c267eb385", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349233000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:33
fa5d5960-56ef-4419-98c9-655394acb7d2	{"id": "fa5d5960-56ef-4419-98c9-655394acb7d2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b7f1e54f-bfeb-4166-9f8c-83dad6432046	{"id": "b7f1e54f-bfeb-4166-9f8c-83dad6432046", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349226000000, "event_message": "Failed listening for notifications on the \\"pgrst\\" channel. ExitFailure 1"}	Failed listening for notifications on the "pgrst" channel. ExitFailure 1	2024-09-03 07:40:26
654ac568-1261-46bd-a4fe-44b1ceacafe8	{"id": "654ac568-1261-46bd-a4fe-44b1ceacafe8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349233000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:33
4f13e323-b879-459c-bf00-c32bceb32649	{"id": "4f13e323-b879-459c-bf00-c32bceb32649", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349226000000, "event_message": "Retrying listening for notifications in 2 seconds..."}	Retrying listening for notifications in 2 seconds...	2024-09-03 07:40:26
4ef41bfe-e984-4876-8930-9f0f813f6513	{"id": "4ef41bfe-e984-4876-8930-9f0f813f6513", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d62a0df8-bfbf-4736-b70b-aa6bbe357e70	{"id": "d62a0df8-bfbf-4736-b70b-aa6bbe357e70", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349233000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:33
6b4f1024-b6c1-4e57-8c26-f4ac30c462f6	{"id": "6b4f1024-b6c1-4e57-8c26-f4ac30c462f6", "appname": "supabase_rest_brancher", "project": "default", "timestamp": 1725349228056957, "event_message": "03/Sep/2024:07:40:28 +0000: Failed listening for notifications on the \\"pgrst\\" channel. Just \\"connection to server at \\\\\\"supabase_db_brancher\\\\\\" (172.19.0.2), port 5432 failed: Connection refused\\\\n\\\\tIs the server running on that host and accepting TCP/IP connections?\\\\n\\""}	03/Sep/2024:07:40:28 +0000: Failed listening for notifications on the "pgrst" channel. Just "connection to server at \\"supabase_db_brancher\\" (172.19.0.2), port 5432 failed: Connection refused\\n\\tIs the server running on that host and accepting TCP/IP connections?\\n"	2024-09-03 07:40:28.056957
26d48457-581e-4e7c-a653-dbefea8fef5a	{"id": "26d48457-581e-4e7c-a653-dbefea8fef5a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
32be700f-e01c-4861-943e-40ddbe354403	{"id": "32be700f-e01c-4861-943e-40ddbe354403", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a168ab07-59bf-440f-88db-af3f49a57ba1	{"id": "a168ab07-59bf-440f-88db-af3f49a57ba1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
6b772df8-4cef-4113-bbc4-39dd5e6728ae	{"id": "6b772df8-4cef-4113-bbc4-39dd5e6728ae", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
10a7cf22-d9dc-4666-8ecd-aff9bf69433a	{"id": "10a7cf22-d9dc-4666-8ecd-aff9bf69433a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349232000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:32
3d3d61d1-6ef5-4e8f-9aa9-0b66fadc65a1	{"id": "3d3d61d1-6ef5-4e8f-9aa9-0b66fadc65a1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5d821d28-bc2c-49b8-a3ed-788b3ebabe73	{"id": "5d821d28-bc2c-49b8-a3ed-788b3ebabe73", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
0dc5f290-819e-49ec-a467-c4b74f08a3e9	{"id": "0dc5f290-819e-49ec-a467-c4b74f08a3e9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
3e0c00d3-0cc1-4aaa-9fd7-502453af8742	{"id": "3e0c00d3-0cc1-4aaa-9fd7-502453af8742", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
1e554073-f4b2-47b9-bc7c-677974f6904d	{"id": "1e554073-f4b2-47b9-bc7c-677974f6904d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
978ea793-61e3-4fdb-96a1-370086b947eb	{"id": "978ea793-61e3-4fdb-96a1-370086b947eb", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
bfdffc1b-10e0-426f-9227-c669e7f1cf22	{"id": "bfdffc1b-10e0-426f-9227-c669e7f1cf22", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
aac4b8c4-a987-4bf7-b42b-4644360d6cd6	{"id": "aac4b8c4-a987-4bf7-b42b-4644360d6cd6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5c9809b1-b7ec-41a1-af60-e80980671334	{"id": "5c9809b1-b7ec-41a1-af60-e80980671334", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:36
810c5963-f8dd-432b-b5e3-8795017bb8b5	{"id": "810c5963-f8dd-432b-b5e3-8795017bb8b5", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache queried in 10.6 milliseconds"}	Schema cache queried in 10.6 milliseconds	2024-09-03 07:40:36
7adf49db-b9c7-474b-90da-c3ed1b9ff50f	{"id": "7adf49db-b9c7-474b-90da-c3ed1b9ff50f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:36
6b2dce66-9d7c-4463-9475-332e1a1ee051	{"id": "6b2dce66-9d7c-4463-9475-332e1a1ee051", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5489e811-a7f6-4153-93ca-2128a19a9f31	{"id": "5489e811-a7f6-4153-93ca-2128a19a9f31", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5db5898e-99d2-4523-90be-495b3173d5ce	{"id": "5db5898e-99d2-4523-90be-495b3173d5ce", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
407c75ac-d263-466e-a4d8-6ff8b9a2eadf	{"id": "407c75ac-d263-466e-a4d8-6ff8b9a2eadf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349233000000, "event_message": "Schema cache queried in 5.7 milliseconds"}	Schema cache queried in 5.7 milliseconds	2024-09-03 07:40:33
b79fb9b4-f0c8-4f1f-9d9f-4ce1924d82c6	{"id": "b79fb9b4-f0c8-4f1f-9d9f-4ce1924d82c6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349233000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:33
5e809645-2a8b-4ca5-8a3c-e1a5de1dfefa	{"id": "5e809645-2a8b-4ca5-8a3c-e1a5de1dfefa", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
8301b60e-4b61-4033-80ae-41c8a6654477	{"id": "8301b60e-4b61-4033-80ae-41c8a6654477", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
cc10ea03-9731-4c95-b5c7-bd8b16388cfe	{"id": "cc10ea03-9731-4c95-b5c7-bd8b16388cfe", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache queried in 7.9 milliseconds"}	Schema cache queried in 7.9 milliseconds	2024-09-03 07:40:36
1a6d4c58-3b46-4196-8da1-2f7b3e5db0d5	{"id": "1a6d4c58-3b46-4196-8da1-2f7b3e5db0d5", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:36
fab74104-e48b-4fbe-af24-9f500e4dd754	{"id": "fab74104-e48b-4fbe-af24-9f500e4dd754", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d54a3a37-708e-41b2-b03b-256ad4138130	{"id": "d54a3a37-708e-41b2-b03b-256ad4138130", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d6aee329-f110-49be-872f-d73065a253fa	{"id": "d6aee329-f110-49be-872f-d73065a253fa", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
612c1c82-ad3d-4fe8-afd4-7a22bc6d5893	{"id": "612c1c82-ad3d-4fe8-afd4-7a22bc6d5893", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
ddc9d023-4001-4146-b5d6-680c902c68bc	{"id": "ddc9d023-4001-4146-b5d6-680c902c68bc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a73e451f-e0f3-4956-936c-297cf508538e	{"id": "a73e451f-e0f3-4956-936c-297cf508538e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
c5b91340-1e3f-4380-b669-8eeac4918e27	{"id": "c5b91340-1e3f-4380-b669-8eeac4918e27", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b9a25ca3-945f-454f-80c5-a6538038dd74	{"id": "b9a25ca3-945f-454f-80c5-a6538038dd74", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
39109a60-a496-4428-9b25-69d19d48f11f	{"id": "39109a60-a496-4428-9b25-69d19d48f11f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
24dac7fb-3acd-4fde-8315-2e629c527daa	{"id": "24dac7fb-3acd-4fde-8315-2e629c527daa", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
843dc266-2c86-4951-9541-8e7439f0987b	{"id": "843dc266-2c86-4951-9541-8e7439f0987b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a16fa312-0ccc-4747-aef1-a3548b303f54	{"id": "a16fa312-0ccc-4747-aef1-a3548b303f54", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d47de6ca-4751-4931-9b82-2a4f25bdd984	{"id": "d47de6ca-4751-4931-9b82-2a4f25bdd984", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d6f00e25-91ff-4a2f-9dc3-4446fd7381d3	{"id": "d6f00e25-91ff-4a2f-9dc3-4446fd7381d3", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349228000000, "event_message": "Failed listening for notifications on the \\"pgrst\\" channel. ExitFailure 1"}	Failed listening for notifications on the "pgrst" channel. ExitFailure 1	2024-09-03 07:40:28
50488057-6aeb-41f2-b08d-2feb386b6421	{"id": "50488057-6aeb-41f2-b08d-2feb386b6421", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349228000000, "event_message": "Retrying listening for notifications in 4 seconds..."}	Retrying listening for notifications in 4 seconds...	2024-09-03 07:40:28
e9cb2ea3-8cd7-40b7-b55a-e263bf8f1ad3	{"id": "e9cb2ea3-8cd7-40b7-b55a-e263bf8f1ad3", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349232000000, "event_message": "Listening for notifications on the \\"pgrst\\" channel"}	Listening for notifications on the "pgrst" channel	2024-09-03 07:40:32
fe365fa8-8d3e-4ab5-a4e8-303ffb10898b	{"id": "fe365fa8-8d3e-4ab5-a4e8-303ffb10898b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
47d990b8-fe3a-4e46-9281-343deb27ec89	{"id": "47d990b8-fe3a-4e46-9281-343deb27ec89", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:36
6bda30ad-2c86-4c8a-9cc9-5fe0b2fb8a33	{"id": "6bda30ad-2c86-4c8a-9cc9-5fe0b2fb8a33", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
7400b6aa-cc1e-4bbd-87b0-372e2fd83c24	{"id": "7400b6aa-cc1e-4bbd-87b0-372e2fd83c24", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
272c4acf-9738-4543-84f4-dee8538cc124	{"id": "272c4acf-9738-4543-84f4-dee8538cc124", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d5496e47-e807-435a-864d-1cfcc9769f9b	{"id": "d5496e47-e807-435a-864d-1cfcc9769f9b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
8c860973-b8c6-4d0f-892f-223c20250b7b	{"id": "8c860973-b8c6-4d0f-892f-223c20250b7b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
daae8b64-81e2-4243-955c-994aa9291db9	{"id": "daae8b64-81e2-4243-955c-994aa9291db9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
2c1aba3e-4be6-4495-9936-029c2a428678	{"id": "2c1aba3e-4be6-4495-9936-029c2a428678", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
cdc093c7-65cd-445d-b3be-e1e899bb7081	{"id": "cdc093c7-65cd-445d-b3be-e1e899bb7081", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
ce73d696-7deb-48ef-a38d-a5defdc75e47	{"id": "ce73d696-7deb-48ef-a38d-a5defdc75e47", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
1c0da057-8584-43ab-ae5d-24ea5525557d	{"id": "1c0da057-8584-43ab-ae5d-24ea5525557d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a937ef1e-8ef4-4e78-9f6e-3934fc31262b	{"id": "a937ef1e-8ef4-4e78-9f6e-3934fc31262b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
097f06eb-0c0d-4a31-9a98-315ac8ae25c3	{"id": "097f06eb-0c0d-4a31-9a98-315ac8ae25c3", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
aef59784-b299-4881-9f7d-38fc8e745fcc	{"id": "aef59784-b299-4881-9f7d-38fc8e745fcc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
cdf0c6a0-3eb5-47a6-a63b-71cf78bf951e	{"id": "cdf0c6a0-3eb5-47a6-a63b-71cf78bf951e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5f6d3ab4-1620-498b-8054-8477a0995801	{"id": "5f6d3ab4-1620-498b-8054-8477a0995801", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
f07e7eea-9caf-44cd-b083-334a23fdf139	{"id": "f07e7eea-9caf-44cd-b083-334a23fdf139", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
748a4d89-d7a9-4ab9-af20-50d6668dde14	{"id": "748a4d89-d7a9-4ab9-af20-50d6668dde14", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
9f20b506-3599-4308-ba84-fec1ea315c69	{"id": "9f20b506-3599-4308-ba84-fec1ea315c69", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
f464b0a1-b0f1-407b-9b90-cc3a4c073af6	{"id": "f464b0a1-b0f1-407b-9b90-cc3a4c073af6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5dfd1039-4742-4d03-89f2-5cdd5f15948a	{"id": "5dfd1039-4742-4d03-89f2-5cdd5f15948a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
64147f12-2200-4769-8c45-55586b564505	{"id": "64147f12-2200-4769-8c45-55586b564505", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
44fd6b39-2e15-4301-bfae-3be5cc890bc6	{"id": "44fd6b39-2e15-4301-bfae-3be5cc890bc6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
7486b866-85b9-43f1-8624-d81f7f38dc67	{"id": "7486b866-85b9-43f1-8624-d81f7f38dc67", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
eb548956-9ba5-4e02-a431-b5a28038b429	{"id": "eb548956-9ba5-4e02-a431-b5a28038b429", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
86966153-4108-4369-a639-a9ce8c297eb9	{"id": "86966153-4108-4369-a639-a9ce8c297eb9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
8eb4a617-be78-4a5e-b741-4e0fd097ff3c	{"id": "8eb4a617-be78-4a5e-b741-4e0fd097ff3c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache queried in 9.1 milliseconds"}	Schema cache queried in 9.1 milliseconds	2024-09-03 07:40:36
2ef260e3-5f3a-4e07-a084-f65f3ee13c99	{"id": "2ef260e3-5f3a-4e07-a084-f65f3ee13c99", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:36
d88d02a7-a57b-491d-889f-fbb8eafe8dc1	{"id": "d88d02a7-a57b-491d-889f-fbb8eafe8dc1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
352a31b4-210a-4815-b8ff-dace1fea2029	{"id": "352a31b4-210a-4815-b8ff-dace1fea2029", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5701dcda-5680-4418-b85b-931c90323c50	{"id": "5701dcda-5680-4418-b85b-931c90323c50", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
e7b44b4d-57a5-472a-9f08-59317e3294cf	{"id": "e7b44b4d-57a5-472a-9f08-59317e3294cf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5044a2e3-1226-427d-af7e-2109d3deaa99	{"id": "5044a2e3-1226-427d-af7e-2109d3deaa99", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
94f35cef-58b8-4068-bbc0-e0faf35276b3	{"id": "94f35cef-58b8-4068-bbc0-e0faf35276b3", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:36
26a07d7c-85bc-469a-927b-5ecf4598e321	{"id": "26a07d7c-85bc-469a-927b-5ecf4598e321", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:36
dca9e4cc-ec06-4521-9a5f-aa256c9b8f53	{"id": "dca9e4cc-ec06-4521-9a5f-aa256c9b8f53", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache queried in 7.4 milliseconds"}	Schema cache queried in 7.4 milliseconds	2024-09-03 07:40:36
bd9d0fd9-9c1e-4979-bfca-54adb0424464	{"id": "bd9d0fd9-9c1e-4979-bfca-54adb0424464", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
4fa75819-1dff-45e1-a3ae-1b01dfa2ac64	{"id": "4fa75819-1dff-45e1-a3ae-1b01dfa2ac64", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a5298c11-346a-447f-af00-7fad7aa6522a	{"id": "a5298c11-346a-447f-af00-7fad7aa6522a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
36d2a911-edaf-49b6-a6e7-ff6a49708e3c	{"id": "36d2a911-edaf-49b6-a6e7-ff6a49708e3c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
84e0e923-c4c2-4bc9-a725-be4fab2fc1ed	{"id": "84e0e923-c4c2-4bc9-a725-be4fab2fc1ed", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
168f26b8-4201-4a77-9017-a894bb11409b	{"id": "168f26b8-4201-4a77-9017-a894bb11409b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d7a140da-92f5-4ccb-a5ed-34dd0179d717	{"id": "d7a140da-92f5-4ccb-a5ed-34dd0179d717", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
5c390b1f-b4b4-4888-85b0-f80107654432	{"id": "5c390b1f-b4b4-4888-85b0-f80107654432", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
f4f4ccb9-94ab-4702-b297-231f5af655d6	{"id": "f4f4ccb9-94ab-4702-b297-231f5af655d6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
326179ca-b1aa-4906-a231-f72ae8df8075	{"id": "326179ca-b1aa-4906-a231-f72ae8df8075", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
cc74ee0b-0ef3-45a4-97cf-f8edb6030d75	{"id": "cc74ee0b-0ef3-45a4-97cf-f8edb6030d75", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
e16f3346-289a-489a-8cc4-caa0cd873efb	{"id": "e16f3346-289a-489a-8cc4-caa0cd873efb", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
ccd270a1-d7c8-4b5d-b0d0-5db2eae1e349	{"id": "ccd270a1-d7c8-4b5d-b0d0-5db2eae1e349", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
efc00597-e600-4e4b-afc0-bd94e591d184	{"id": "efc00597-e600-4e4b-afc0-bd94e591d184", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
8187f83a-4de1-4b68-a81b-ab9c333faabe	{"id": "8187f83a-4de1-4b68-a81b-ab9c333faabe", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
788d4c1c-b6b8-4ea6-b75f-e472115cd5a1	{"id": "788d4c1c-b6b8-4ea6-b75f-e472115cd5a1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
3b293008-6173-47fb-8e35-75e4532e4318	{"id": "3b293008-6173-47fb-8e35-75e4532e4318", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
bf6c074d-f7d2-4caf-a21e-358dc1362304	{"id": "bf6c074d-f7d2-4caf-a21e-358dc1362304", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d362291d-ecf6-4c32-8554-416e749736b1	{"id": "d362291d-ecf6-4c32-8554-416e749736b1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b8bd1f5d-c60a-4035-ad3a-faabe0ea5181	{"id": "b8bd1f5d-c60a-4035-ad3a-faabe0ea5181", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b1ac85c7-4b0b-435d-a055-b0e6d02052c4	{"id": "b1ac85c7-4b0b-435d-a055-b0e6d02052c4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b2d0dc3a-2bc6-44f9-9f58-ad2c40bdba7c	{"id": "b2d0dc3a-2bc6-44f9-9f58-ad2c40bdba7c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
6a8def9d-7127-42f6-9aad-2bf665e7c4ad	{"id": "6a8def9d-7127-42f6-9aad-2bf665e7c4ad", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
ba97e3b4-07f5-4d20-bc61-85e91c327684	{"id": "ba97e3b4-07f5-4d20-bc61-85e91c327684", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:36
d1d593ea-c424-42b6-98b7-b94192f13f06	{"id": "d1d593ea-c424-42b6-98b7-b94192f13f06", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
c36da11a-bd36-41cf-a843-e9247aadf33a	{"id": "c36da11a-bd36-41cf-a843-e9247aadf33a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
4cf34435-5711-4136-96ce-b150303c4ee7	{"id": "4cf34435-5711-4136-96ce-b150303c4ee7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:36
38f86282-6ab9-494f-95da-0051d892dff6	{"id": "38f86282-6ab9-494f-95da-0051d892dff6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
cea780d4-b992-46dc-a589-1f814998a010	{"id": "cea780d4-b992-46dc-a589-1f814998a010", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
2c71826b-2c7e-4c92-a608-16d65bb77ae7	{"id": "2c71826b-2c7e-4c92-a608-16d65bb77ae7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
95629bef-a9f8-46f8-ab2d-4c6ed2bb4905	{"id": "95629bef-a9f8-46f8-ab2d-4c6ed2bb4905", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b11261f1-686e-468b-84e5-4bfab9692046	{"id": "b11261f1-686e-468b-84e5-4bfab9692046", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
4eda2828-5113-4ebb-828a-6e319045690b	{"id": "4eda2828-5113-4ebb-828a-6e319045690b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
8f60b4f5-c951-4dcf-bfaf-ccb9273bfef7	{"id": "8f60b4f5-c951-4dcf-bfaf-ccb9273bfef7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
d4bfdd21-5420-4fd5-a58d-6d504770784d	{"id": "d4bfdd21-5420-4fd5-a58d-6d504770784d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
36797f0f-ad65-41ae-a1f1-4e525e38a1c2	{"id": "36797f0f-ad65-41ae-a1f1-4e525e38a1c2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
258589ec-3333-4d7b-9fd2-cd16055279c8	{"id": "258589ec-3333-4d7b-9fd2-cd16055279c8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
9c95c179-2a7e-4cfb-a86a-1aad56189905	{"id": "9c95c179-2a7e-4cfb-a86a-1aad56189905", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
1180ac1b-c42b-4d96-b814-ba8936c5801b	{"id": "1180ac1b-c42b-4d96-b814-ba8936c5801b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
ac72960d-9bf4-47b2-b752-8014c42656b0	{"id": "ac72960d-9bf4-47b2-b752-8014c42656b0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
614869cb-c170-4b3c-abcf-ac8a90699e8d	{"id": "614869cb-c170-4b3c-abcf-ac8a90699e8d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
b127692d-aa59-4ab7-94a2-ea1dfa5a4e66	{"id": "b127692d-aa59-4ab7-94a2-ea1dfa5a4e66", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
f1246eeb-2156-4f8f-9d09-a04d33899b71	{"id": "f1246eeb-2156-4f8f-9d09-a04d33899b71", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
a0659239-5e61-4ad8-bc71-c9cfb82bb21a	{"id": "a0659239-5e61-4ad8-bc71-c9cfb82bb21a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
257c52c8-986b-4ee3-a5ae-9c0ad0e1f891	{"id": "257c52c8-986b-4ee3-a5ae-9c0ad0e1f891", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
02898bb3-a1d2-4c0c-8021-91134da0a76a	{"id": "02898bb3-a1d2-4c0c-8021-91134da0a76a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:37
428777de-ad5b-440f-b14f-a190d4b5db11	{"id": "428777de-ad5b-440f-b14f-a190d4b5db11", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
7bee00ff-c10b-465a-8f54-a7c6fd9d8e62	{"id": "7bee00ff-c10b-465a-8f54-a7c6fd9d8e62", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
94735cec-ef24-4cd4-9548-ac56cd453a2a	{"id": "94735cec-ef24-4cd4-9548-ac56cd453a2a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
d04c4523-b5e0-4c3e-a4e5-2ea9df4d55c7	{"id": "d04c4523-b5e0-4c3e-a4e5-2ea9df4d55c7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
a8aa26bf-da7c-4fd1-a351-6473d3021d95	{"id": "a8aa26bf-da7c-4fd1-a351-6473d3021d95", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
f46d9ab6-7abb-48cb-9030-a0f50b7d3165	{"id": "f46d9ab6-7abb-48cb-9030-a0f50b7d3165", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
62b8b1c5-daf5-4443-873a-1048aadb71ed	{"id": "62b8b1c5-daf5-4443-873a-1048aadb71ed", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
4d5f9d05-3ba0-4c43-8cb5-57886a816238	{"id": "4d5f9d05-3ba0-4c43-8cb5-57886a816238", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
2e12c3b2-697a-4876-9798-4eef4ce6d21c	{"id": "2e12c3b2-697a-4876-9798-4eef4ce6d21c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
984aa41a-61b1-4b2c-aa7c-ee9ead9ce7f9	{"id": "984aa41a-61b1-4b2c-aa7c-ee9ead9ce7f9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
a14b3fb9-7ea6-432f-853e-e7ae80fd498e	{"id": "a14b3fb9-7ea6-432f-853e-e7ae80fd498e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
05fc7c05-8901-4cc0-b4d3-034d2e84976d	{"id": "05fc7c05-8901-4cc0-b4d3-034d2e84976d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
4e8d310c-206a-4303-958a-ff34991a5249	{"id": "4e8d310c-206a-4303-958a-ff34991a5249", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
cce2275d-b3a6-48b7-b887-a704f2bb4861	{"id": "cce2275d-b3a6-48b7-b887-a704f2bb4861", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:39
b4942540-4362-4c67-ab6c-4343d2f827b7	{"id": "b4942540-4362-4c67-ab6c-4343d2f827b7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
f750f9f7-2119-42b2-b5e3-f746665ba13b	{"id": "f750f9f7-2119-42b2-b5e3-f746665ba13b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:37
caea7d2c-a555-4c8a-a5de-7c98dea0b216	{"id": "caea7d2c-a555-4c8a-a5de-7c98dea0b216", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:37
d781cc25-39fe-4851-92e1-69a24fdb5fc7	{"id": "d781cc25-39fe-4851-92e1-69a24fdb5fc7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:37
35cb4987-51b1-437e-9ce1-75ae7e0a1721	{"id": "35cb4987-51b1-437e-9ce1-75ae7e0a1721", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Schema cache queried in 4.5 milliseconds"}	Schema cache queried in 4.5 milliseconds	2024-09-03 07:40:37
e56c670a-13f1-409d-8af4-07bc6a5e3252	{"id": "e56c670a-13f1-409d-8af4-07bc6a5e3252", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
0562b80f-e915-4ead-9cd7-0d09044de0fc	{"id": "0562b80f-e915-4ead-9cd7-0d09044de0fc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
193eaea3-12fc-43b6-bb2f-e422538dd3cd	{"id": "193eaea3-12fc-43b6-bb2f-e422538dd3cd", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:39
99a7fdc4-9cce-447a-b2ef-1728046a0f72	{"id": "99a7fdc4-9cce-447a-b2ef-1728046a0f72", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:39
f822f73d-1649-4aab-84c0-14aae4f5b358	{"id": "f822f73d-1649-4aab-84c0-14aae4f5b358", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
1cae8175-a006-4edb-adaa-2d0353cb7743	{"id": "1cae8175-a006-4edb-adaa-2d0353cb7743", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:37
5eca07c6-b6df-44d5-aadb-a0ea6dd20aac	{"id": "5eca07c6-b6df-44d5-aadb-a0ea6dd20aac", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
7713307e-599f-4982-a6d5-05bfee8ecadb	{"id": "7713307e-599f-4982-a6d5-05bfee8ecadb", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
8489d1c7-cda0-4c01-aa95-c48b88175802	{"id": "8489d1c7-cda0-4c01-aa95-c48b88175802", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:39
8af2d9f4-6be9-4890-be92-779748ae38f8	{"id": "8af2d9f4-6be9-4890-be92-779748ae38f8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
12f6ae25-8630-42de-bb87-cd17957a4c09	{"id": "12f6ae25-8630-42de-bb87-cd17957a4c09", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
6735b834-66ee-4874-b762-06bb6debbb7a	{"id": "6735b834-66ee-4874-b762-06bb6debbb7a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
41235b7e-0148-46d5-ae83-0998f5f1cfe8	{"id": "41235b7e-0148-46d5-ae83-0998f5f1cfe8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
d1903533-82a5-4d6f-9e23-2697a36a4da4	{"id": "d1903533-82a5-4d6f-9e23-2697a36a4da4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
1156a53f-00e4-4743-94a9-d07d4dfd590b	{"id": "1156a53f-00e4-4743-94a9-d07d4dfd590b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:36
14e7a4ef-70b8-458c-a9eb-1a9853263223	{"id": "14e7a4ef-70b8-458c-a9eb-1a9853263223", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349236000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:36
233f70d9-2518-4145-b5a7-6437369876fb	{"id": "233f70d9-2518-4145-b5a7-6437369876fb", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
ba6e67ed-8751-4c4d-ac79-e078dd0fe0c1	{"id": "ba6e67ed-8751-4c4d-ac79-e078dd0fe0c1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
f405be6f-ebd6-436a-8fdf-fa39fe1f6bac	{"id": "f405be6f-ebd6-436a-8fdf-fa39fe1f6bac", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
73b6b45e-4272-40d2-9e5a-e51b45657978	{"id": "73b6b45e-4272-40d2-9e5a-e51b45657978", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:37
523a38c4-270a-46f2-8441-3f401d487565	{"id": "523a38c4-270a-46f2-8441-3f401d487565", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
87635922-24a8-48b7-b623-ad5795c2770b	{"id": "87635922-24a8-48b7-b623-ad5795c2770b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
6218d1ca-b7c8-49c5-bb50-7e6b796673e4	{"id": "6218d1ca-b7c8-49c5-bb50-7e6b796673e4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:37
bedc3c08-c9d7-40b3-b3ab-30edd7958ada	{"id": "bedc3c08-c9d7-40b3-b3ab-30edd7958ada", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349237000000, "event_message": "Schema cache queried in 9.8 milliseconds"}	Schema cache queried in 9.8 milliseconds	2024-09-03 07:40:37
96cff22d-086e-42c8-a3cf-d25d009e9b4d	{"id": "96cff22d-086e-42c8-a3cf-d25d009e9b4d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
29e68753-d0e5-4aff-a6d2-b11f86e1562a	{"id": "29e68753-d0e5-4aff-a6d2-b11f86e1562a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:39
42fccd7c-2ade-4513-9dfd-e9cb6ed022f6	{"id": "42fccd7c-2ade-4513-9dfd-e9cb6ed022f6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
8e346a26-6ad3-49e3-b551-ca754cd5df91	{"id": "8e346a26-6ad3-49e3-b551-ca754cd5df91", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
915a1732-272a-4e2f-aebb-bfd36a0a803c	{"id": "915a1732-272a-4e2f-aebb-bfd36a0a803c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
6754d15e-9cb6-4537-ac33-e1d946237bd0	{"id": "6754d15e-9cb6-4537-ac33-e1d946237bd0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
262d8840-cc1c-4a18-9b20-d318c1dbbc16	{"id": "262d8840-cc1c-4a18-9b20-d318c1dbbc16", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
364c97ba-b9f4-450c-bdf2-3fa0e18a2cc9	{"id": "364c97ba-b9f4-450c-bdf2-3fa0e18a2cc9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
87cb5a3f-8cb5-44c7-aff5-d215eed0ad18	{"id": "87cb5a3f-8cb5-44c7-aff5-d215eed0ad18", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
fedcf179-64ff-4dd3-b986-c7b95e944a34	{"id": "fedcf179-64ff-4dd3-b986-c7b95e944a34", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
478bf7f3-5df8-4f90-b0a8-a9e18c70acfd	{"id": "478bf7f3-5df8-4f90-b0a8-a9e18c70acfd", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
c535c4a7-1fca-49db-a522-90f3647d3893	{"id": "c535c4a7-1fca-49db-a522-90f3647d3893", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
ea45258e-d389-4946-89ab-9555494edad9	{"id": "ea45258e-d389-4946-89ab-9555494edad9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
01a4f2c9-7047-4cda-8a26-a141beda3e99	{"id": "01a4f2c9-7047-4cda-8a26-a141beda3e99", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
b965e126-d148-4e28-8676-8e413080b70f	{"id": "b965e126-d148-4e28-8676-8e413080b70f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:39
92076a5e-1217-47d8-acff-3c8a2a6ea103	{"id": "92076a5e-1217-47d8-acff-3c8a2a6ea103", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
e4f23edf-9554-4542-8c90-029b88678c5d	{"id": "e4f23edf-9554-4542-8c90-029b88678c5d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:39
79514259-288f-4493-86ea-169eb49ae9c0	{"id": "79514259-288f-4493-86ea-169eb49ae9c0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
89759dbd-6ad3-4c9d-820e-c1ca2266dea0	{"id": "89759dbd-6ad3-4c9d-820e-c1ca2266dea0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
c8537331-f096-4d14-aaa1-0e8cfab5561e	{"id": "c8537331-f096-4d14-aaa1-0e8cfab5561e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
e846d4f7-320b-4a94-abbc-259e0dccd865	{"id": "e846d4f7-320b-4a94-abbc-259e0dccd865", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
6fdf02e3-e0b1-4b24-8347-833bc6c75c52	{"id": "6fdf02e3-e0b1-4b24-8347-833bc6c75c52", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:39
5cd3a059-0cea-4e3a-8aec-e0ad936e6141	{"id": "5cd3a059-0cea-4e3a-8aec-e0ad936e6141", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
396bdb47-bbfd-45d9-bd07-84917a2779a7	{"id": "396bdb47-bbfd-45d9-bd07-84917a2779a7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
1e8a76da-9b7f-4df4-9f3c-63ffd5fe6564	{"id": "1e8a76da-9b7f-4df4-9f3c-63ffd5fe6564", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache queried in 7.5 milliseconds"}	Schema cache queried in 7.5 milliseconds	2024-09-03 07:40:40
700c6a75-7cff-4baa-8d1f-3368c4d60e6b	{"id": "700c6a75-7cff-4baa-8d1f-3368c4d60e6b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:40
857e059a-56e9-47ae-8713-0da0c1a30b1a	{"id": "857e059a-56e9-47ae-8713-0da0c1a30b1a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
9f7c966e-a0dc-44db-951e-9f02aba804e5	{"id": "9f7c966e-a0dc-44db-951e-9f02aba804e5", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
3d40e340-f52a-4c4d-a679-9e9933a511c4	{"id": "3d40e340-f52a-4c4d-a679-9e9933a511c4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
868ce67e-0edb-496d-ba82-46f267b8a307	{"id": "868ce67e-0edb-496d-ba82-46f267b8a307", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
d392afe1-05a5-4f1f-a1d3-d6475db1bfd8	{"id": "d392afe1-05a5-4f1f-a1d3-d6475db1bfd8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
577127a0-484a-432f-bf51-1582f90ea699	{"id": "577127a0-484a-432f-bf51-1582f90ea699", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
71233251-e4d9-4236-ae9c-04d856a510bf	{"id": "71233251-e4d9-4236-ae9c-04d856a510bf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
9f0871a4-84d8-4151-9db8-0afd58d1a9eb	{"id": "9f0871a4-84d8-4151-9db8-0afd58d1a9eb", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
3c781e41-8b73-4c12-a0da-cbddd4a659ba	{"id": "3c781e41-8b73-4c12-a0da-cbddd4a659ba", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
3d87a577-820a-4f9f-a5cd-116615f44cfd	{"id": "3d87a577-820a-4f9f-a5cd-116615f44cfd", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
edca9c0a-c18f-4917-9c57-b732f7339a4a	{"id": "edca9c0a-c18f-4917-9c57-b732f7339a4a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
53ca2658-835a-4d37-9c26-d477f997f09e	{"id": "53ca2658-835a-4d37-9c26-d477f997f09e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
89db0f3c-4499-4ec1-b41b-3ac9b1b398bf	{"id": "89db0f3c-4499-4ec1-b41b-3ac9b1b398bf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache queried in 7.2 milliseconds"}	Schema cache queried in 7.2 milliseconds	2024-09-03 07:40:39
717df794-990f-4d0d-8c4a-12795f5ed988	{"id": "717df794-990f-4d0d-8c4a-12795f5ed988", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
767cbee4-90b2-445f-97b4-143363912345	{"id": "767cbee4-90b2-445f-97b4-143363912345", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
779b437d-2374-468e-bedf-d5c16293932b	{"id": "779b437d-2374-468e-bedf-d5c16293932b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
f2b2656e-6b8d-4786-af9b-d08731fcc149	{"id": "f2b2656e-6b8d-4786-af9b-d08731fcc149", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
373a0d49-144b-40b8-a7d8-17679fc07f5e	{"id": "373a0d49-144b-40b8-a7d8-17679fc07f5e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:40
67fdb64d-f743-4660-8df7-675cfc08ee83	{"id": "67fdb64d-f743-4660-8df7-675cfc08ee83", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:40
4659663c-b471-45f5-8ad3-80a940669f1d	{"id": "4659663c-b471-45f5-8ad3-80a940669f1d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
528972e4-7e7b-4960-9b54-f2db3e1562ef	{"id": "528972e4-7e7b-4960-9b54-f2db3e1562ef", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
7644f50c-be90-4789-a353-08af760c41f1	{"id": "7644f50c-be90-4789-a353-08af760c41f1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
fcd4cd5b-6f10-4ada-84ae-7ada07785493	{"id": "fcd4cd5b-6f10-4ada-84ae-7ada07785493", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache queried in 7.2 milliseconds"}	Schema cache queried in 7.2 milliseconds	2024-09-03 07:40:39
0320625b-3259-43b1-a58e-e9cc6c730e67	{"id": "0320625b-3259-43b1-a58e-e9cc6c730e67", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:39
8ad5c162-e68e-4097-8d1b-54825d225737	{"id": "8ad5c162-e68e-4097-8d1b-54825d225737", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
d98b66c2-7be2-4f8b-85a0-14507ec308f5	{"id": "d98b66c2-7be2-4f8b-85a0-14507ec308f5", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
7b8498ff-da1f-4f69-9d52-6ef835e53adf	{"id": "7b8498ff-da1f-4f69-9d52-6ef835e53adf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:39
cec66c93-0c40-4cfa-83b8-6d85e5b20779	{"id": "cec66c93-0c40-4cfa-83b8-6d85e5b20779", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:39
182ca888-7945-41d3-a42b-e63a08589593	{"id": "182ca888-7945-41d3-a42b-e63a08589593", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:39
cf4b79a3-f5df-477b-a7a7-5d6d7c41e669	{"id": "cf4b79a3-f5df-477b-a7a7-5d6d7c41e669", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache queried in 5.5 milliseconds"}	Schema cache queried in 5.5 milliseconds	2024-09-03 07:40:39
78b818f0-a5d6-4944-acbf-aaa9715f4919	{"id": "78b818f0-a5d6-4944-acbf-aaa9715f4919", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache queried in 6.4 milliseconds"}	Schema cache queried in 6.4 milliseconds	2024-09-03 07:40:39
99a537d2-63a7-4fd0-bfba-49a2e2a5e67d	{"id": "99a537d2-63a7-4fd0-bfba-49a2e2a5e67d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349239000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:39
b7922e9e-af06-4149-9925-d6f18a454086	{"id": "b7922e9e-af06-4149-9925-d6f18a454086", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
4d136886-7535-4386-8970-f978ef7c34a8	{"id": "4d136886-7535-4386-8970-f978ef7c34a8", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:40
ba27afa8-37c2-4979-b39d-ed4fc577bdef	{"id": "ba27afa8-37c2-4979-b39d-ed4fc577bdef", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
3f15a848-1498-4fb4-9c06-105d0c59be20	{"id": "3f15a848-1498-4fb4-9c06-105d0c59be20", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
4897b643-1811-4168-a0fb-f556af8cfbed	{"id": "4897b643-1811-4168-a0fb-f556af8cfbed", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:40
0a18c1b5-8949-47f9-98e4-2d9686962bea	{"id": "0a18c1b5-8949-47f9-98e4-2d9686962bea", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
772d1957-48db-443d-b424-a6dd1d10c4f4	{"id": "772d1957-48db-443d-b424-a6dd1d10c4f4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:40
6f662538-58ce-4221-93be-c79c27344302	{"id": "6f662538-58ce-4221-93be-c79c27344302", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:40
f5de363e-79a0-4c2d-a30c-33b2fb1d2cd2	{"id": "f5de363e-79a0-4c2d-a30c-33b2fb1d2cd2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache queried in 5.1 milliseconds"}	Schema cache queried in 5.1 milliseconds	2024-09-03 07:40:40
128515cc-3c5e-421e-9637-603c41e10d92	{"id": "128515cc-3c5e-421e-9637-603c41e10d92", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
be776f44-143c-40dc-b2fe-0511b75c7b2d	{"id": "be776f44-143c-40dc-b2fe-0511b75c7b2d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
156cd995-a6ef-415c-8447-b6e97aa7d8f1	{"id": "156cd995-a6ef-415c-8447-b6e97aa7d8f1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
5c9b151d-f5d8-481d-ac6e-9d7756ec18f6	{"id": "5c9b151d-f5d8-481d-ac6e-9d7756ec18f6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
7a88c693-1de6-4d57-a519-433d931a9a4f	{"id": "7a88c693-1de6-4d57-a519-433d931a9a4f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
a2b19820-f0d1-4b23-a055-776a8f795e33	{"id": "a2b19820-f0d1-4b23-a055-776a8f795e33", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:40
9b367446-350b-464a-96f9-e63ec5bb91a0	{"id": "9b367446-350b-464a-96f9-e63ec5bb91a0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:41
2d53bd14-d431-4fb7-81ee-8a546842cd82	{"id": "2d53bd14-d431-4fb7-81ee-8a546842cd82", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache queried in 6.7 milliseconds"}	Schema cache queried in 6.7 milliseconds	2024-09-03 07:40:41
a2f15f69-bd34-46bb-b844-effb7facb6d4	{"id": "a2f15f69-bd34-46bb-b844-effb7facb6d4", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:41
3a155427-16b3-40fb-87c4-268bda0fded0	{"id": "3a155427-16b3-40fb-87c4-268bda0fded0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
101f2d5c-866b-4c2c-8de3-8110f9c9bbae	{"id": "101f2d5c-866b-4c2c-8de3-8110f9c9bbae", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
2c7952fa-5e38-4de6-bb40-8d7ca9fd1e89	{"id": "2c7952fa-5e38-4de6-bb40-8d7ca9fd1e89", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
22ae6f64-bbc5-49f9-8866-78589c542a82	{"id": "22ae6f64-bbc5-49f9-8866-78589c542a82", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:41
1699d9f9-f93b-4768-af0c-d748b1cfafe3	{"id": "1699d9f9-f93b-4768-af0c-d748b1cfafe3", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
3a196624-5334-429a-af73-64f7dcbf0750	{"id": "3a196624-5334-429a-af73-64f7dcbf0750", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache queried in 7.9 milliseconds"}	Schema cache queried in 7.9 milliseconds	2024-09-03 07:40:41
b1debaf4-5068-4dad-9156-0932647d388d	{"id": "b1debaf4-5068-4dad-9156-0932647d388d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:41
a8331463-bb5d-4280-a96c-2cc34d7a73a1	{"id": "a8331463-bb5d-4280-a96c-2cc34d7a73a1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
0e14b47b-4186-45a2-a567-8440623edf07	{"id": "0e14b47b-4186-45a2-a567-8440623edf07", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
5f8a0df4-7356-4b5d-ba5b-b82bc736ea4c	{"id": "5f8a0df4-7356-4b5d-ba5b-b82bc736ea4c", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
a510e52b-5137-44b7-8402-eaff68bdd68d	{"id": "a510e52b-5137-44b7-8402-eaff68bdd68d", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
41050cb3-2575-45cf-b8c0-5852b85b3127	{"id": "41050cb3-2575-45cf-b8c0-5852b85b3127", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
273801c6-128a-4031-83fc-6246f9f5e712	{"id": "273801c6-128a-4031-83fc-6246f9f5e712", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
0afe6144-b159-45f4-b9c7-4dfcd226c9b7	{"id": "0afe6144-b159-45f4-b9c7-4dfcd226c9b7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
93432d36-8674-4c80-8fd4-7e1339b753ce	{"id": "93432d36-8674-4c80-8fd4-7e1339b753ce", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
2927370a-7e28-436b-8c13-eb48f9c85edc	{"id": "2927370a-7e28-436b-8c13-eb48f9c85edc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
e13ec491-2f85-4367-899f-38e9c062f289	{"id": "e13ec491-2f85-4367-899f-38e9c062f289", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
b2fec478-15a5-45f4-bea7-9fa0fd223cad	{"id": "b2fec478-15a5-45f4-bea7-9fa0fd223cad", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
a3f74e3f-bc88-4e01-a13a-4f0f9d5c4843	{"id": "a3f74e3f-bc88-4e01-a13a-4f0f9d5c4843", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
5a5e7235-06c0-43c5-8bae-2efe67fea865	{"id": "5a5e7235-06c0-43c5-8bae-2efe67fea865", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
4f8f9534-6679-40c2-b772-0312ab7a26d0	{"id": "4f8f9534-6679-40c2-b772-0312ab7a26d0", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
7dc0d63d-3f69-45cc-b9a5-7e31f30a66ec	{"id": "7dc0d63d-3f69-45cc-b9a5-7e31f30a66ec", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
64e3dd3d-33f9-4938-95a9-cadca9ad8e37	{"id": "64e3dd3d-33f9-4938-95a9-cadca9ad8e37", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
b1c95bbd-46c7-4030-aaf1-733210d27e03	{"id": "b1c95bbd-46c7-4030-aaf1-733210d27e03", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
2554ceb1-ff98-4255-bf00-0ea3962f6356	{"id": "2554ceb1-ff98-4255-bf00-0ea3962f6356", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
d9f878f4-7c97-4304-8662-88ca1a9f43af	{"id": "d9f878f4-7c97-4304-8662-88ca1a9f43af", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
52440f86-15df-43da-8e25-b5296e28059a	{"id": "52440f86-15df-43da-8e25-b5296e28059a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
80a2cf2b-8dee-4d35-8631-e783ba5eb3ce	{"id": "80a2cf2b-8dee-4d35-8631-e783ba5eb3ce", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
f081f5f5-18a5-4701-bc01-7dc93d11c0ae	{"id": "f081f5f5-18a5-4701-bc01-7dc93d11c0ae", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
a81b973d-09a2-42dd-aceb-bccec975f4de	{"id": "a81b973d-09a2-42dd-aceb-bccec975f4de", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
67158753-386d-45dd-aede-82748f97e13b	{"id": "67158753-386d-45dd-aede-82748f97e13b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:40
830e7575-b8a7-4b96-aa25-ffbbc75f15fe	{"id": "830e7575-b8a7-4b96-aa25-ffbbc75f15fe", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
0ff00dc7-2350-47fb-a93c-9af2a0cc7718	{"id": "0ff00dc7-2350-47fb-a93c-9af2a0cc7718", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
338a7c3e-9aaf-46b1-a8c2-0ebbf9558f28	{"id": "338a7c3e-9aaf-46b1-a8c2-0ebbf9558f28", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
03f520b9-e0c2-434d-8be8-ac6fe820810f	{"id": "03f520b9-e0c2-434d-8be8-ac6fe820810f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
b89c4ac3-a329-436f-a605-95d394900e58	{"id": "b89c4ac3-a329-436f-a605-95d394900e58", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
219f42d8-d37a-4fb6-bfd5-b93138c6e063	{"id": "219f42d8-d37a-4fb6-bfd5-b93138c6e063", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:41
ae404eb9-7106-4878-ac81-69a13354ecc2	{"id": "ae404eb9-7106-4878-ac81-69a13354ecc2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:40
ae841005-495a-4859-97c4-c602dc0a2186	{"id": "ae841005-495a-4859-97c4-c602dc0a2186", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache queried in 9.8 milliseconds"}	Schema cache queried in 9.8 milliseconds	2024-09-03 07:40:40
2702d376-e58a-438f-ae28-554c28c277aa	{"id": "2702d376-e58a-438f-ae28-554c28c277aa", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349240000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:40
1c9fed6f-d1b5-42d9-81aa-daa540aa9260	{"id": "1c9fed6f-d1b5-42d9-81aa-daa540aa9260", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
8be2b486-5996-4ab2-b67a-103598b4d9a2	{"id": "8be2b486-5996-4ab2-b67a-103598b4d9a2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
0c0a6458-f89c-4d4f-b80a-7d37129d55db	{"id": "0c0a6458-f89c-4d4f-b80a-7d37129d55db", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
01f11088-2cea-48c2-a032-5a91a266424a	{"id": "01f11088-2cea-48c2-a032-5a91a266424a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
b59a630a-a5d3-41ee-9766-e8dd1b4944ab	{"id": "b59a630a-a5d3-41ee-9766-e8dd1b4944ab", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
835d76e2-7962-493f-9497-6d55e56e4c2e	{"id": "835d76e2-7962-493f-9497-6d55e56e4c2e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
b542999b-4026-4327-b67f-0f9d0feafac6	{"id": "b542999b-4026-4327-b67f-0f9d0feafac6", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
16a9ebab-39e3-4f9d-8e0e-fd07398028cc	{"id": "16a9ebab-39e3-4f9d-8e0e-fd07398028cc", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
027b0996-b7a3-4970-8a9a-6468e85bfb00	{"id": "027b0996-b7a3-4970-8a9a-6468e85bfb00", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
03f7babd-06d1-463f-8ba5-7567ee8994ed	{"id": "03f7babd-06d1-463f-8ba5-7567ee8994ed", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
db1f1b06-6123-4ee9-b5eb-86a928120ce9	{"id": "db1f1b06-6123-4ee9-b5eb-86a928120ce9", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:41
ca290178-ae53-4232-bb7b-4a786565f758	{"id": "ca290178-ae53-4232-bb7b-4a786565f758", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:41
7a3e040f-3217-43d5-b3f1-d8f0cc2ddc83	{"id": "7a3e040f-3217-43d5-b3f1-d8f0cc2ddc83", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
db45ea1c-db74-4a3e-b447-3ce0318b9e79	{"id": "db45ea1c-db74-4a3e-b447-3ce0318b9e79", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
037c37c6-23e9-4682-ae8f-334a18a51be7	{"id": "037c37c6-23e9-4682-ae8f-334a18a51be7", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
bb02f80d-cfe1-4c4d-9079-c3fd8e9c69c1	{"id": "bb02f80d-cfe1-4c4d-9079-c3fd8e9c69c1", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
46e6ffc7-d9c9-45ef-b569-4ef0a24b4a92	{"id": "46e6ffc7-d9c9-45ef-b569-4ef0a24b4a92", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:42
bc857373-3582-449a-80b1-3e882263ac79	{"id": "bc857373-3582-449a-80b1-3e882263ac79", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache queried in 8.0 milliseconds"}	Schema cache queried in 8.0 milliseconds	2024-09-03 07:40:42
6f9de06d-e266-4e9f-a4d0-7d2fc00091af	{"id": "6f9de06d-e266-4e9f-a4d0-7d2fc00091af", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache loaded 1 Relations, 0 Relationships, 3 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 1 Relations, 0 Relationships, 3 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:42
cdcdd773-9327-4ae2-9251-22342091dd74	{"id": "cdcdd773-9327-4ae2-9251-22342091dd74", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:42
7b76ca26-2298-45bb-81c4-70fa92cf8c87	{"id": "7b76ca26-2298-45bb-81c4-70fa92cf8c87", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:42
12df15a4-b6e9-4574-bccb-d2e303118b4a	{"id": "12df15a4-b6e9-4574-bccb-d2e303118b4a", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache queried in 6.4 milliseconds"}	Schema cache queried in 6.4 milliseconds	2024-09-03 07:40:42
c8dbdc71-396b-46d9-9d68-99951541ee4e	{"id": "c8dbdc71-396b-46d9-9d68-99951541ee4e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
328e9c91-06e7-49ce-9763-1b0e1719e529	{"id": "328e9c91-06e7-49ce-9763-1b0e1719e529", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache queried in 9.6 milliseconds"}	Schema cache queried in 9.6 milliseconds	2024-09-03 07:40:41
8800d639-626a-4c84-b355-3b034dfa6a52	{"id": "8800d639-626a-4c84-b355-3b034dfa6a52", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:41
797228e1-7111-41ae-9192-0da0b2343a78	{"id": "797228e1-7111-41ae-9192-0da0b2343a78", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
9c0589c3-9718-483d-a840-faf53eaeff2b	{"id": "9c0589c3-9718-483d-a840-faf53eaeff2b", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
0fd8e29e-01dd-4574-8b91-76a6e65b7b44	{"id": "0fd8e29e-01dd-4574-8b91-76a6e65b7b44", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
52fcacb4-4f99-4a2c-919d-21137d00d2b2	{"id": "52fcacb4-4f99-4a2c-919d-21137d00d2b2", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
1615b07e-0a21-4e52-b622-fc0691c64766	{"id": "1615b07e-0a21-4e52-b622-fc0691c64766", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
5c9a09d1-44e9-4b8d-a585-0a3be31ea391	{"id": "5c9a09d1-44e9-4b8d-a585-0a3be31ea391", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
2bbed682-e514-4f69-8276-3bbe2257e92f	{"id": "2bbed682-e514-4f69-8276-3bbe2257e92f", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
72a0a934-817f-4233-bb46-b2cc7f7ad188	{"id": "72a0a934-817f-4233-bb46-b2cc7f7ad188", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:42
35ae095d-d381-4e2c-986c-8e4c4b14c382	{"id": "35ae095d-d381-4e2c-986c-8e4c4b14c382", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:41
a48b1773-87b7-45e6-8223-cd711d442330	{"id": "a48b1773-87b7-45e6-8223-cd711d442330", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit"}	Successfully connected to PostgreSQL 15.6 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit	2024-09-03 07:40:41
26de4ac9-2e67-4298-abc5-33b1f1c26908	{"id": "26de4ac9-2e67-4298-abc5-33b1f1c26908", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349241000000, "event_message": "Config reloaded"}	Config reloaded	2024-09-03 07:40:41
bd968cca-487a-4fd8-bc41-305deadf7049	{"id": "bd968cca-487a-4fd8-bc41-305deadf7049", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:42
282332be-ea72-44a4-8736-a244de19e561	{"id": "282332be-ea72-44a4-8736-a244de19e561", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache queried in 5.6 milliseconds"}	Schema cache queried in 5.6 milliseconds	2024-09-03 07:40:42
29b7eb89-f240-44ff-9ec3-7754042a3a8e	{"id": "29b7eb89-f240-44ff-9ec3-7754042a3a8e", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 0 Relations, 0 Relationships, 1 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:42
1b26fba6-5ce4-4568-bafe-2f3fbc6fcecf	{"id": "1b26fba6-5ce4-4568-bafe-2f3fbc6fcecf", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Received a schema cache reload message on the \\"pgrst\\" channel"}	Received a schema cache reload message on the "pgrst" channel	2024-09-03 07:40:42
98c0dea9-9e50-4ce9-81b6-cf376f8ace37	{"id": "98c0dea9-9e50-4ce9-81b6-cf376f8ace37", "appname": "supabase_rest_brancher", "project": "default", "metadata": {"host": "default"}, "timestamp": 1725349242000000, "event_message": "Schema cache loaded 1 Relations, 0 Relationships, 3 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones"}	Schema cache loaded 1 Relations, 0 Relationships, 3 Functions, 0 Domain Representations, 4 Media Type Handlers, 1194 Timezones	2024-09-03 07:40:42
\.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, revoked_at, scopes, inserted_at) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.oauth_access_tokens (id, application_id, resource_owner_id, token, refresh_token, expires_in, revoked_at, scopes, previous_refresh_token, inserted_at, updated_at, description) FROM stdin;
\.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.oauth_applications (id, owner_id, name, uid, secret, redirect_uri, scopes, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: partner_users; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.partner_users (id, partner_id, user_id) FROM stdin;
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.partners (id, name, token) FROM stdin;
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.payment_methods (id, stripe_id, price_id, last_four, brand, exp_year, exp_month, customer_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.plans (id, name, stripe_id, inserted_at, updated_at, period, price, limit_sources, limit_rate_limit, limit_alert_freq, limit_source_rate_limit, limit_saved_search_limit, limit_team_users_limit, limit_source_fields_limit, limit_source_ttl, type) FROM stdin;
1	Enterprise	\N	2024-09-03 07:40:40	2024-09-03 07:40:40	year	20000	100	5000	1000	100	1	2	500	5184000000	standard
\.


--
-- Data for Name: rules; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.rules (id, regex, sink, source_id, inserted_at, updated_at, regex_struct, lql_string, lql_filters) FROM stdin;
\.


--
-- Data for Name: saved_search_counters; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.saved_search_counters (id, "timestamp", saved_search_id, granularity, non_tailing_count, tailing_count) FROM stdin;
\.


--
-- Data for Name: saved_searches; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.saved_searches (id, querystring, source_id, inserted_at, updated_at, saved_by_user, lql_filters, lql_charts, "tailing?", tailing) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.schema_migrations (version, inserted_at) FROM stdin;
20181212161742	2024-09-03 07:40:36
20181212220417	2024-09-03 07:40:36
20181212220843	2024-09-03 07:40:36
20181219123536	2024-09-03 07:40:36
20181220234951	2024-09-03 07:40:36
20190111193432	2024-09-03 07:40:36
20190111222747	2024-09-03 07:40:36
20190111223908	2024-09-03 07:40:36
20190128145905	2024-09-03 07:40:36
20190211145604	2024-09-03 07:40:36
20190211215002	2024-09-03 07:40:36
20190212190412	2024-09-03 07:40:36
20190218171231	2024-09-03 07:40:36
20190220020658	2024-09-03 07:40:36
20190220150309	2024-09-03 07:40:36
20190226224323	2024-09-03 07:40:36
20190226225345	2024-09-03 07:40:36
20190313222100	2024-09-03 07:40:36
20190314210542	2024-09-03 07:40:36
20190314234158	2024-09-03 07:40:36
20190321135403	2024-09-03 07:40:36
20190322184724	2024-09-03 07:40:36
20190322194928	2024-09-03 07:40:36
20190326182605	2024-09-03 07:40:36
20190507163835	2024-09-03 07:40:36
20190509154645	2024-09-03 07:40:36
20190522200854	2024-09-03 07:40:36
20190528132518	2024-09-03 07:40:36
20190603134249	2024-09-03 07:40:36
20190604130811	2024-09-03 07:40:36
20190814185734	2024-09-03 07:40:36
20190815222912	2024-09-03 07:40:36
20190820170701	2024-09-03 07:40:36
20190823211533	2024-09-03 07:40:36
20190912214717	2024-09-03 07:40:36
20191007163747	2024-09-03 07:40:36
20191014233159	2024-09-03 07:40:36
20191108163345	2024-09-03 07:40:36
20191111221000	2024-09-03 07:40:36
20191114120409	2024-09-03 07:40:36
20191226181646	2024-09-03 07:40:36
20191230164304	2024-09-03 07:40:36
20200106161131	2024-09-03 07:40:36
20200109165508	2024-09-03 07:40:36
20200113132611	2024-09-03 07:40:36
20200114231904	2024-09-03 07:40:36
20200116122225	2024-09-03 07:40:36
20200116143027	2024-09-03 07:40:36
20200130185455	2024-09-03 07:40:36
20200205180641	2024-09-03 07:40:36
20200311175358	2024-09-03 07:40:36
20200317130710	2024-09-03 07:40:36
20200319164038	2024-09-03 07:40:36
20200320161900	2024-09-03 07:40:36
20200401102642	2024-09-03 07:40:36
20200401132720	2024-09-03 07:40:36
20200401182732	2024-09-03 07:40:36
20200402180315	2024-09-03 07:40:36
20200403130311	2024-09-03 07:40:36
20200409120508	2024-09-03 07:40:36
20200409150827	2024-09-03 07:40:36
20200413161605	2024-09-03 07:40:36
20200422211654	2024-09-03 07:40:36
20200507184618	2024-09-03 07:40:36
20200512205718	2024-09-03 07:40:36
20200513154911	2024-09-03 07:40:36
20200519181117	2024-09-03 07:40:36
20200603150413	2024-09-03 07:40:36
20200605164057	2024-09-03 07:40:36
20200605185446	2024-09-03 07:40:36
20200606140153	2024-09-03 07:40:36
20200803211251	2024-09-03 07:40:36
20200806201742	2024-09-03 07:40:36
20200824155733	2024-09-03 07:40:36
20200826141015	2024-09-03 07:40:36
20201130170051	2024-09-03 07:40:36
20201211125013	2024-09-03 07:40:36
20201229174131	2024-09-03 07:40:36
20210104192144	2024-09-03 07:40:36
20210106205729	2024-09-03 07:40:36
20210118220058	2024-09-03 07:40:36
20210121220159	2024-09-03 07:40:36
20210204203050	2024-09-03 07:40:36
20210215163446	2024-09-03 07:40:36
20210215165548	2024-09-03 07:40:36
20210322193905	2024-09-03 07:40:36
20210521142331	2024-09-03 07:40:36
20210526120333	2024-09-03 07:40:36
20210707201854	2024-09-03 07:40:36
20210712201152	2024-09-03 07:40:36
20210715022534	2024-09-03 07:40:36
20210728172720	2024-09-03 07:40:37
20210729161959	2024-09-03 07:40:37
20210802194723	2024-09-03 07:40:37
20210803020354	2024-09-03 07:40:37
20210804210634	2024-09-03 07:40:37
20210810182003	2024-09-03 07:40:37
20210830181842	2024-09-03 07:40:37
20211027175016	2024-09-03 07:40:37
20211122181200	2024-09-03 07:40:37
20211123192744	2024-09-03 07:40:37
20211130190948	2024-09-03 07:40:37
20211130201505	2024-09-03 07:40:37
20220310172806	2024-09-03 07:40:37
20220523135557	2024-09-03 07:40:37
20220524125216	2024-09-03 07:40:37
20220707030041	2024-09-03 07:40:37
20220714033012	2024-09-03 07:40:37
20220803211705	2024-09-03 07:40:37
20221210010955	2024-09-03 07:40:37
20221210011115	2024-09-03 07:40:37
20230110121321	2024-09-03 07:40:37
20230206155428	2024-09-03 07:40:37
20230223162441	2024-09-03 07:40:37
20230227183828	2024-09-03 07:40:37
20230622160150	2024-09-03 07:40:37
20230622160250	2024-09-03 07:40:37
20230714041101	2024-09-03 07:40:37
20230727111150	2024-09-03 07:40:37
\.


--
-- Data for Name: schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:40
\.


--
-- Data for Name: schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:41
\.


--
-- Data for Name: schema_migrations_d87540bb_882e_4304_9bec_7172047840e5; Type: TABLE DATA; Schema: _analytics; Owner: postgres
--

COPY _analytics.schema_migrations_d87540bb_882e_4304_9bec_7172047840e5 (version, inserted_at) FROM stdin;
1	2024-09-03 07:40:41
\.


--
-- Data for Name: source_backends; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.source_backends (id, source_id, type, config, inserted_at, updated_at) FROM stdin;
1	1	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
2	2	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
3	3	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
4	4	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
5	5	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
6	6	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
7	7	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
8	8	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
9	9	postgres	{"url": "postgresql://postgres:postgres@supabase_db_brancher:5432/postgres", "schema": "_analytics"}	2024-09-03 07:40:40	2024-09-03 07:40:40
\.


--
-- Data for Name: source_schemas; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.source_schemas (id, bigquery_schema, source_id, inserted_at, updated_at, schema_flat_map) FROM stdin;
\.


--
-- Data for Name: sources; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.sources (id, name, token, inserted_at, updated_at, user_id, public_token, favorite, bigquery_table_ttl, api_quota, webhook_notification_url, slack_hook_url, notifications, custom_event_message_keys, log_events_updated_at, bigquery_schema, notifications_every, bq_table_partition_type, lock_schema, validate_schema, drop_lql_filters, drop_lql_string, v2_pipeline, suggested_keys) FROM stdin;
1	cloudflare.logs.prod	9cae37bf-dd53-416a-834c-802c1ca62646	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
2	postgres.logs	39cbcdc3-6963-4888-9bfb-6e686d1518c5	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
3	deno-relay-logs	551b8385-bfbb-4e5b-a653-2f9476d08ba4	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
4	deno-subhosting-events	1f4e2106-b3b4-4d67-b39e-b36f95a74a2a	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
5	gotrue.logs.prod	adbe9f86-4491-4434-ae30-4698ae99e1b0	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
6	realtime.logs.prod	4d039a66-f2f6-4333-84e2-6ed2164631b4	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
7	storage.logs.prod.2	09ef132f-2484-45d7-944c-a4cebd801402	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
8	postgREST.logs.prod	d87540bb-882e-4304-9bec-7172047840e5	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
9	pgbouncer.logs.prod	bfc97cf7-7b43-4ffe-87bd-25c6789de6da	2024-09-03 07:40:40	2024-09-03 07:40:40	1	\N	f	\N	25	\N	\N	{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}	\N	\N	\N	14400000	timestamp	f	t	\\x836a	\N	t	
\.


--
-- Data for Name: system_metrics; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.system_metrics (id, all_logs_logged, node, inserted_at, updated_at) FROM stdin;
1	0	logflare@127.0.0.1	2024-09-03 07:40:45	2024-09-03 07:40:45
\.


--
-- Data for Name: team_users; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.team_users (id, email, token, provider, email_preferred, name, image, email_me_product, phone, valid_google_account, provider_uid, team_id, inserted_at, updated_at, preferences) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.teams (id, name, user_id, inserted_at, updated_at, token) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.users (id, email, provider, token, inserted_at, updated_at, api_key, old_api_key, email_preferred, name, image, email_me_product, admin, phone, bigquery_project_id, api_quota, bigquery_dataset_location, bigquery_dataset_id, valid_google_account, provider_uid, company, bigquery_udfs_hash, bigquery_processed_bytes_limit, "billing_enabled?", preferences, billing_enabled, endpoints_beta) FROM stdin;
1	default@logflare.app	default	466cb06e-a48b-40ab-96e4-f29927e5c54d	2024-09-03 07:40:40	2024-09-03 07:40:40	api-key	\N	default@logflare.app	default	\N	f	f	\N	\N	150	\N	\N	\N	default	\N		10000000000	f	\N	t	t
\.


--
-- Data for Name: vercel_auths; Type: TABLE DATA; Schema: _analytics; Owner: supabase_admin
--

COPY _analytics.vercel_auths (id, access_token, installation_id, team_id, token_type, vercel_user_id, user_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
88665551-5fb0-4af6-a8ba-c7bc31679ea2	postgres_cdc_rls	{"region": "us-east-1", "db_host": "z8IJXUcPtR3F9Acxkk4o29Syot96gkxH1Gko1b7Uh0w=", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "sWBpZNdjggEPTQVlI52Zfw==", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2024-09-03 07:40:46	2024-09-03 07:40:46
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2024-09-03 07:40:37
20220329161857	2024-09-03 07:40:37
20220410212326	2024-09-03 07:40:37
20220506102948	2024-09-03 07:40:37
20220527210857	2024-09-03 07:40:37
20220815211129	2024-09-03 07:40:37
20220815215024	2024-09-03 07:40:37
20220818141501	2024-09-03 07:40:37
20221018173709	2024-09-03 07:40:37
20221102172703	2024-09-03 07:40:37
20221223010058	2024-09-03 07:40:37
20230110180046	2024-09-03 07:40:37
20230810220907	2024-09-03 07:40:37
20230810220924	2024-09-03 07:40:37
20231024094642	2024-09-03 07:40:37
20240306114423	2024-09-03 07:40:37
20240418082835	2024-09-03 07:40:37
20240625211759	2024-09-03 07:40:37
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks) FROM stdin;
af9514d3-3495-46bd-ae56-2da8db8c6135	realtime-dev	realtime-dev	iNjicxc4+llvc9wovDvqymwfnj9teWMlyOIbJ8Fh6j2WNU8CIJ2ZgjR6MUIKqSmeDmvpsKLsZ9jgXJmQPpwL8w==	200	2024-09-03 07:40:46	2024-09-03 07:40:46	100	postgres_cdc_rls	100000	100	100	f	\N
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, source, source_id, content, document_id, author, url, created_at, embedding) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-09-03 07:40:39
20211116045059	2024-09-03 07:40:39
20211116050929	2024-09-03 07:40:39
20211116051442	2024-09-03 07:40:39
20211116212300	2024-09-03 07:40:39
20211116213355	2024-09-03 07:40:39
20211116213934	2024-09-03 07:40:39
20211116214523	2024-09-03 07:40:39
20211122062447	2024-09-03 07:40:39
20211124070109	2024-09-03 07:40:39
20211202204204	2024-09-03 07:40:39
20211202204605	2024-09-03 07:40:39
20211210212804	2024-09-03 07:40:39
20211228014915	2024-09-03 07:40:39
20220107221237	2024-09-03 07:40:39
20220228202821	2024-09-03 07:40:39
20220312004840	2024-09-03 07:40:39
20220603231003	2024-09-03 07:40:40
20220603232444	2024-09-03 07:40:40
20220615214548	2024-09-03 07:40:40
20220712093339	2024-09-03 07:40:40
20220908172859	2024-09-03 07:40:40
20220916233421	2024-09-03 07:40:40
20230119133233	2024-09-03 07:40:40
20230128025114	2024-09-03 07:40:40
20230128025212	2024-09-03 07:40:40
20230227211149	2024-09-03 07:40:40
20230228184745	2024-09-03 07:40:40
20230308225145	2024-09-03 07:40:40
20230328144023	2024-09-03 07:40:40
20231018144023	2024-09-03 07:40:40
20231204144023	2024-09-03 07:40:40
20231204144024	2024-09-03 07:40:40
20231204144025	2024-09-03 07:40:40
20240108234812	2024-09-03 07:40:40
20240109165339	2024-09-03 07:40:40
20240227174441	2024-09-03 07:40:40
20240311171622	2024-09-03 07:40:40
20240321100241	2024-09-03 07:40:40
20240401105812	2024-09-03 07:40:40
20240418121054	2024-09-03 07:40:40
20240523004032	2024-09-03 07:40:40
20240618124746	2024-09-03 07:40:40
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-09-03 07:40:41.442787
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-09-03 07:40:41.448121
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-09-03 07:40:41.451714
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-09-03 07:40:41.47309
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-09-03 07:40:41.492659
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-09-03 07:40:41.495984
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-09-03 07:40:41.500483
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-09-03 07:40:41.504307
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-09-03 07:40:41.507873
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-09-03 07:40:41.511807
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-09-03 07:40:41.516029
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-09-03 07:40:41.520962
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-09-03 07:40:41.526187
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-09-03 07:40:41.529057
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-09-03 07:40:41.531894
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-09-03 07:40:41.5526
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-09-03 07:40:41.556403
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-09-03 07:40:41.559658
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-09-03 07:40:41.563229
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-09-03 07:40:41.567762
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-09-03 07:40:41.570602
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-09-03 07:40:41.581295
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-09-03 07:40:41.606825
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-09-03 07:40:41.630196
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-09-03 07:40:41.636996
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2024-09-03 07:40:41.646537
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2024-09-03 07:40:28.754184+00
20210809183423_update_grants	2024-09-03 07:40:28.754184+00
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20240725115033	{"create extension vector","create table if not exists documents (\n    id text primary key default gen_random_uuid()::text,\n    source text,\n    source_id text,\n    content text,\n    document_id text,\n    author text,\n    url text,\n    created_at timestamptz default now(),\n    embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model\n)","create index ix_documents_document_id on documents using btree ( document_id )","create index ix_documents_source on documents using btree ( source )","create index ix_documents_source_id on documents using btree ( source_id )","create index ix_documents_author on documents using btree ( author )","create index ix_documents_created_at on documents using brin ( created_at )","-- alter table documents enable row level security;\n\ncreate or replace function match_page_sections(in_embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model\n                                            , in_match_count int default 3\n                                            , in_document_id text default '%%'\n                                            , in_source_id text default '%%'\n                                            , in_source text default '%%'\n                                            , in_author text default '%%'\n                                            , in_start_date timestamptz default '-infinity'\n                                            , in_end_date timestamptz default 'infinity')\nreturns table (id text\n            , source text\n            , source_id text\n            , document_id text\n            , url text\n            , created_at timestamptz\n            , author text\n            , content text\n            , embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model\n            , similarity float)\nlanguage plpgsql\nas $$\n#variable_conflict use_variable\nbegin\nreturn query\nselect\n    documents.id,\n    documents.source,\n    documents.source_id,\n    documents.document_id,\n    documents.url,\n    documents.created_at,\n    documents.author,\n    documents.content,\n    documents.embedding,\n    (documents.embedding <#> in_embedding) * -1 as similarity\nfrom documents\n\nwhere in_start_date <= documents.created_at and \n    documents.created_at <= in_end_date and\n    (documents.source_id like in_source_id or documents.source_id is null) and\n    (documents.source like in_source or documents.source is null) and\n    (documents.author like in_author or documents.author is null) and\n    (documents.document_id like in_document_id or documents.document_id is null)\n\norder by documents.embedding <#> in_embedding\n\nlimit in_match_count;\nend;\n$$","-- create an index for the full-text search\ncreate index ix_documents_content_fts on documents using gin (to_tsvector('english', content))","-- create an index for the semantic vector search\ncreate index ix_documents_embedding on documents using ivfflat(embedding) with (lists=100)","-- Function to perform hybrid search combining full-text and semantic search\nCREATE OR REPLACE FUNCTION hybrid_search(\n    in_query TEXT,\n    in_embedding VECTOR(1024), -- Adjust the dimension as needed\n    in_match_count INT DEFAULT 3,\n    full_text_weight FLOAT DEFAULT 1.0,\n    semantic_weight FLOAT DEFAULT 1.0,\n    rrf_k INT DEFAULT 50\n)\nRETURNS TABLE (\n    id TEXT,\n    source TEXT,\n    source_id TEXT,\n    document_id TEXT,\n    url TEXT,\n    created_at TIMESTAMPTZ,\n    author TEXT,\n    content TEXT,\n    embedding VECTOR(1024), -- Adjust the dimension as needed\n    rank FLOAT\n)\nLANGUAGE plpgsql\nAS $$\nBEGIN\n    RETURN QUERY\n    WITH full_text_search AS (\n        SELECT\n            documents.id,\n            ROW_NUMBER() OVER (ORDER BY ts_rank(to_tsvector('english', documents.content), plainto_tsquery(in_query)) DESC) AS rank\n        FROM documents\n        WHERE to_tsvector('english', documents.content) @@ plainto_tsquery(in_query)\n        ORDER BY rank\n        LIMIT rrf_k\n    ),\n    semantic_search AS (\n        SELECT\n            documents.id,\n            ROW_NUMBER() OVER (ORDER BY (documents.embedding <#> in_embedding) DESC) AS rank\n        FROM documents\n        WHERE (documents.embedding <#> in_embedding) > 0.5\n        ORDER BY rank\n        LIMIT rrf_k\n    )\n    SELECT\n        d.id,\n        d.source,\n        d.source_id,\n        d.document_id,\n        d.url,\n        d.created_at,\n        d.author,\n        d.content,\n        d.embedding,\n        (COALESCE(fts.rank, 0) * full_text_weight + COALESCE(ss.rank, 0) * semantic_weight) AS rank\n    FROM documents d\n    LEFT JOIN full_text_search fts ON d.id = fts.id\n    LEFT JOIN semantic_search ss ON d.id = ss.id\n    WHERE fts.id IS NOT NULL OR ss.id IS NOT NULL\n    ORDER BY rank DESC\n    LIMIT in_match_count;\nEND;\n$$","-- -- create hybrid search function\n-- create or replace function hybrid_search(\n--     in_query text,\n--     in_embedding vector(1024), -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model\n--     in_match_count int default 3,\n--     full_text_weight float default 1.0,\n--     semantic_weight float default 1.0,\n--     rrf_k int default 50\n-- )\n-- returns table (id text\n--             , source text\n--             , source_id text\n--             , document_id text\n--             , url text\n--             , created_at timestamptz\n--             , author text\n--             , content text\n--             , embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model\n--             , rank float)\n-- language plpgsql\n-- as $$\n-- with full_text_search as (\n--     select\n--         id,\n--         row_number() over (order by ts_rank(to_tsvector('english', content), plainto_tsquery(in_query)) desc) as rank\n--     from documents\n--     where to_tsvector('english', content) @@ plainto_tsquery(in_query)\n--     order by rank\n--     limit rrf_k\n-- ),\n\n-- semantic_search as (\n--     select\n--         id,\n--         row_number() over (order by (embedding <#> in_embedding) desc) as rank\n--     from documents\n--     where (embedding <#> in_embedding) > 0.5\n--     order by rank\n--     limit rrf_k\n-- )\n\n-- select\n--     documents.* \n-- from full_text_search\n-- full outer join semantic_search on full_text_search.id = semantic_search.id\n-- join documents on coalesce(full_text_search.id, semantic_search.id) = documents.id\n-- order by \n--     coalesce(full_text_search.rank, 0) * full_text_weight + coalesce(semantic_search.rank, 0) * semantic_weight desc\n-- limit in_match_count;\n-- $$;\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-- -- Enable pgvector extension\n-- create extension if not exists vector with schema public;\n\n-- -- Create tables \n-- create table \\"public\\".\\"nods_page\\" (\n--   id bigserial primary key,\n--   parent_page_id bigint references public.nods_page,\n--   path text not null unique,\n--   checksum text,\n--   meta jsonb,\n--   type text,\n--   source text\n-- );\n-- alter table \\"public\\".\\"nods_page\\" enable row level security;\n\n-- create table \\"public\\".\\"nods_page_section\\" (\n--   id bigserial primary key,\n--   page_id bigint not null references public.nods_page on delete cascade,\n--   content text,\n--   token_count int,\n--   embedding vector(4096),\n--   slug text,\n--   heading text\n-- );\n-- alter table \\"public\\".\\"nods_page_section\\" enable row level security;\n\n-- -- Create embedding similarity search functions\n-- create or replace function match_page_sections(embedding vector(4096), match_threshold float, match_count int, min_content_length int)\n-- returns table (id bigint, page_id bigint, slug text, heading text, content text, similarity float)\n-- language plpgsql\n-- as $$\n-- #variable_conflict use_variable\n-- begin\n--   return query\n--   select \n--     nods_page_section.id,\n--     nods_page_section.page_id,\n--     nods_page_section.slug,\n--     nods_page_section.heading,\n--     nods_page_section.content,\n--     (nods_page_section.embedding <#> embedding) * -1 as similarity\n--   from nods_page_section\n\n--   -- We only care about sections that have a useful amount of content\n--   where length(nods_page_section.content) >= min_content_length\n\n--   -- The dot product is negative because of a Postgres limitation, so we negate it\n--   and (nods_page_section.embedding <#> embedding) * -1 > match_threshold\n\n--   -- OpenAI embeddings are normalized to length 1, so\n--   -- cosine similarity and dot product will produce the same results.\n--   -- Using dot product which can be computed slightly faster.\n--   --\n--   -- For the different syntaxes, see https://github.com/pgvector/pgvector\n--   order by nods_page_section.embedding <#> embedding\n  \n--   limit match_count;\n-- end;\n-- $$;\n\n-- create or replace function get_page_parents(page_id bigint)\n-- returns table (id bigint, parent_page_id bigint, path text, meta jsonb)\n-- language sql\n-- as $$\n--   with recursive chain as (\n--     select *\n--     from nods_page \n--     where id = page_id\n\n--     union all\n\n--     select child.*\n--       from nods_page as child\n--       join chain on chain.parent_page_id = child.id \n--   )\n--   select id, parent_page_id, path, meta\n--   from chain;\n-- $$;"}	docs
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_accounts_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.billing_accounts_id_seq', 1, false);


--
-- Name: billing_counts_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.billing_counts_id_seq', 1, false);


--
-- Name: endpoint_queries_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.endpoint_queries_id_seq', 3, true);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.oauth_access_tokens_id_seq', 1, false);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.oauth_applications_id_seq', 1, false);


--
-- Name: partner_users_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.partner_users_id_seq', 1, false);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.partners_id_seq', 1, false);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.payment_methods_id_seq', 1, false);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.plans_id_seq', 1, true);


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.rules_id_seq', 1, false);


--
-- Name: saved_search_counters_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.saved_search_counters_id_seq', 1, false);


--
-- Name: saved_searches_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.saved_searches_id_seq', 1, false);


--
-- Name: source_backends_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.source_backends_id_seq', 9, true);


--
-- Name: source_schemas_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.source_schemas_id_seq', 1, false);


--
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.sources_id_seq', 9, true);


--
-- Name: system_metrics_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.system_metrics_id_seq', 1, true);


--
-- Name: team_users_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.team_users_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.teams_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.users_id_seq', 1, true);


--
-- Name: vercel_auths_id_seq; Type: SEQUENCE SET; Schema: _analytics; Owner: supabase_admin
--

SELECT pg_catalog.setval('_analytics.vercel_auths_id_seq', 1, false);


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: billing_accounts billing_accounts_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_accounts
    ADD CONSTRAINT billing_accounts_pkey PRIMARY KEY (id);


--
-- Name: billing_counts billing_counts_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_counts
    ADD CONSTRAINT billing_counts_pkey PRIMARY KEY (id);


--
-- Name: endpoint_queries endpoint_queries_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_pkey PRIMARY KEY (id);


--
-- Name: log_events_09ef132f_2484_45d7_944c_a4cebd801402 log_events_09ef132f_2484_45d7_944c_a4cebd801402_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_09ef132f_2484_45d7_944c_a4cebd801402
    ADD CONSTRAINT log_events_09ef132f_2484_45d7_944c_a4cebd801402_pkey PRIMARY KEY (id);


--
-- Name: log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a
    ADD CONSTRAINT log_events_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a_pkey PRIMARY KEY (id);


--
-- Name: log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5 log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5
    ADD CONSTRAINT log_events_39cbcdc3_6963_4888_9bfb_6e686d1518c5_pkey PRIMARY KEY (id);


--
-- Name: log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4 log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4
    ADD CONSTRAINT log_events_4d039a66_f2f6_4333_84e2_6ed2164631b4_pkey PRIMARY KEY (id);


--
-- Name: log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4 log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4
    ADD CONSTRAINT log_events_551b8385_bfbb_4e5b_a653_2f9476d08ba4_pkey PRIMARY KEY (id);


--
-- Name: log_events_9cae37bf_dd53_416a_834c_802c1ca62646 log_events_9cae37bf_dd53_416a_834c_802c1ca62646_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_9cae37bf_dd53_416a_834c_802c1ca62646
    ADD CONSTRAINT log_events_9cae37bf_dd53_416a_834c_802c1ca62646_pkey PRIMARY KEY (id);


--
-- Name: log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0 log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0
    ADD CONSTRAINT log_events_adbe9f86_4491_4434_ae30_4698ae99e1b0_pkey PRIMARY KEY (id);


--
-- Name: log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da
    ADD CONSTRAINT log_events_bfc97cf7_7b43_4ffe_87bd_25c6789de6da_pkey PRIMARY KEY (id);


--
-- Name: log_events_d87540bb_882e_4304_9bec_7172047840e5 log_events_d87540bb_882e_4304_9bec_7172047840e5_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.log_events_d87540bb_882e_4304_9bec_7172047840e5
    ADD CONSTRAINT log_events_d87540bb_882e_4304_9bec_7172047840e5_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: partner_users partner_users_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: saved_search_counters saved_search_counters_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_search_counters
    ADD CONSTRAINT saved_search_counters_pkey PRIMARY KEY (id);


--
-- Name: saved_searches saved_searches_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_searches
    ADD CONSTRAINT saved_searches_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402 schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402
    ADD CONSTRAINT schema_migrations_09ef132f_2484_45d7_944c_a4cebd801402_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a
    ADD CONSTRAINT schema_migrations_1f4e2106_b3b4_4d67_b39e_b36f95a74a2a_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5 schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5
    ADD CONSTRAINT schema_migrations_39cbcdc3_6963_4888_9bfb_6e686d1518c5_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4 schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4
    ADD CONSTRAINT schema_migrations_4d039a66_f2f6_4333_84e2_6ed2164631b4_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4 schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4
    ADD CONSTRAINT schema_migrations_551b8385_bfbb_4e5b_a653_2f9476d08ba4_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646 schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646
    ADD CONSTRAINT schema_migrations_9cae37bf_dd53_416a_834c_802c1ca62646_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0 schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0
    ADD CONSTRAINT schema_migrations_adbe9f86_4491_4434_ae30_4698ae99e1b0_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da
    ADD CONSTRAINT schema_migrations_bfc97cf7_7b43_4ffe_87bd_25c6789de6da_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations_d87540bb_882e_4304_9bec_7172047840e5 schema_migrations_d87540bb_882e_4304_9bec_7172047840e5_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: postgres
--

ALTER TABLE ONLY _analytics.schema_migrations_d87540bb_882e_4304_9bec_7172047840e5
    ADD CONSTRAINT schema_migrations_d87540bb_882e_4304_9bec_7172047840e5_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: source_backends source_backends_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_backends
    ADD CONSTRAINT source_backends_pkey PRIMARY KEY (id);


--
-- Name: source_schemas source_schemas_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_schemas
    ADD CONSTRAINT source_schemas_pkey PRIMARY KEY (id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: system_metrics system_metrics_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.system_metrics
    ADD CONSTRAINT system_metrics_pkey PRIMARY KEY (id);


--
-- Name: team_users team_users_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.team_users
    ADD CONSTRAINT team_users_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vercel_auths vercel_auths_pkey; Type: CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.vercel_auths
    ADD CONSTRAINT vercel_auths_pkey PRIMARY KEY (id);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_phone_key UNIQUE (phone);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: billing_accounts_stripe_customer_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX billing_accounts_stripe_customer_index ON _analytics.billing_accounts USING btree (stripe_customer);


--
-- Name: billing_accounts_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX billing_accounts_user_id_index ON _analytics.billing_accounts USING btree (user_id);


--
-- Name: billing_counts_inserted_at_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX billing_counts_inserted_at_index ON _analytics.billing_counts USING btree (inserted_at);


--
-- Name: billing_counts_source_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX billing_counts_source_id_index ON _analytics.billing_counts USING btree (source_id);


--
-- Name: billing_counts_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX billing_counts_user_id_index ON _analytics.billing_counts USING btree (user_id);


--
-- Name: endpoint_queries_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX endpoint_queries_token_index ON _analytics.endpoint_queries USING btree (token);


--
-- Name: endpoint_queries_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX endpoint_queries_user_id_index ON _analytics.endpoint_queries USING btree (user_id);


--
-- Name: oauth_access_grants_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX oauth_access_grants_token_index ON _analytics.oauth_access_grants USING btree (token);


--
-- Name: oauth_access_tokens_refresh_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX oauth_access_tokens_refresh_token_index ON _analytics.oauth_access_tokens USING btree (refresh_token);


--
-- Name: oauth_access_tokens_resource_owner_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX oauth_access_tokens_resource_owner_id_index ON _analytics.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: oauth_access_tokens_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX oauth_access_tokens_token_index ON _analytics.oauth_access_tokens USING btree (token);


--
-- Name: oauth_applications_owner_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX oauth_applications_owner_id_index ON _analytics.oauth_applications USING btree (owner_id);


--
-- Name: oauth_applications_uid_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX oauth_applications_uid_index ON _analytics.oauth_applications USING btree (uid);


--
-- Name: partner_users_partner_id_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX partner_users_partner_id_user_id_index ON _analytics.partner_users USING btree (partner_id, user_id);


--
-- Name: payment_methods_customer_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX payment_methods_customer_id_index ON _analytics.payment_methods USING btree (customer_id);


--
-- Name: payment_methods_stripe_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX payment_methods_stripe_id_index ON _analytics.payment_methods USING btree (stripe_id);


--
-- Name: rules_source_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX rules_source_id_index ON _analytics.rules USING btree (source_id);


--
-- Name: saved_search_counters_timestamp_saved_search_id_granularity_ind; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX saved_search_counters_timestamp_saved_search_id_granularity_ind ON _analytics.saved_search_counters USING btree ("timestamp", saved_search_id, granularity);


--
-- Name: saved_searches_querystring_source_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX saved_searches_querystring_source_id_index ON _analytics.saved_searches USING btree (querystring, source_id);


--
-- Name: source_schemas_source_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX source_schemas_source_id_index ON _analytics.source_schemas USING btree (source_id);


--
-- Name: sources_name_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX sources_name_index ON _analytics.sources USING btree (id, name);


--
-- Name: sources_public_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX sources_public_token_index ON _analytics.sources USING btree (public_token);


--
-- Name: sources_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX sources_token_index ON _analytics.sources USING btree (token);


--
-- Name: sources_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX sources_user_id_index ON _analytics.sources USING btree (user_id);


--
-- Name: system_metrics_node_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX system_metrics_node_index ON _analytics.system_metrics USING btree (node);


--
-- Name: team_users_provider_uid_team_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX team_users_provider_uid_team_id_index ON _analytics.team_users USING btree (provider_uid, team_id);


--
-- Name: team_users_team_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX team_users_team_id_index ON _analytics.team_users USING btree (team_id);


--
-- Name: teams_token_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX teams_token_index ON _analytics.teams USING btree (token);


--
-- Name: teams_user_id_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX teams_user_id_index ON _analytics.teams USING btree (user_id);


--
-- Name: users_api_key_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE INDEX users_api_key_index ON _analytics.users USING btree (api_key);


--
-- Name: users_lower_email_index; Type: INDEX; Schema: _analytics; Owner: supabase_admin
--

CREATE UNIQUE INDEX users_lower_email_index ON _analytics.users USING btree (lower((email)::text));


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_verified_phone_factor; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_verified_phone_factor ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_documents_author; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_author ON public.documents USING btree (author);


--
-- Name: ix_documents_content_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_content_fts ON public.documents USING gin (to_tsvector('english'::regconfig, content));


--
-- Name: ix_documents_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_created_at ON public.documents USING brin (created_at);


--
-- Name: ix_documents_document_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_document_id ON public.documents USING btree (document_id);


--
-- Name: ix_documents_embedding; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_embedding ON public.documents USING ivfflat (embedding) WITH (lists='100');


--
-- Name: ix_documents_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_source ON public.documents USING btree (source);


--
-- Name: ix_documents_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_source_id ON public.documents USING btree (source_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: billing_accounts billing_accounts_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_accounts
    ADD CONSTRAINT billing_accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;


--
-- Name: billing_counts billing_counts_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.billing_counts
    ADD CONSTRAINT billing_counts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;


--
-- Name: endpoint_queries endpoint_queries_sandbox_query_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_sandbox_query_id_fkey FOREIGN KEY (sandbox_query_id) REFERENCES _analytics.endpoint_queries(id);


--
-- Name: endpoint_queries endpoint_queries_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);


--
-- Name: oauth_access_grants oauth_access_grants_application_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);


--
-- Name: oauth_access_tokens oauth_access_tokens_application_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);


--
-- Name: partner_users partner_users_partner_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES _analytics.partners(id);


--
-- Name: partner_users partner_users_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);


--
-- Name: payment_methods payment_methods_customer_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.payment_methods
    ADD CONSTRAINT payment_methods_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES _analytics.billing_accounts(stripe_customer) ON DELETE CASCADE;


--
-- Name: rules rules_sink_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_sink_fkey FOREIGN KEY (sink) REFERENCES _analytics.sources(token) ON DELETE CASCADE;


--
-- Name: rules rules_source_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;


--
-- Name: saved_search_counters saved_search_counters_saved_search_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_search_counters
    ADD CONSTRAINT saved_search_counters_saved_search_id_fkey FOREIGN KEY (saved_search_id) REFERENCES _analytics.saved_searches(id) ON DELETE CASCADE;


--
-- Name: saved_searches saved_searches_source_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.saved_searches
    ADD CONSTRAINT saved_searches_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;


--
-- Name: source_backends source_backends_source_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_backends
    ADD CONSTRAINT source_backends_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id);


--
-- Name: source_schemas source_schemas_source_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.source_schemas
    ADD CONSTRAINT source_schemas_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;


--
-- Name: sources sources_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.sources
    ADD CONSTRAINT sources_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;


--
-- Name: team_users team_users_team_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.team_users
    ADD CONSTRAINT team_users_team_id_fkey FOREIGN KEY (team_id) REFERENCES _analytics.teams(id) ON DELETE CASCADE;


--
-- Name: teams teams_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.teams
    ADD CONSTRAINT teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;


--
-- Name: vercel_auths vercel_auths_user_id_fkey; Type: FK CONSTRAINT; Schema: _analytics; Owner: supabase_admin
--

ALTER TABLE ONLY _analytics.vercel_auths
    ADD CONSTRAINT vercel_auths_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: logflare_pub; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION logflare_pub WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION logflare_pub OWNER TO supabase_admin;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: logflare_pub billing_accounts; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.billing_accounts;


--
-- Name: logflare_pub plans; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.plans;


--
-- Name: logflare_pub rules; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.rules;


--
-- Name: logflare_pub source_schemas; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.source_schemas;


--
-- Name: logflare_pub sources; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.sources;


--
-- Name: logflare_pub users; Type: PUBLICATION TABLE; Schema: _analytics; Owner: supabase_admin
--

ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.users;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: FUNCTION halfvec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_out(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_out(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION halfvec_send(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_send(public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION sparsevec_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_out(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_out(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION sparsevec_send(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_send(public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION vector_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_in(cstring, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_out(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_out(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_out(public.vector) TO service_role;


--
-- Name: FUNCTION vector_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO postgres;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO anon;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO authenticated;
GRANT ALL ON FUNCTION public.vector_recv(internal, oid, integer) TO service_role;


--
-- Name: FUNCTION vector_send(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_send(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_send(public.vector) TO service_role;


--
-- Name: FUNCTION vector_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO anon;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_typmod_in(cstring[]) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(real[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(real[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(double precision[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(double precision[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(integer[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(integer[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_halfvec(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_halfvec(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION array_to_vector(numeric[], integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.array_to_vector(numeric[], integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_float4(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_float4(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_sparsevec(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_sparsevec(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION halfvec_to_vector(public.halfvec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_to_vector(public.halfvec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_halfvec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_halfvec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION sparsevec_to_vector(public.sparsevec, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_to_vector(public.sparsevec, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_float4(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_float4(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_halfvec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_halfvec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector_to_sparsevec(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector_to_sparsevec(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION vector(public.vector, integer, boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO anon;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO authenticated;
GRANT ALL ON FUNCTION public.vector(public.vector, integer, boolean) TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer); Type: ACL; Schema: net; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO postgres;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION binary_quantize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.halfvec) TO service_role;


--
-- Name: FUNCTION binary_quantize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.binary_quantize(public.vector) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION cosine_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.cosine_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION halfvec_accum(double precision[], public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_accum(double precision[], public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_add(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_add(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_cmp(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_cmp(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION halfvec_concat(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_concat(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_eq(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_eq(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ge(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ge(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_gt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_gt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_l2_squared_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_l2_squared_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_le(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_le(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_lt(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_lt(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_mul(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_mul(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_ne(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_ne(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_negative_inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_negative_inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_spherical_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_spherical_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION halfvec_sub(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.halfvec_sub(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION hamming_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.hamming_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION hnsw_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_bit_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION hnsw_sparsevec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnsw_sparsevec_support(internal) TO service_role;


--
-- Name: FUNCTION hnswhandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.hnswhandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO anon;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.hnswhandler(internal) TO service_role;


--
-- Name: FUNCTION hybrid_search(in_query text, in_embedding public.vector, in_match_count integer, full_text_weight double precision, semantic_weight double precision, rrf_k integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.hybrid_search(in_query text, in_embedding public.vector, in_match_count integer, full_text_weight double precision, semantic_weight double precision, rrf_k integer) TO anon;
GRANT ALL ON FUNCTION public.hybrid_search(in_query text, in_embedding public.vector, in_match_count integer, full_text_weight double precision, semantic_weight double precision, rrf_k integer) TO authenticated;
GRANT ALL ON FUNCTION public.hybrid_search(in_query text, in_embedding public.vector, in_match_count integer, full_text_weight double precision, semantic_weight double precision, rrf_k integer) TO service_role;


--
-- Name: FUNCTION inner_product(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION ivfflat_bit_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_bit_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflat_halfvec_support(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflat_halfvec_support(internal) TO service_role;


--
-- Name: FUNCTION ivfflathandler(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO postgres;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO anon;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO authenticated;
GRANT ALL ON FUNCTION public.ivfflathandler(internal) TO service_role;


--
-- Name: FUNCTION jaccard_distance(bit, bit); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO postgres;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO anon;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO authenticated;
GRANT ALL ON FUNCTION public.jaccard_distance(bit, bit) TO service_role;


--
-- Name: FUNCTION l1_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l1_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l1_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_distance(public.halfvec, public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.halfvec, public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION l2_norm(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_norm(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_norm(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.halfvec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.sparsevec) TO service_role;


--
-- Name: FUNCTION l2_normalize(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO anon;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.l2_normalize(public.vector) TO service_role;


--
-- Name: FUNCTION match_page_sections(in_embedding public.vector, in_match_count integer, in_document_id text, in_source_id text, in_source text, in_author text, in_start_date timestamp with time zone, in_end_date timestamp with time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.match_page_sections(in_embedding public.vector, in_match_count integer, in_document_id text, in_source_id text, in_source text, in_author text, in_start_date timestamp with time zone, in_end_date timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.match_page_sections(in_embedding public.vector, in_match_count integer, in_document_id text, in_source_id text, in_source text, in_author text, in_start_date timestamp with time zone, in_end_date timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.match_page_sections(in_embedding public.vector, in_match_count integer, in_document_id text, in_source_id text, in_source text, in_author text, in_start_date timestamp with time zone, in_end_date timestamp with time zone) TO service_role;


--
-- Name: FUNCTION sparsevec_cmp(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_cmp(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_eq(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_eq(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ge(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ge(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_gt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_gt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_l2_squared_distance(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_le(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_le(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_lt(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_lt(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_ne(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_ne(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION sparsevec_negative_inner_product(public.sparsevec, public.sparsevec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO postgres;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO anon;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO authenticated;
GRANT ALL ON FUNCTION public.sparsevec_negative_inner_product(public.sparsevec, public.sparsevec) TO service_role;


--
-- Name: FUNCTION subvector(public.halfvec, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.halfvec, integer, integer) TO service_role;


--
-- Name: FUNCTION subvector(public.vector, integer, integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO postgres;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO anon;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO authenticated;
GRANT ALL ON FUNCTION public.subvector(public.vector, integer, integer) TO service_role;


--
-- Name: FUNCTION vector_accum(double precision[], public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_accum(double precision[], public.vector) TO service_role;


--
-- Name: FUNCTION vector_add(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_add(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_avg(double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_avg(double precision[]) TO service_role;


--
-- Name: FUNCTION vector_cmp(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_cmp(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_combine(double precision[], double precision[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO postgres;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO anon;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO authenticated;
GRANT ALL ON FUNCTION public.vector_combine(double precision[], double precision[]) TO service_role;


--
-- Name: FUNCTION vector_concat(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_concat(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_dims(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.halfvec) TO service_role;


--
-- Name: FUNCTION vector_dims(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_dims(public.vector) TO service_role;


--
-- Name: FUNCTION vector_eq(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_eq(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ge(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ge(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_gt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_gt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_l2_squared_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_l2_squared_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_le(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_le(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_lt(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_lt(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_mul(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_mul(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_ne(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_ne(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_negative_inner_product(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_negative_inner_product(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_norm(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_norm(public.vector) TO service_role;


--
-- Name: FUNCTION vector_spherical_distance(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_spherical_distance(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION vector_sub(public.vector, public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO postgres;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO anon;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.vector_sub(public.vector, public.vector) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;


--
-- Name: FUNCTION avg(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.halfvec) TO service_role;


--
-- Name: FUNCTION avg(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.avg(public.vector) TO anon;
GRANT ALL ON FUNCTION public.avg(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.avg(public.vector) TO service_role;


--
-- Name: FUNCTION sum(public.halfvec); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.halfvec) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO anon;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.halfvec) TO service_role;


--
-- Name: FUNCTION sum(public.vector); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum(public.vector) TO postgres;
GRANT ALL ON FUNCTION public.sum(public.vector) TO anon;
GRANT ALL ON FUNCTION public.sum(public.vector) TO authenticated;
GRANT ALL ON FUNCTION public.sum(public.vector) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE documents; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.documents TO anon;
GRANT ALL ON TABLE public.documents TO authenticated;
GRANT ALL ON TABLE public.documents TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

