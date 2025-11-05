create table customers (
  customer_id    bigint generated always as identity primary key,
  email          text not null unique,
  phone          text,
  first_name     text,
  last_name      text,
  middle_name    text,
  registred_at   timestamptz not null default now(),
  marketingopt_in boolean not null default false,
  status         smallint not null default 1
  -- status: 1 = активен, 0 = неактивен, 2 = заблокирован
);

create table customer_addresses (
  address_id     bigint generated always as identity primary key,
  customer_id    bigint not null,
  is_default     boolean not null default false,
  receiver_name  text not null,
  country_code   char(2) not null,
  city           text not null,
  addressline    text not null,
  created_at     timestamptz not null default now(),
  constraint fk_customer_addresses_customer
    foreign key (customer_id) references public.customers(customer_id) on delete cascade,
  constraint chk_country_code_iso2_upper check (country_code ~ '^[A-Z]{2}$')
);

-- Индексы и ограничение: по одному дефолтному адресу на клиента
create index if not exists ix_customer_addresses_customer_id on public.customer_addresses(customer_id);

create unique index if not exists uq_customer_default_address
  on public.customer_addresses(customer_id)
  where is_default;


create table if not exists public.categories (
  category_id bigint generated always as identity primary key,
  name        text not null,
  slug        text not null,
  is_active   boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  constraint chk_categories_slug_format check (slug ~ '^[a-z0-9]+(?:-[a-z0-9]+)*$')
);

-- Уникальные индексы
create unique index if not exists ux_categories_slug on public.categories (slug);
create unique index if not exists ux_categories_name on public.categories (name);


create table if not exists products (
  product_id  bigint generated always as identity primary key,
  name        text not null,
  slug        text not null,
  brand       text not null,
  description text,
  attributes  jsonb not null default '{}'::jsonb,
  is_active   boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  constraint chk_products_slug_format check (slug ~ '^[a-z0-9]+(?:-[a-z0-9]+)*$'),
  constraint chk_products_name_not_blank check (btrim(name) <> ''),
  constraint chk_products_brand_not_blank check (btrim(brand) <> '')
);

-- Индексы
create unique index if not exists ux_products_slug on public.products (slug);
create index if not exists ix_products_brand on public.products (brand);

