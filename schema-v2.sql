-- =====================================================
--  MARATÓN · actualización v2 (listas, citas, préstamos,
--  retos, ver juntos). Pegar en Supabase → SQL Editor → Run.
--  Solo una vez. No borra nada de lo que ya tenéis.
-- =====================================================

create table if not exists lists (
  id text primary key, name text not null, emoji text,
  created_by text, created_at timestamptz default now());

create table if not exists list_items (
  id text primary key,
  list_id text references lists(id) on delete cascade,
  item_id text references items(id) on delete cascade,
  added_by text, created_at timestamptz default now());

create table if not exists quotes (
  id text primary key,
  item_id text references items(id) on delete cascade,
  member_id text references members(id) on delete cascade,
  text text not null, ref text, created_at timestamptz default now());

create table if not exists loans (
  id text primary key,
  item_id text references items(id) on delete cascade,
  lender_id text, borrower text not null,
  since date, returned_at date, created_at timestamptz default now());

create table if not exists challenges (
  id text primary key,
  member_id text references members(id) on delete cascade,
  year int not null, type text not null, target int not null,
  created_at timestamptz default now());

create table if not exists together (
  id text primary key,
  item_id text references items(id) on delete cascade,
  added_by text, created_at timestamptz default now());

create table if not exists votes (
  id text primary key,
  item_id text references items(id) on delete cascade,
  member_id text references members(id) on delete cascade,
  created_at timestamptz default now());

do $$
declare t text;
begin
  foreach t in array array['lists','list_items','quotes','loans','challenges','together','votes'] loop
    execute format('alter table %I enable row level security', t);
    execute format('drop policy if exists grupo on %I', t);
    execute format('create policy grupo on %I for all to authenticated using (true) with check (true)', t);
    begin
      execute format('alter publication supabase_realtime add table %I', t);
    exception when duplicate_object then null;
    end;
  end loop;
end $$;
