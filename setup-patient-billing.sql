-- WAK Health & Home Care patient and billing tables
-- Run this in Supabase Dashboard > SQL Editor > New query.
-- Existing wak_updates table is not changed.
create extension if not exists pgcrypto;

create table if not exists public.wak_patients (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  phone text,
  age integer check (age is null or age between 0 and 120),
  gender text,
  address text,
  care_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.wak_invoices (
  id uuid primary key default gen_random_uuid(),
  patient_id uuid not null references public.wak_patients(id) on delete restrict,
  service_description text not null,
  amount_total numeric(12,2) not null check (amount_total >= 0),
  amount_paid numeric(12,2) not null default 0 check (amount_paid >= 0 and amount_paid <= amount_total),
  payment_status text not null default 'unpaid' check (payment_status in ('unpaid','partial','paid')),
  invoice_date date not null default current_date,
  notes text,
  created_at timestamptz not null default now()
);

alter table public.wak_patients enable row level security;
alter table public.wak_invoices enable row level security;

drop policy if exists "Authenticated users manage WAK patients" on public.wak_patients;
create policy "Authenticated users manage WAK patients" on public.wak_patients
for all to authenticated using (true) with check (true);

drop policy if exists "Authenticated users manage WAK invoices" on public.wak_invoices;
create policy "Authenticated users manage WAK invoices" on public.wak_invoices
for all to authenticated using (true) with check (true);

grant select, insert, update, delete on public.wak_patients to authenticated;
grant select, insert, update, delete on public.wak_invoices to authenticated;
