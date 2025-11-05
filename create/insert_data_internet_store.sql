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

insert into public.products (name, slug, brand, description, attributes, is_active) values
('Смартфон Nova X10 128GB', 'smartfon-nova-x10-128gb', 'Nova', 'Быстрый смартфон с отличной камерой.', '{"category":"electronics","sku":"NOVAX10-128-BLK","color":"черный","storage_gb":128,"ram_gb":6,"display":"6.4 OLED","camera_mp":48,"dual_sim":true}'::jsonb, true),
('Смартфон Nova X10 Pro 256GB', 'smartfon-nova-x10-pro-256gb', 'Nova', 'Продвинутая версия с увеличенной памятью.', '{"category":"electronics","sku":"NOVAX10P-256-BLU","color":"синий","storage_gb":256,"ram_gb":8,"display":"6.5 OLED 120Hz","camera_mp":64,"nfc":true}'::jsonb, true),
('Наушники Aurelia AirFlow', 'naushniki-aurelia-airflow', 'Aurelia', 'Беспроводные наушники с шумоподавлением.', '{"category":"audio","sku":"AUR-AIRFLOW-WHT","color":"белый","type":"TWS","anc":true,"battery_hours":28,"bt_version":"5.3"}'::jsonb, true),
('Умные часы Tekno Pulse 2', 'umnye-chasy-tekno-pulse-2', 'Tekno', 'Фитнес-функции и уведомления на руке.', '{"category":"wearables","sku":"TEK-PULSE2-BLK","display":"AMOLED","gps":true,"nfc":true,"waterproof":"5ATM","battery_days":7}'::jsonb, true),
('Ноутбук Orbita Lite 14', 'noutbuk-orbita-lite-14', 'Orbita', 'Компактный ноутбук для учебы и работы.', '{"category":"computers","sku":"ORB-L14-8-256","cpu":"i5-1240P","ram_gb":8,"storage":"SSD 256GB","weight_kg":1.28,"screen":"14 IPS FHD"}'::jsonb, true),
('Ноутбук Orbita Pro 16', 'noutbuk-orbita-pro-16', 'Orbita', 'Мощная рабочая станция для создателей.', '{"category":"computers","sku":"ORB-P16-32-1T","cpu":"Ryzen 7 7840HS","ram_gb":32,"storage":"SSD 1TB","gpu":"RTX 4060","screen":"16 IPS 165Hz"}'::jsonb, true),
('Монитор Lumina View 27', 'monitor-lumina-view-27', 'Lumina', 'Тонкие рамки, цветопередача sRGB 99%.', '{"category":"monitors","sku":"LUM-V27-2K-IPS","size_in":27,"resolution":"2560x1440","panel":"IPS","refresh_hz":144,"ports":["HDMI","DP","USB-C"]}'::jsonb, true),
('Клавиатура Kraft TKL', 'klaviatura-kraft-tkl', 'Kraft', 'Механическая TKL с подсветкой.', '{"category":"peripherals","sku":"KRF-TKL-BRN","switches":"Brown","layout":"ISO","backlight":"RGB","connection":"USB-C"}'::jsonb, true),
('Мышь Kraft Glide', 'mysh-kraft-glide', 'Kraft', 'Легкая игровая мышь.', '{"category":"peripherals","sku":"KRF-GLIDE-BLK","sensor":"PAW3395","dpi_max":26000,"weight_g":59,"connection":"2.4G/Bluetooth"}'::jsonb, true),
('Веб-камера Lumina 4K', 'veb-kamera-lumina-4k', 'Lumina', 'Четкое изображение и автофокус.', '{"category":"video","sku":"LUM-CAM-4K","resolution":"4K","fps":30,"mic":true,"fov_deg":90}'::jsonb, true),
('Микрофон Aurelia Pod', 'mikrofon-aurelia-pod', 'Aurelia', 'USB-микрофон для стримов и подкастов.', '{"category":"audio","sku":"AUR-POD-USB","pattern":"cardioid","bit_depth":24,"sample_rate_khz":96,"mount_included":true}'::jsonb, true),
('Колонка Aurelia Wave Mini', 'kolonka-aurelia-wave-mini', 'Aurelia', 'Компактная умная колонка.', '{"category":"audio","sku":"AUR-WAVE-MINI","bt_version":"5.1","battery_hours":12,"waterproof":"IP67","voice_assistant":true}'::jsonb, true),
('Повербанк Velox 20K PD', 'powerbank-velox-20k-pd', 'Velox', 'Быстрая зарядка Power Delivery 65W.', '{"category":"power","sku":"VLX-PB-20K-PD","capacity_mah":20000,"output_w":65,"ports":["USB-C","USB-A"],"pass_through":true}'::jsonb, true),
('Зарядное устройство Velox Duo 45W', 'zaryadnoe-ustroystvo-velox-duo-45w', 'Velox', 'Компактное GaN-зарядное с двумя портами.', '{"category":"power","sku":"VLX-GAN-45W","ports":["USB-C","USB-C"],"max_w":45,"pps":true}'::jsonb, true),
('Маршрутизатор Tekno AX3000', 'marshrutizator-tekno-ax3000', 'Tekno', 'Wi‑Fi 6 роутер для дома.', '{"category":"network","sku":"TEK-AX3000","wifi":"802.11ax","bands":"dual","lan_ports":4,"usb":true}'::jsonb, true),
('SSD Polar NVMe 1TB', 'ssd-polar-nvme-1tb', 'Polar', 'Высокая скорость PCIe 4.0.', '{"category":"storage","sku":"PLR-NVME-1T","type":"NVMe","capacity_gb":1024,"pcie":"4.0","seq_read_mb_s":7000}'::jsonb, true),
('HDD Polar 4TB', 'hdd-polar-4tb', 'Polar', 'Надежный накопитель для архива.', '{"category":"storage","sku":"PLR-HDD-4T","type":"HDD","capacity_tb":4,"rpm":5400,"cache_mb":256}'::jsonb, true),
('Телевизор Lumina Quantum 55', 'televizor-lumina-quantum-55', 'Lumina', 'QLED 4K с поддержкой HDR10+.','{"category":"tv","sku":"LUM-Q55-HDR","size_in":55,"panel":"QLED","hdr":"HDR10+","hdmi":4,"smart_tv":true}'::jsonb, true),
('Экшн-камера Aero Dash 8', 'ekshn-kamera-aero-dash-8', 'Aero', 'Стабилизация и съемка 4K60.', '{"category":"photo","sku":"AERO-D8","resolution":"4K","fps":60,"stabilization":"gyro","waterproof":"10m"}'::jsonb, true),
('Дрон Aero SkyLite', 'dron-aero-skylite', 'Aero', 'Легкий дрон с 2.7K камерой.', '{"category":"photo","sku":"AERO-SKYLT","weight_g":245,"camera":"2.7K","gps":true,"flight_time_min":31}'::jsonb, true),
('Электросамокат Urban Ride S', 'elektrosamokat-urban-ride-s', 'Urban', 'Складной, до 25 км/ч.', '{"category":"mobility","sku":"URB-RIDES","range_km":30,"max_speed_kmh":25,"motor_w":350,"suspension":false}'::jsonb, true),
('Робот-пылесос Urban Vac Pro', 'robot-pylesos-urban-vac-pro', 'Urban', 'Лидар, влажная уборка.', '{"category":"home","sku":"URB-VACPRO","lidar":true,"mopping":true,"suction_pa":3000,"app_control":true}'::jsonb, true),
('Чайник Zen Kettle Glass', 'chainik-zen-kettle-glass', 'Zen', 'Стеклянный электрочайник 1.7 л.', '{"category":"kitchen","sku":"ZEN-KET-GLS","capacity_l":1.7,"power_w":2200,"auto_off":true,"illumination":true}'::jsonb, true),
('Блендер Zen MixGo', 'blender-zen-mixgo', 'Zen', 'Портативный блендер-шейкер.', '{"category":"kitchen","sku":"ZEN-MIXGO","capacity_ml":450,"blades":"steel","battery":"USB-C","dishwasher_safe":true}'::jsonb, true),
('Тостер Zen Crisp 2', 'toster-zen-crisp-2', 'Zen', 'Два слота, 7 степеней поджарки.', '{"category":"kitchen","sku":"ZEN-CRISP2","slots":2,"browning_levels":7,"crumb_tray":true}'::jsonb, true),
('Увлажнитель воздуха Pioneer Mist 5L', 'uvlazhnitel-pioneer-mist-5l', 'Pioneer', 'Тихий ультразвуковой увлажнитель.', '{"category":"climate","sku":"PNR-MIST-5L","tank_l":5,"night_mode":true,"aroma":true,"auto_off":true}'::jsonb, true),
('Очиститель воздуха Pioneer Pure HEPA', 'ochistitel-vozduha-pioneer-pure-hepa', 'Pioneer', 'HEPA H13, до 40 м².', '{"category":"climate","sku":"PNR-PURE-H13","hepa":"H13","coverage_m2":40,"ionizer":false,"noise_db":28}'::jsonb, true),
('Смарт-лампа Lumina E27 RGB', 'smart-lampa-lumina-e27-rgb', 'Lumina', 'Управление из приложения.', '{"category":"lighting","sku":"LUM-E27-RGB","base":"E27","power_w":9,"rgb":true,"voice_control":true}'::jsonb, true),
('Настольная лампа Lumina Flex', 'nastolnaya-lampa-lumina-flex', 'Lumina', 'Регулируемая яркость и цвет.', '{"category":"lighting","sku":"LUM-FLEX-DESK","dimmable":true,"cct_range_k":2700,"max_k":6500,"usb_port":true}'::jsonb, true),
('Кроссовки Velox Run Pro', 'krossovki-velox-run-pro', 'Velox', 'Легкие беговые кроссовки.
', '{"category":"apparel","sku":"VLX-RUNPRO-42","size_eu":42,"color":"черный","material":"mesh","gender":"unisex"}'::jsonb, true),
('Рюкзак Urban City 20L', 'ryukzak-urban-city-20l', 'Urban', 'Городской рюкзак с отделением для ноутбука.', '{"category":"bags","sku":"URB-CITY-20","capacity_l":20,"laptop_in":15,"water_resistant":true,"pockets":6}'::jsonb, true),
('Бутылка для воды Polar Steel 750', 'butylka-dlya-vody-polar-steel-750', 'Polar', 'Термобутылка из нержавеющей стали.', '{"category":"outdoor","sku":"PLR-STEEL-750","volume_ml":750,"insulated":true,"bpa_free":true,"color":"серебристый"}'::jsonb, true),
('Блокнот Kraft A5 в точку', 'bloknot-kraft-a5-v-tochku', 'Kraft', '90 г/м², 160 страниц.', '{"category":"stationery","sku":"KRF-A5-DOT","size":"A5","pages":160,"paper_gsm":90,"binding":"thread"}'::jsonb, true),
('Ручка Kraft Smooth 0.5', 'ruchka-kraft-smooth-0-5', 'Kraft', 'Гелевая ручка, мягкое письмо.', '{"category":"stationery","sku":"KRF-SMTH-05","tip_mm":0.5,"ink":"gel","color":"синий","refillable":true}'::jsonb, true),
('Кофе зерновой Aurelia Espresso 1 кг', 'kofe-zeronovoy-aurelia-espresso-1kg', 'Aurelia', 'Смесь арабики и робусты, тёмная обжарка.', '{"category":"grocery","sku":"AUR-ESP-1KG","roast":"dark","arabica_pct":70,"whole_bean":true,"origin":["Brazil","India"]}'::jsonb, true),
('Чай зеленый Zen Sencha 100 г', 'chai-zelenyy-zen-sencha-100g', 'Zen', 'Классическая сенча в листе.', '{"category":"grocery","sku":"ZEN-SEN-100","type":"green","origin":"Japan","loose_leaf":true,"net_g":100}'::jsonb, true),
('Шоколад темный Polar 85%', 'shokolad-temnyy-polar-85', 'Polar', 'Горький шоколад без добавленного сахара.', '{"category":"grocery","sku":"PLR-CHOC-85","cacao_pct":85,"sugar_free":true,"weight_g":90}'::jsonb, true),
('Шампунь Zen Balance 400 мл', 'shampun-zen-balance-400ml', 'Zen', 'Для ежедневного использования.', '{"category":"beauty","sku":"ZEN-BA-400","volume_ml":400,"sulfate_free":true,"ph_balanced":true}'::jsonb, true),
('Зубная паста Polar Fresh', 'zubnaya-pasta-polar-fresh', 'Polar', 'Длительная свежесть и уход за эмалью.', '{"category":"beauty","sku":"PLR-FRESH-75","fluoride":true,"whitening":false,"volume_ml":75}'::jsonb, true),
('Мыло Aura Natural 100 г', 'mylo-aura-natural-100g', 'Aurelia', 'Натуральное мыло ручной работы.', '{"category":"beauty","sku":"AUR-SOAP-NAT","weight_g":100,"fragrance":"лаванда","vegan":true}'::jsonb, true),
('Крем для лица Zen Hydra', 'krem-dlya-lica-zen-hydra', 'Zen', 'Интенсивное увлажнение на весь день.', '{"category":"beauty","sku":"ZEN-HYDRA-50","volume_ml":50,"hyaluronic":true,"spf":15}'::jsonb, true),
('Дрель Kraft DrillMax 18V', 'drel-kraft-drillmax-18v', 'Kraft', 'Аккумуляторная дрель-шуруповерт.', '{"category":"tools","sku":"KRF-DRL-18V","voltage_v":18,"battery_ah":2,"chuck_mm":13,"brushless":true}'::jsonb, true),
('Молоток Kraft Steel 16oz', 'molotok-kraft-steel-16oz', 'Kraft', 'Прочный молоток с антивибрацией.', '{"category":"tools","sku":"KRF-HAM-16","weight_oz":16,"handle":"fiberglass","magnetic_nail_holder":true}'::jsonb, true),
('Ролик для краски Urban Paint Roll', 'rolik-dlya-kraski-urban-paint-roll', 'Urban', 'Микрофибра, ширина 23 см.', '{"category":"tools","sku":"URB-ROLL-23","width_cm":23,"material":"microfiber","washable":true}'::jsonb, true),
('Лампа настольная Zen Study', 'lampa-nastolnaya-zen-study', 'Zen', 'Защита зрения и таймер фокуса.', '{"category":"lighting","sku":"ZEN-STUDY","cct_range_k":[3000,5000],"cri":90,"timer":true,"usb_c":true}'::jsonb, true),
('Светодиодная лампа Polar E14 6W', 'svetodiodnaya-lampa-polar-e14-6w', 'Polar', 'Теплый свет 2700K.', '{"category":"lighting","sku":"PLR-E14-6W","power_w":6,"luminous_flux_lm":600,"cct_k":2700,"dimmable":false}'::jsonb, true),
('Роутер Mesh Tekno M2', 'router-mesh-tekno-m2', 'Tekno', 'Меш-система для большой квартиры.', '{"category":"network","sku":"TEK-MESH-M2","units":2,"wifi":"Wi-Fi 6","coverage_m2":350,"ethernet_backhaul":true}'::jsonb, true),
('Коврик для мыши Kraft Control L', 'kovrik-dlya-myshi-kraft-control-l', 'Kraft', 'Контрольное покрытие, прошитые края.
', '{"category":"peripherals","sku":"KRF-PADM-L","size_mm":[450,400,4],"surface":"control","washable":true}'::jsonb, true),
('Внешний SSD Velox Pocket 512GB', 'vneshniy-ssd-velox-pocket-512gb', 'Velox', 'Компактный и быстрый портативный SSD.', '{"category":"storage","sku":"VLX-EXT-512","capacity_gb":512,"interface":"USB-C 10Gbps","drop_protection":"1.5m"}'::jsonb, true),
('Контроллер геймпада Orbita Play', 'kontroller-geympada-orbita-play', 'Orbita', 'Совместим с ПК и консолью.', '{"category":"gaming","sku":"ORB-PLAY-CNT","connection":["Bluetooth","USB-C"],"vibration":true,"mappings":"XInput"}'::jsonb, true),
('Электронная книга Lumina E-Read 6', 'elektronnaya-kniga-lumina-e-read-6', 'Lumina', 'E‑ink экран, подсветка.', '{"category":"readers","sku":"LUM-EREAD-6","display":"6 E-ink","storage_gb":16,"frontlight":true,"formats":["EPUB","PDF","MOBI"]}'::jsonb, true),
('Планшет Nova Tab S 11', 'planshet-nova-tab-s-11', 'Nova', 'IPS 120 Гц, тонкие рамки.', '{"category":"electronics","sku":"NOVA-TABS11","screen":"11 IPS 120Hz","ram_gb":8,"storage_gb":128,"pen_support":true}'::jsonb, true),
('Колонка портативная Velox Boom 30', 'kolonka-portativnaya-velox-boom-30', 'Velox', 'Громкий звук, защита IPX7.', '{"category":"audio","sku":"VLX-BOOM-30","power_w":30,"battery_hours":20,"waterproof":"IPX7","stereo_pair":true}'::jsonb, true),
('Кабель USB-C Aurelia 100W 2м', 'kabel-usb-c-aurelia-100w-2m', 'Aurelia', 'Прочный кабель с поддержкой PD.', '{"category":"cables","sku":"AUR-USBC-100W-2M","length_m":2,"power_w":100,"data_gbps":10,"braided":true}'::jsonb, true),
('Модем LTE Tekno Link', 'modem-lte-tekno-link', 'Tekno', 'Карманный LTE-модем с Wi‑Fi.', '{"category":"network","sku":"TEK-LTE-LINK","lte_cat":6,"wifi_clients":10,"battery_mah":3000}'::jsonb, true),
('Док-станция Orbita USB-C Hub 8-in-1', 'dok-stanciya-orbita-usb-c-hub-8-in-1', 'Orbita', 'Все нужные порты для ноутбука.', '{"category":"peripherals","sku":"ORB-HUB-8IN1","ports":["HDMI","USB-A*3","USB-C PD","RJ45","SD","microSD"],"hdmi_4k_60":true}'::jsonb, true),
('Мышь вертикальная Kraft Ergo', 'mysh-vertikalnaya-kraft-ergo', 'Kraft', 'Эргономичная вертикальная мышь.', '{"category":"peripherals","sku":"KRF-ERGO-VM","dpi_max":16000,"connection":"Bluetooth","rechargeable":true}'::jsonb, true),
('Саундбар Aurelia Beam 2.1', 'saundbar-aurelia-beam-2-1', 'Aurelia', 'Мощный звук с сабвуфером.', '{"category":"audio","sku":"AUR-BEAM-21","channels":"2.1","hdmi_arc":true,"bluetooth":true,"subwoofer":"wireless"}'::jsonb, true),
('Кофеварка Zen Brew One', 'kofevarka-zen-brew-one', 'Zen', 'Рожковая кофеварка для дома.', '{"category":"kitchen","sku":"ZEN-BREW-ONE","pump_bar":15,"milk_frother":true,"watertank_l":1.2}'::jsonb, false);


