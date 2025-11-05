insert into public.customers
  (email, phone, first_name, last_name, middle_name, registred_at, marketingopt_in, status)
values
  ('ivan.petrov@example.com',        '+7 999 111-11-11', 'Иван',      'Петров',     'Александрович', now() - interval '360 days', true,  1),
  ('olga.ivanova@example.com',       '+7 916 123-45-67', 'Ольга',     'Иванова',    'Сергеевна',     now() - interval '340 days', false, 1),
  ('john.smith@example.com',         '+1 202 555 0101',  'John',      'Smith',      null,            now() - interval '330 days', true,  1),
  ('maria.garcia@example.com',       '+34 600 123 456',  'Maria',     'Garcia',     null,            now() - interval '325 days', true,  1),
  ('wei.chen@example.com',           '+86 138 0013 8000','Wei',       'Chen',       null,            now() - interval '310 days', false, 2),
  ('anna.mueller@example.de',        '+49 151 12345678', 'Anna',      'Müller',     null,            now() - interval '300 days', true,  1),
  ('pierre.dupont@example.fr',       '+33 6 12 34 56 78','Pierre',    'Dupont',     null,            now() - interval '290 days', false, 0),
  ('sara.ahmed@example.ae',          '+971 50 123 4567', 'Sara',      'Ahmed',      null,            now() - interval '285 days', true,  1),
  ('lucas.rossi@example.it',         '+39 347 123 4567', 'Lucas',     'Rossi',      null,            now() - interval '280 days', true,  1),
  ('yuki.tanaka@example.jp',         '+81 90 1234 5678', 'Yuki',      'Tanaka',     null,            now() - interval '270 days', false, 1),
  ('fatima.khan@example.pk',         '+92 300 1234567',  'Fatima',    'Khan',       null,            now() - interval '260 days', true,  1),
  ('carlos.silva@example.br',        '+55 11 91234 5678','Carlos',    'Silva',      null,            now() - interval '250 days', false, 0),
  ('emma.johnson@example.com',       '+1 415 555 0199',  'Emma',      'Johnson',    null,            now() - interval '240 days', true,  1),
  ('pavel.sidorov@example.ru',       '+7 921 555-22-33', 'Павел',     'Сидоров',    'Игоревич',      now() - interval '230 days', true,  1),
  ('natalya.kuznetsova@example.ru',  '+7 903 555-33-44', 'Наталья',   'Кузнецова',  'Павловна',      now() - interval '220 days', false, 1),
  ('dmitry.orlov@example.ru',        '+7 905 777-88-99', 'Дмитрий',   'Орлов',      'Викторович',    now() - interval '210 days', true,  2),
  ('svetlana.morozova@example.ru',   '+7 916 444-55-66', 'Светлана',  'Морозова',   'Алексеевна',    now() - interval '200 days', true,  1),
  ('andrey.popov@example.ru',        '+7 926 777-66-55', 'Андрей',    'Попов',      'Сергеевич',     now() - interval '190 days', false, 1),
  ('elena.smirnova@example.ru',      '+7 929 111-22-33', 'Елена',     'Смирнова',   'Владимировна',  now() - interval '180 days', true,  1),
  ('viktor.karpov@example.ru',       '+7 903 777-00-11', 'Виктор',    'Карпов',     'Валерьевич',    now() - interval '170 days', false, 0),
  ('marina.volkova@example.ru',      '+7 916 000-99-88', 'Марина',    'Волкова',    'Романовна',     now() - interval '160 days', true,  1),
  ('sergey.lebedev@example.ru',      '+7 915 333-44-55', 'Сергей',    'Лебедев',    'Николаевич',    now() - interval '150 days', true,  1),
  ('alexey.fedorov@example.ru',      '+7 903 222-33-44', 'Алексей',   'Фёдоров',    'Евгеньевич',    now() - interval '140 days', false, 2),
  ('ekaterina.pavlova@example.ru',   '+7 916 555-66-77', 'Екатерина', 'Павлова',    'Дмитриевна',    now() - interval '130 days', true,  1),
  ('roman.belov@example.ru',         '+7 925 111-00-22', 'Роман',     'Белов',      'Андреевич',     now() - interval '120 days', false, 1),
  ('daria.nikitina@example.ru',      '+7 903 555-77-88', 'Дарья',     'Никитина',   'Ильинична',     now() - interval '110 days', true,  1),
  ('nikita.sorokin@example.ru',      '+7 916 444-22-11', 'Никита',    'Сорокин',    'Станиславович', now() - interval '100 days', false, 1),
  ('tatiana.romanova@example.ru',    '+7 905 888-77-66', 'Татьяна',   'Романова',   'Петровна',      now() - interval '90 days',  true,  1),
  ('boris.egorov@example.ru',        '+7 903 999-88-77', 'Борис',     'Егоров',     'Фёдорович',     now() - interval '80 days',  false, 0),
  ('ksenia.zaitseva@example.ru',     '+7 916 222-55-44', 'Ксения',    'Зайцева',    'Алексеевна',    now() - interval '70 days',  true,  1);

with src as (
  select
    c.customer_id,
    format('Получатель %s', row_number() over (order by c.customer_id)) as receiver_name,
    case (row_number() over (order by c.customer_id)) % 6
      when 0 then 'RU'
      when 1 then 'US'
      when 2 then 'DE'
      when 3 then 'FR'
      when 4 then 'GB'
      else 'ES'
    end as country_code,
    case (row_number() over (order by c.customer_id)) % 6
      when 0 then 'Москва'
      when 1 then 'Нью-Йорк'
      when 2 then 'Берлин'
      when 3 then 'Париж'
      when 4 then 'Лондон'
      else 'Мадрид'
    end as city,
    format('ул. Тестовая, д.%s, кв.%s',
           10 + (c.customer_id % 50),
           1 + (c.customer_id % 100)) as addressline,
    now() - make_interval(days := ((c.customer_id % 30)::int)) as created_at,
    ((row_number() over (order by c.customer_id)) % 3 = 0) as is_default
  from public.customers c
  order by c.customer_id
  limit 30
)
insert into public.customer_addresses
  (customer_id, is_default, receiver_name, country_code, city, addressline, created_at)
select
  customer_id, is_default, receiver_name, country_code, city, addressline, created_at
from src;

insert into public.categories (name, slug, is_active, created_at, updated_at) values
('Электроника',           'elektronika',            true,  now() - interval '29 days', now() - interval '29 days'),
('Ноутбуки',              'noutbuki',               true,  now() - interval '28 days', now() - interval '28 days'),
('Смартфоны',             'smartfony',              true,  now() - interval '27 days', now() - interval '27 days'),
('Планшеты',              'planshety',              true,  now() - interval '26 days', now() - interval '26 days'),
('Аудиотехника',          'audiotehnika',           false, now() - interval '25 days', now() - interval '25 days'),
('Телевизоры',            'televizory',             true,  now() - interval '24 days', now() - interval '24 days'),
('Фото и видео',          'foto-i-video',           true,  now() - interval '23 days', now() - interval '23 days'),
('Игровые приставки',     'igrovye-pristavki',      true,  now() - interval '22 days', now() - interval '22 days'),
('Компьютеры',            'kompyutery',             true,  now() - interval '21 days', now() - interval '21 days'),
('Периферия',             'periferiya',             false, now() - interval '20 days', now() - interval '20 days'),
('Умный дом',             'umnyj-dom',              true,  now() - interval '19 days', now() - interval '19 days'),
('Бытовая техника',       'bytovaya-tehnika',       true,  now() - interval '18 days', now() - interval '18 days'),
('Кухонная техника',      'kuhonnaya-tehnika',      true,  now() - interval '17 days', now() - interval '17 days'),
('Красота и здоровье',    'krasota-i-zdorove',      true,  now() - interval '16 days', now() - interval '16 days'),
('Спорт и отдых',         'sport-i-otdyh',          false, now() - interval '15 days', now() - interval '15 days'),
('Детские товары',        'detskie-tovary',         true,  now() - interval '14 days', now() - interval '14 days'),
('Автотовары',            'avtotovary',             true,  now() - interval '13 days', now() - interval '13 days'),
('Зоотовары',             'zootovary',              true,  now() - interval '12 days', now() - interval '12 days'),
('Канцтовары',            'kanctovary',             true,  now() - interval '11 days', now() - interval '11 days'),
('Книги',                 'knigi',                  false, now() - interval '10 days', now() - interval '10 days'),
('Музыка',                'muzyka',                 true,  now() - interval '9 days',  now() - interval '9 days'),
('Фильмы',                'filmy',                  true,  now() - interval '8 days',  now() - interval '8 days'),
('ПО',                    'po',                     true,  now() - interval '7 days',  now() - interval '7 days'),
('Игры ПК',               'igry-pk',                true,  now() - interval '6 days',  now() - interval '6 days'),
('Одежда',                'odezhda',                false, now() - interval '5 days',  now() - interval '5 days'),
('Обувь',                 'obuv',                   true,  now() - interval '4 days',  now() - interval '4 days'),
('Аксессуары',            'aksessuary',             true,  now() - interval '3 days',  now() - interval '3 days'),
('Часы',                  'chasy',                  true,  now() - interval '2 days',  now() - interval '2 days'),
('Ювелирные изделия',     'yuvelirnye-izdeliya',    true,  now() - interval '1 days',  now() - interval '1 days'),
('Подарки',               'podarki',                false, now(),                       now());

