create extension vector;

create table if not exists documents (
    id text primary key default gen_random_uuid()::text,
    source text,
    source_id text,
    content text,
    document_id text,
    author text,
    url text,
    created_at timestamptz default now(),
    embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model
);

create index ix_documents_document_id on documents using btree ( document_id );
create index ix_documents_source on documents using btree ( source );
create index ix_documents_source_id on documents using btree ( source_id );
create index ix_documents_author on documents using btree ( author );
create index ix_documents_created_at on documents using brin ( created_at );

-- alter table documents enable row level security;

create or replace function match_page_sections(in_embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model
                                            , in_match_count int default 3
                                            , in_document_id text default '%%'
                                            , in_source_id text default '%%'
                                            , in_source text default '%%'
                                            , in_author text default '%%'
                                            , in_start_date timestamptz default '-infinity'
                                            , in_end_date timestamptz default 'infinity')
returns table (id text
            , source text
            , source_id text
            , document_id text
            , url text
            , created_at timestamptz
            , author text
            , content text
            , embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model
            , similarity float)
language plpgsql
as $$
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

-- create an index for the full-text search
create index ix_documents_content_fts on documents using gin (to_tsvector('english', content));

-- create an index for the semantic vector search
create index ix_documents_embedding on documents using ivfflat(embedding) with (lists=100);












-- Function to perform hybrid search combining full-text and semantic search
CREATE OR REPLACE FUNCTION hybrid_search(
    in_query TEXT,
    in_embedding VECTOR(1024), -- Adjust the dimension as needed
    in_match_count INT DEFAULT 3,
    full_text_weight FLOAT DEFAULT 1.0,
    semantic_weight FLOAT DEFAULT 1.0,
    rrf_k INT DEFAULT 50
)
RETURNS TABLE (
    id TEXT,
    source TEXT,
    source_id TEXT,
    document_id TEXT,
    url TEXT,
    created_at TIMESTAMPTZ,
    author TEXT,
    content TEXT,
    embedding VECTOR(1024), -- Adjust the dimension as needed
    rank FLOAT
)
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
$$
;



















-- -- create hybrid search function
-- create or replace function hybrid_search(
--     in_query text,
--     in_embedding vector(1024), -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model
--     in_match_count int default 3,
--     full_text_weight float default 1.0,
--     semantic_weight float default 1.0,
--     rrf_k int default 50
-- )
-- returns table (id text
--             , source text
--             , source_id text
--             , document_id text
--             , url text
--             , created_at timestamptz
--             , author text
--             , content text
--             , embedding vector(1024) -- 1024 is the default dimension, change depending on dimensionality of your chosen embeddings model
--             , rank float)
-- language plpgsql
-- as $$
-- with full_text_search as (
--     select
--         id,
--         row_number() over (order by ts_rank(to_tsvector('english', content), plainto_tsquery(in_query)) desc) as rank
--     from documents
--     where to_tsvector('english', content) @@ plainto_tsquery(in_query)
--     order by rank
--     limit rrf_k
-- ),

-- semantic_search as (
--     select
--         id,
--         row_number() over (order by (embedding <#> in_embedding) desc) as rank
--     from documents
--     where (embedding <#> in_embedding) > 0.5
--     order by rank
--     limit rrf_k
-- )

-- select
--     documents.* 
-- from full_text_search
-- full outer join semantic_search on full_text_search.id = semantic_search.id
-- join documents on coalesce(full_text_search.id, semantic_search.id) = documents.id
-- order by 
--     coalesce(full_text_search.rank, 0) * full_text_weight + coalesce(semantic_search.rank, 0) * semantic_weight desc
-- limit in_match_count;
-- $$;

















-- -- Enable pgvector extension
-- create extension if not exists vector with schema public;

-- -- Create tables 
-- create table "public"."nods_page" (
--   id bigserial primary key,
--   parent_page_id bigint references public.nods_page,
--   path text not null unique,
--   checksum text,
--   meta jsonb,
--   type text,
--   source text
-- );
-- alter table "public"."nods_page" enable row level security;

-- create table "public"."nods_page_section" (
--   id bigserial primary key,
--   page_id bigint not null references public.nods_page on delete cascade,
--   content text,
--   token_count int,
--   embedding vector(4096),
--   slug text,
--   heading text
-- );
-- alter table "public"."nods_page_section" enable row level security;

-- -- Create embedding similarity search functions
-- create or replace function match_page_sections(embedding vector(4096), match_threshold float, match_count int, min_content_length int)
-- returns table (id bigint, page_id bigint, slug text, heading text, content text, similarity float)
-- language plpgsql
-- as $$
-- #variable_conflict use_variable
-- begin
--   return query
--   select 
--     nods_page_section.id,
--     nods_page_section.page_id,
--     nods_page_section.slug,
--     nods_page_section.heading,
--     nods_page_section.content,
--     (nods_page_section.embedding <#> embedding) * -1 as similarity
--   from nods_page_section

--   -- We only care about sections that have a useful amount of content
--   where length(nods_page_section.content) >= min_content_length

--   -- The dot product is negative because of a Postgres limitation, so we negate it
--   and (nods_page_section.embedding <#> embedding) * -1 > match_threshold

--   -- OpenAI embeddings are normalized to length 1, so
--   -- cosine similarity and dot product will produce the same results.
--   -- Using dot product which can be computed slightly faster.
--   --
--   -- For the different syntaxes, see https://github.com/pgvector/pgvector
--   order by nods_page_section.embedding <#> embedding
  
--   limit match_count;
-- end;
-- $$;

-- create or replace function get_page_parents(page_id bigint)
-- returns table (id bigint, parent_page_id bigint, path text, meta jsonb)
-- language sql
-- as $$
--   with recursive chain as (
--     select *
--     from nods_page 
--     where id = page_id

--     union all

--     select child.*
--       from nods_page as child
--       join chain on chain.parent_page_id = child.id 
--   )
--   select id, parent_page_id, path, meta
--   from chain;
-- $$;
