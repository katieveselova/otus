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

