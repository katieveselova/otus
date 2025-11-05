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


