-- =====================================================
--  MARATÓN · base de datos (pegar entero en Supabase →
--  SQL Editor → New query → Run). Solo una vez.
-- =====================================================

create table if not exists members (
  id text primary key,
  name text not null,
  emoji text,
  color text,
  created_at timestamptz default now()
);

create table if not exists items (
  id text primary key,
  type text not null,              -- movie, series, book, audiobook, podcast, album, artist, song, game
  title text not null,
  subtitle text,                   -- autor / director / artista
  year int,
  cover text,
  description text,
  genres text[] default '{}',
  source text,                     -- tmdb, gbooks, openlibrary, itunes, rawg, letterboxd, manual
  external_id text,
  extra jsonb default '{}',        -- duración, páginas, temporadas…
  owned boolean default false,     -- "lo tenemos"
  format text,                     -- Físico / Digital
  location text,                   -- estantería salón, casa de Marta…
  created_by text,
  created_at timestamptz default now()
);

create table if not exists statuses (
  id text primary key,             -- itemId_memberId
  item_id text references items(id) on delete cascade,
  member_id text references members(id) on delete cascade,
  status text,                     -- wishlist, pending, doing, done, dropped
  rating int check (rating between 1 and 10),
  progress jsonb default '{}',
  started_at date,
  finished_at date,
  times int default 0,
  updated_at timestamptz default now()
);

create table if not exists sessions (
  id text primary key,
  item_id text references items(id) on delete cascade,
  member_id text references members(id) on delete cascade,
  started_at timestamptz,
  minutes int not null,
  manual boolean default false
);

create table if not exists comments (
  id text primary key,
  item_id text references items(id) on delete cascade,
  member_id text references members(id) on delete cascade,
  text text not null,
  spoiler boolean default false,
  created_at timestamptz default now()
);

create table if not exists recs (
  id text primary key,
  item_id text references items(id) on delete cascade,
  from_id text,
  to_id text,
  note text,
  created_at timestamptz default now()
);

create table if not exists activity (
  id text primary key,
  member_id text,
  item_id text references items(id) on delete cascade,
  kind text,
  data jsonb default '{}',
  created_at timestamptz default now()
);

create table if not exists settings (
  id text primary key,
  value text
);

create index if not exists statuses_item on statuses(item_id);
create index if not exists sessions_member on sessions(member_id);
create index if not exists activity_created on activity(created_at desc);

-- Seguridad: solo quien ha entrado con la cuenta del grupo puede leer y escribir.
-- Y activamos el tiempo real para que los cambios lleguen al instante a los 4 móviles.
do $$
declare t text;
begin
  foreach t in array array['members','items','statuses','sessions','comments','recs','activity','settings'] loop
    execute format('alter table %I enable row level security', t);
    execute format('drop policy if exists grupo on %I', t);
    execute format('create policy grupo on %I for all to authenticated using (true) with check (true)', t);
    begin
      execute format('alter publication supabase_realtime add table %I', t);
    exception when duplicate_object then null;
    end;
  end loop;
end $$;
