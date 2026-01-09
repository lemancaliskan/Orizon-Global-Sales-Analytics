--========================================================--
			--//* E-TİCARET SATIŞ ANALİZİ *//--
--========================================================--

--/******************************************************/--
--========================================--
			--//* TABLOLAR *//--
--========================================--

CREATE TABLE kategoriler (
    kategori_id SERIAL PRIMARY KEY,
    kategori_adi VARCHAR(100),
    ust_kategori_id INT REFERENCES kategoriler(kategori_id)
);

CREATE TABLE musteriler (
    musteri_id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    sehir VARCHAR(50),
    ulke VARCHAR(50) DEFAULT 'Türkiye',
    kayit_tarihi DATE
);

CREATE TABLE urunler (
    urun_id SERIAL PRIMARY KEY,
    urun_adi VARCHAR(100),
    kategori_id INT REFERENCES kategoriler(kategori_id),
    alis_fiyati DECIMAL(18,2),
    satis_fiyati DECIMAL(18,2),
    stok INT
);

CREATE TABLE siparisler (
    siparis_id SERIAL PRIMARY KEY,
    musteri_id INT REFERENCES musteriler(musteri_id),
    siparis_tarihi TIMESTAMP,
    kargo_firmasi VARCHAR(50),
    durum VARCHAR(20)
);

CREATE TABLE siparis_detay (
    detay_id SERIAL PRIMARY KEY,
    siparis_id INT REFERENCES siparisler(siparis_id),
    urun_id INT REFERENCES urunler(urun_id),
    miktar INT,
    birim_fiyat DECIMAL(18,2),
    indirim DECIMAL(18,2)
);

--========================================--
			--//* VERİLER *//--
--========================================--
-- KATEGORİLER
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Elektronik', NULL), ('Moda', NULL), ('Ev & Yaşam', NULL), 
('Spor & Outdoor', NULL), ('Kozmetik & Bakım', NULL), ('Hobi & Oyun', NULL);

-- Elektronik:
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Akıllı Telefonlar', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Dizüstü Bilgisayar', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Tabletler', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Giyilebilir Teknoloji', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Bluetooth Kulaklıklar', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Akıllı Ev Sistemleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Oyun Konsolları', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik')),
('Kamera & Fotoğraf', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Elektronik'));

-- KATEGORİLER (Moda)
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Erkek Giyim', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Kadın Giyim', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Spor Ayakkabı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Klasik Ayakkabı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Çanta', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Güneş Gözlüğü', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Saat', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda')),
('Takı & Mücevher', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Moda'));

-- Ev & Yaşam:
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Mutfak Gereçleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Yatak Odası Mobilya', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Çalışma Masası & Koltuk', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Ev Tekstili', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Aydınlatma', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Dekoratif Ürünler', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Bahçe Mobilyası', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam')),
('Banyo Aksesuarları', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev & Yaşam'));

-- Spor & Outdoor:
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Fitness Malzemeleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Kamp & Dağcılık', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Bisiklet', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Yüzme & Dalış', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Pilates & Yoga', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Outdoor Ayakkabı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Takım Sporları', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor')),
('Balıkçılık Malzemeleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor & Outdoor'));

-- Kozmetik & Bakım:
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Parfüm', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Cilt Bakımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Makyaj Ürünleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Saç Bakımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Ağız Bakım', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Tıraş Ürünleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('Güneş Kremleri', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım')),
('El & Ayak Bakımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kozmetik & Bakım'));

-- Hobi & Oyun:
INSERT INTO kategoriler (kategori_adi, ust_kategori_id) VALUES 
('Lego & Yapı Oyuncakları', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Hobi & Oyun')),
('Kutu Oyunları', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Hobi & Oyun')),
('Drone & Multikopter', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Hobi & Oyun')),
('Enstrümanlar', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Hobi & Oyun'));

-- MÜŞTERİLER
INSERT INTO musteriler (ad, soyad, sehir, ulke, kayit_tarihi) VALUES
('Ahmet', 'Yılmaz', 'İstanbul', 'Türkiye', '2020-03-15'),
('Mehmet', 'Kaya', 'İstanbul', 'Türkiye', '2021-06-22'),
('Ayşe', 'Demir', 'İstanbul', 'Türkiye', '2022-01-10'),
('Fatma', 'Çelik', 'İstanbul', 'Türkiye', '2020-11-05'),
('Emre', 'Şahin', 'İstanbul', 'Türkiye', '2021-04-18'),
('Can', 'Öztürk', 'İstanbul', 'Türkiye', '2022-09-12'),
('Zeynep', 'Aydın', 'İstanbul', 'Türkiye', '2020-08-25'),
('Mustafa', 'Arslan', 'İstanbul', 'Türkiye', '2021-02-28'),
('Merve', 'Doğan', 'İstanbul', 'Türkiye', '2022-05-14'),
('Eren', 'Yıldız', 'İstanbul', 'Türkiye', '2020-12-01'),
('Selin', 'Kılıç', 'İzmir', 'Türkiye', '2021-07-19'),
('Burak', 'Çetin', 'İzmir', 'Türkiye', '2022-03-03'),
('Aslı', 'Kara', 'İzmir', 'Türkiye', '2020-05-20'),
('Onur', 'Koç', 'İzmir', 'Türkiye', '2021-10-11'),
('Deniz', 'Kurt', 'İzmir', 'Türkiye', '2022-08-07'),
('Gökhan', 'Özkan', 'İzmir', 'Türkiye', '2020-02-14'),
('Gamze', 'Acar', 'İzmir', 'Türkiye', '2021-09-30'),
('Hakan', 'Özer', 'İzmir', 'Türkiye', '2022-11-21'),
('Pınar', 'Sarı', 'İzmir', 'Türkiye', '2020-04-10'),
('Levent', 'Uçar', 'İzmir', 'Türkiye', '2021-01-15'),
('Murat', 'Tekin', 'Aydın', 'Türkiye', '2022-06-25'),
('Sibel', 'Aksoy', 'Aydın', 'Türkiye', '2020-09-18'),
('Turgut', 'Güneş', 'Aydın', 'Türkiye', '2021-03-05'),
('Ece', 'Yavuz', 'Aydın', 'Türkiye', '2022-10-30'),
('Tolga', 'Erdem', 'Aydın', 'Türkiye', '2020-07-22'),
('Hande', 'Avcı', 'Aydın', 'Türkiye', '2021-12-14'),
('Gül', 'Aslan', 'Aydın', 'Türkiye', '2022-02-08'),
('Bülent', 'Polat', 'Aydın', 'Türkiye', '2020-11-19'),
('Yavuz', 'Korkmaz', 'Aydın', 'Türkiye', '2021-05-27'),
('Esra', 'Yüksel', 'Aydın', 'Türkiye', '2022-04-12'),
('Kadir', 'Can', 'Ankara', 'Türkiye', '2020-01-30'),
('Sinem', 'Bulut', 'Ankara', 'Türkiye', '2021-08-08'),
('Okan', 'Işık', 'Ankara', 'Türkiye', '2022-07-15'),
('Tuba', 'Eren', 'Bursa', 'Türkiye', '2020-06-14'),
('Serkan', 'Aktaş', 'Bursa', 'Türkiye', '2021-11-02'),
('Derya', 'Yalçın', 'Antalya', 'Türkiye', '2022-09-20'),
('Umut', 'Güler', 'Antalya', 'Türkiye', '2020-10-05'),
('Seda', 'Turan', 'Adana', 'Türkiye', '2021-02-12'),
('Yiğit', 'Sönmez', 'Gaziantep', 'Türkiye', '2022-03-28'),
('Bahar', 'Erdoğan', 'Trabzon', 'Türkiye', '2020-04-22'),
('Cihan', 'Keskin', 'Eskişehir', 'Türkiye', '2021-05-10'),
('Nilay', 'Tuna', 'Mersin', 'Türkiye', '2022-01-05'),
('Fatih', 'Taş', 'Kayseri', 'Türkiye', '2020-12-18'),
('Işıl', 'Gündüz', 'Kocaeli', 'Türkiye', '2021-09-07'),
('Tarik', 'Sert', 'Samsun', 'Türkiye', '2022-08-30'),
('Arzu', 'Bayram', 'Denizli', 'Türkiye', '2020-03-11'),
('Semih', 'Alkan', 'Sakarya', 'Türkiye', '2021-07-25'),
('Mina', 'Sezer', 'Muğla', 'Türkiye', '2022-11-14'),
('Oğuz', 'Bakır', 'Diyarbakır', 'Türkiye', '2020-02-28'),
('Tuğba', 'Sönmez', 'Tekirdağ', 'Türkiye', '2021-06-01'),
('Ivan', 'Ivanov', 'Sofya', 'Bulgaristan', '2020-02-15'),
('Maria', 'Petrova', 'Sofya', 'Bulgaristan', '2021-05-22'),
('Georgi', 'Georgiev', 'Sofya', 'Bulgaristan', '2022-01-10'),
('Elena', 'Dimitrova', 'Sofya', 'Bulgaristan', '2020-11-12'),
('Stefan', 'Stoyanov', 'Sofya', 'Bulgaristan', '2021-03-25'),
('Petya', 'Nikolova', 'Sofya', 'Bulgaristan', '2022-08-14'),
('Dimitar', 'Kolev', 'Sofya', 'Bulgaristan', '2020-06-30'),
('Gergana', 'Ilieva', 'Sofya', 'Bulgaristan', '2021-12-05'),
('Nikolay', 'Angelov', 'Sofya', 'Bulgaristan', '2022-04-18'),
('Silvia', 'Marinova', 'Sofya', 'Bulgaristan', '2020-09-01'),
('Hristo', 'Vasilev', 'Sofya', 'Bulgaristan', '2021-07-22'),
('Desislava', 'Mladenova', 'Sofya', 'Bulgaristan', '2022-02-28'),
('Yordan', 'Todorov', 'Filibe', 'Bulgaristan', '2020-04-12'),
('Radoslav', 'Popov', 'Filibe', 'Bulgaristan', '2021-10-15'),
('Boryana', 'Valkova', 'Filibe', 'Bulgaristan', '2022-06-05'),
('Kalin', 'Atanasov', 'Filibe', 'Bulgaristan', '2020-01-20'),
('Mila', 'Genova', 'Filibe', 'Bulgaristan', '2021-08-30'),
('Aleksandar', 'Penev', 'Varna', 'Bulgaristan', '2022-03-14'),
('Teodora', 'Kostova', 'Varna', 'Bulgaristan', '2020-12-25'),
('Viktor', 'Borisov', 'Varna', 'Bulgaristan', '2021-05-02'),
('Kameliya', 'Zheleva', 'Varna', 'Bulgaristan', '2022-07-19'),
('Plamen', 'Dinev', 'Burgaz', 'Bulgaristan', '2020-08-08'),
('Ralitsa', 'Staneva', 'Burgaz', 'Bulgaristan', '2021-02-14'),
('Lyubomir', 'Hadzhiev', 'Burgaz', 'Bulgaristan', '2022-09-30'),
('Svetlana', 'Yaneva', 'Burgaz', 'Bulgaristan', '2020-03-05'),
('Boyan', 'Pavlov', 'Rusçuk', 'Bulgaristan', '2021-11-11'),
('Aneliya', 'Bogdanova', 'Eski Zağra', 'Bulgaristan', '2022-05-20'),
('Todor', 'Manolov', 'Plevne', 'Bulgaristan', '2020-10-15'),
('Zornitsa', 'Gospodinova', 'Sliven', 'Bulgaristan', '2021-01-28'),
('Vasil', 'Krustev', 'Dobriç', 'Bulgaristan', '2022-12-01'),
('Min-jun', 'Kim', 'Seul', 'Güney Kore', '2020-01-15'),
('Seo-yeon', 'Lee', 'Seul', 'Güney Kore', '2021-04-20'),
('Ji-hoon', 'Park', 'Seul', 'Güney Kore', '2022-02-10'),
('Ha-eun', 'Choi', 'Seul', 'Güney Kore', '2020-11-05'),
('Do-yun', 'Jung', 'Seul', 'Güney Kore', '2021-07-12'),
('Ji-yoon', 'Kang', 'Seul', 'Güney Kore', '2022-09-30'),
('Hyun-woo', 'Cho', 'Seul', 'Güney Kore', '2020-03-22'),
('Seo-jun', 'Yoon', 'Seul', 'Güney Kore', '2021-01-18'),
('Ji-min', 'Jang', 'Seul', 'Güney Kore', '2022-05-14'),
('Min-seo', 'Lim', 'Seul', 'Güney Kore', '2020-08-25'),
('Joo-won', 'Han', 'Seul', 'Güney Kore', '2021-12-01'),
('Da-in', 'Oh', 'Seul', 'Güney Kore', '2022-10-15'),
('Seung-woo', 'Seo', 'Busan', 'Güney Kore', '2020-05-10'),
('Ye-jun', 'Shin', 'Busan', 'Güney Kore', '2021-09-19'),
('So-yul', 'Kwon', 'Busan', 'Güney Kore', '2022-03-08'),
('Woo-jin', 'Hwang', 'Busan', 'Güney Kore', '2020-12-28'),
('Chae-won', 'Ahn', 'Busan', 'Güney Kore', '2021-06-14'),
('Ha-yoon', 'Song', 'Incheon', 'Güney Kore', '2022-04-02'),
('Tae-yang', 'Jeon', 'Incheon', 'Güney Kore', '2020-02-17'),
('Ji-a', 'Hong', 'Incheon', 'Güney Kore', '2021-10-30'),
('Gun-woo', 'Yoo', 'Incheon', 'Güney Kore', '2022-07-11'),
('Eun-ji', 'Yang', 'Daegu', 'Güney Kore', '2020-09-05'),
('Sang-wook', 'Go', 'Daegu', 'Güney Kore', '2021-03-12'),
('Mi-so', 'Moon', 'Daegu', 'Güney Kore', '2022-11-20'),
('Dong-hyun', 'Paik', 'Daejeon', 'Güney Kore', '2020-06-18'),
('Su-bin', 'Heo', 'Daejeon', 'Güney Kore', '2021-08-25'),
('Jae-min', 'Ko', 'Gwangju', 'Güney Kore', '2022-01-22'),
('Bo-ra', 'Nam', 'Ulsan', 'Güney Kore', '2020-04-09'),
('Kyung-soo', 'Sim', 'Suwon', 'Güney Kore', '2021-11-11'),
('Hye-jin', 'Noh', 'Jeju', 'Güney Kore', '2022-08-05'),
('Dmitry', 'Sokolov', 'Moskova', 'Rusya', '2020-02-10'),
('Elena', 'Ivanova', 'Moskova', 'Rusya', '2021-05-14'),
('Sergei', 'Smirnov', 'Moskova', 'Rusya', '2022-01-20'),
('Natalia', 'Kuznetsova', 'Moskova', 'Rusya', '2020-11-30'),
('Alexey', 'Popov', 'Moskova', 'Rusya', '2021-04-12'),
('Svetlana', 'Vasilyeva', 'Moskova', 'Rusya', '2022-08-05'),
('Andrey', 'Petrov', 'Moskova', 'Rusya', '2020-06-18'),
('Olga', 'Mikhailova', 'Moskova', 'Rusya', '2021-12-25'),
('Artyom', 'Fedorov', 'St. Petersburg', 'Rusya', '2022-03-10'),
('Anna', 'Morozova', 'St. Petersburg', 'Rusya', '2020-09-15'),
('Maxim', 'Volkov', 'St. Petersburg', 'Rusya', '2021-07-02'),
('Yulia', 'Lebedeva', 'St. Petersburg', 'Rusya', '2022-11-14'),
('Ivan', 'Semenov', 'Novosibirsk', 'Rusya', '2020-04-22'),
('Tatiana', 'Egorova', 'Novosibirsk', 'Rusya', '2021-10-05'),
('Nikolai', 'Kozlov', 'Ekaterinburg', 'Rusya', '2022-02-18'),
('Irina', 'Stepanova', 'Ekaterinburg', 'Rusya', '2020-01-30'),
('Victor', 'Nikolaev', 'Kazan', 'Rusya', '2021-08-08'),
('Maria', 'Orlova', 'Kazan', 'Rusya', '2022-06-12'),
('Pavel', 'Andreev', 'Soçi', 'Rusya', '2020-12-01'),
('Ekaterina', 'Makarova', 'Vladivostok', 'Rusya', '2021-03-20'),
('Haruto', 'Sato', 'Tokyo', 'Japonya', '2020-01-12'),
('Yua', 'Suzuki', 'Tokyo', 'Japonya', '2021-05-20'),
('Riku', 'Takahashi', 'Tokyo', 'Japonya', '2022-03-15'),
('Mei', 'Tanaka', 'Tokyo', 'Japonya', '2020-11-08'),
('Kaito', 'Watanabe', 'Tokyo', 'Japonya', '2021-07-22'),
('Aoi', 'Ito', 'Tokyo', 'Japonya', '2022-10-01'),
('Souta', 'Yamamoto', 'Tokyo', 'Japonya', '2020-04-30'),
('Hina', 'Nakamura', 'Tokyo', 'Japonya', '2021-02-14'),
('Yuuma', 'Kobayashi', 'Tokyo', 'Japonya', '2022-06-18'),
('Sakura', 'Kato', 'Tokyo', 'Japonya', '2020-09-25'),
('Itsuki', 'Yoshida', 'Tokyo', 'Japonya', '2021-12-10'),
('Akari', 'Yamada', 'Tokyo', 'Japonya', '2022-08-05'),
('Hiroto', 'Sasaki', 'Osaka', 'Japonya', '2020-02-28'),
('Yui', 'Yamaguchi', 'Osaka', 'Japonya', '2021-06-14'),
('Ren', 'Matsumoto', 'Osaka', 'Japonya', '2022-01-19'),
('Mio', 'Inoue', 'Osaka', 'Japonya', '2020-12-22'),
('Minato', 'Kimura', 'Osaka', 'Japonya', '2021-03-05'),
('Koharu', 'Hayashi', 'Yokohama', 'Japonya', '2022-07-30'),
('Asahi', 'Shimizu', 'Yokohama', 'Japonya', '2020-08-11'),
('Sara', 'Yamazaki', 'Yokohama', 'Japonya', '2021-10-25'),
('Hinata', 'Mori', 'Nagoya', 'Japonya', '2022-04-12'),
('Misaki', 'Abe', 'Nagoya', 'Japonya', '2020-05-18'),
('Arata', 'Ikeda', 'Sapporo', 'Japonya', '2021-09-02'),
('Nanami', 'Hashimoto', 'Sapporo', 'Japonya', '2022-11-20'),
('Eita', 'Yamane', 'Fukuoka', 'Japonya', '2020-03-07'),
('Riko', 'Ishikawa', 'Fukuoka', 'Japonya', '2021-11-15'),
('Touma', 'Maeda', 'Kyoto', 'Japonya', '2022-02-24'),
('Yuzuki', 'Fujita', 'Kyoto', 'Japonya', '2020-06-10'),
('Sora', 'Okada', 'Kobe', 'Japonya', '2021-01-28'),
('Kanon', 'Goto', 'Hiroşima', 'Japonya', '2022-05-12'),
('Lukas', 'Müller', 'Berlin', 'Almanya', '2020-03-12'),
('Leon', 'Schmidt', 'Berlin', 'Almanya', '2021-07-25'),
('Finn', 'Schneider', 'Berlin', 'Almanya', '2022-01-10'),
('Hanna', 'Fischer', 'Berlin', 'Almanya', '2020-11-05'),
('Mia', 'Weber', 'Münih', 'Almanya', '2021-04-18'),
('Jonas', 'Meyer', 'Münih', 'Almanya', '2022-09-12'),
('Emma', 'Wagner', 'Hamburg', 'Almanya', '2020-08-22'),
('Paul', 'Becker', 'Hamburg', 'Almanya', '2021-12-01'),
('Marie', 'Schulz', 'Frankfurt', 'Almanya', '2022-05-14'),
('Tim', 'Hoffmann', 'Stuttgart', 'Almanya', '2020-02-28'),
('Lucas', 'Bernard', 'Paris', 'Fransa', '2020-05-15'),
('Louis', 'Dubois', 'Paris', 'Fransa', '2021-08-20'),
('Gabriel', 'Thomas', 'Paris', 'Fransa', '2022-02-10'),
('Jade', 'Robert', 'Paris', 'Fransa', '2020-12-05'),
('Emma', 'Richard', 'Lyon', 'Fransa', '2021-03-22'),
('Hugo', 'Petit', 'Lyon', 'Fransa', '2022-07-14'),
('Louise', 'Durand', 'Marsilya', 'Fransa', '2020-09-01'),
('Arthur', 'Leroy', 'Marsilya', 'Fransa', '2021-11-11'),
('Alice', 'Moreau', 'Bordeaux', 'Fransa', '2022-04-18'),
('Léo', 'Simon', 'Nice', 'Fransa', '2020-01-25'),
('Nikos', 'Papadopoulos', 'Atina', 'Yunanistan', '2020-02-10'),
('Eleni', 'Giannopoulos', 'Atina', 'Yunanistan', '2021-06-15'),
('Dimitris', 'Vasilopoulos', 'Atina', 'Yunanistan', '2022-03-05'),
('Maria', 'Dimitriou', 'Atina', 'Yunanistan', '2020-10-22'),
('Giorgos', 'Nikolaou', 'Selanik', 'Yunanistan', '2021-05-30'),
('Kostas', 'Antoniou', 'Selanik', 'Yunanistan', '2022-08-14'),
('Sofia', 'Angelopoulou', 'Patras', 'Yunanistan', '2020-07-11'),
('Andreas', 'Pappa', 'Yanya', 'Yunanistan', '2021-12-25'),
('Katerina', 'Lekka', 'Larissa', 'Yunanistan', '2022-01-20'),
('Yiannis', 'Sideris', 'Kandiye', 'Yunanistan', '2020-04-04');

-- ÜRÜNLER

-- Akıllı Telefonlar
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('XPhone 15 Pro 256GB', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 35000.00, 48000.00, 45),
('XPhone 15 128GB', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 28000.00, 39500.00, 60),
('Galaxy Z Fold 5', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 42000.00, 56000.00, 20),
('Galaxy S24 Ultra', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 38000.00, 52000.00, 35),
('Redmi Note 13 Pro', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 12000.00, 18500.00, 100),
('Pixel 8 Pro', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 25000.00, 34000.00, 15),
('Nothing Phone 2', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Telefonlar'), 18000.00, 26000.00, 30);

-- Dizüstü Bilgisayar
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('MacBook Air M3 13"', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 32000.00, 44000.00, 25),
('MacBook Pro M3 Max 16"', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 85000.00, 115000.00, 10),
('Dell XPS 13 Plus', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 45000.00, 62000.00, 12),
('ASUS ROG Zephyrus G14', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 52000.00, 74000.00, 18),
('Lenovo ThinkPad X1 Carbon', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 48000.00, 68000.00, 15),
('HP Victus Gaming 16', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 22000.00, 31000.00, 40),
('Acer Swift Go 14', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 15000.00, 22500.00, 50),
('Huawei Matebook D16', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dizüstü Bilgisayar'), 19000.00, 27000.00, 35);

-- Tabletler
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('iPad Pro 12.9" M2', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Tabletler'), 28000.00, 39000.00, 30),
('iPad Air 5. Nesil', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Tabletler'), 16000.00, 23000.00, 55),
('Galaxy Tab S9 Ultra', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Tabletler'), 22000.00, 31500.00, 20),
('Xiaomi Pad 6', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Tabletler'), 9000.00, 14000.00, 80),
('Surface Pro 9', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Tabletler'), 30000.00, 45000.00, 10);

-- Giyilebilir Teknoloji
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Apple Watch Series 9', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 11000.00, 16500.00, 50),
('Apple Watch Ultra 2', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 28000.00, 41000.00, 15),
('Galaxy Watch 6 Classic', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 7000.00, 11000.00, 40),
('Huawei Watch GT 4', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 5500.00, 8500.00, 60),
('Garmin Fenix 7X Pro', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 24000.00, 35000.00, 12),
('Fitbit Charge 6', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Giyilebilir Teknoloji'), 4000.00, 6200.00, 45);

-- Bluetooth Kulaklıklar
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('AirPods Pro 2. Nesil', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 5500.00, 8500.00, 150),
('AirPods Max', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 14000.00, 21000.00, 25),
('Sony WH-1000XM5', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 9000.00, 13500.00, 40),
('Bose QuietComfort Ultra', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 10500.00, 15800.00, 20),
('Sennheiser Momentum 4', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 8500.00, 12900.00, 30),
('Galaxy Buds 2 Pro', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 3200.00, 5100.00, 120),
('JBL Tune 520BT', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bluetooth Kulaklıklar'), 1100.00, 1950.00, 200);

-- Oyun Konsolları
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('PlayStation 5 Digital Edition', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Oyun Konsolları'), 15000.00, 22000.00, 40),
('Xbox Series X', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Oyun Konsolları'), 16000.00, 24500.00, 25),
('Nintendo Switch OLED', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Oyun Konsolları'), 9500.00, 14800.00, 50),
('Steam Deck 512GB OLED', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Oyun Konsolları'), 18000.00, 27500.00, 15),
('ASUS ROG Ally Z1 Extreme', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Oyun Konsolları'), 19500.00, 29000.00, 20);

-- Kamera & Fotoğraf
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Sony A7 IV Body', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamera & Fotoğraf'), 55000.00, 78000.00, 8),
('Canon EOS R6 Mark II', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamera & Fotoğraf'), 52000.00, 75000.00, 10),
('DJI Mini 4 Pro Fly More', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamera & Fotoğraf'), 28000.00, 42000.00, 15),
('GoPro Hero 12 Black', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamera & Fotoğraf'), 11000.00, 17500.00, 45),
('Insta360 X3', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamera & Fotoğraf'), 12500.00, 19000.00, 25);

-- Akıllı Ev Sistemleri
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Xiaomi Mi Robot Vacuum S10+', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Ev Sistemleri'), 9000.00, 14500.00, 50),
('Roborock S8 Sonic', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Ev Sistemleri'), 18000.00, 28000.00, 30),
('Philips Hue Başlangıç Seti', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Ev Sistemleri'), 3500.00, 5800.00, 70),
('Cosori Akıllı Air Fryer 5.5L', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Ev Sistemleri'), 3200.00, 5400.00, 100),
('Nest Learning Thermostat', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Akıllı Ev Sistemleri'), 6000.00, 9500.00, 20);

-- Moda
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Pamuklu Slim Fit Gömlek', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Erkek Giyim'), 350.00, 850.00, 200),
('Klasik Kesim Jean', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Erkek Giyim'), 450.00, 1200.00, 150),
('Viskon Yazlık Elbise', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kadın Giyim'), 400.00, 1450.00, 80),
('Kaşmir Palto', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kadın Giyim'), 2500.00, 5800.00, 30),
('Air Cushion Koşu Ayakkabısı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Spor Ayakkabı'), 1200.00, 3200.00, 100),
('Deri Günlük Ayakkabı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Klasik Ayakkabı'), 900.00, 2400.00, 60),
('Su Geçirmez Sırt Çantası', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Çanta & Valiz'), 600.00, 1550.00, 120),
('Otomatik Mekanik Saat', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Saat'), 3500.00, 8500.00, 25),
('Polarize Güneş Gözlüğü', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Güneş Gözlüğü'), 450.00, 1800.00, 90),
('Gümüş Zincir Kolye', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Takı & Mücevher'), 300.00, 950.00, 200);

--Ev&Yaşam
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Döküm Tencere Seti', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Mutfak Gereçleri'), 1800.00, 4200.00, 40),
('6 Kişilik Yemek Takımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Mutfak Gereçleri'), 1200.00, 3100.00, 55),
('Ortopedik Yatak (160x200)', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Yatak Odası Mobilya'), 4500.00, 9800.00, 20),
('Çalışma Masası (Meşe)', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Çalışma Masası & Koltuk'), 1100.00, 2950.00, 45),
('Pamuklu Nevresim Takımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ev Tekstili'), 450.00, 1250.00, 100),
('Modern Lambader', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Aydınlatma'), 350.00, 1100.00, 75),
('Dekoratif Duvar Saati', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Dekoratif Ürünler'), 150.00, 550.00, 150),
('Ahşap Bahçe Oturma Grubu', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bahçe Mobilyası'), 6500.00, 14500.00, 10),
('Banyo Paspas Seti', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Banyo Aksesuarları'), 200.00, 650.00, 130);

--Spor ve Outdoor
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Ayarlanabilir Dambıl Seti', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Fitness Malzemeleri'), 850.00, 2100.00, 60),
('4 Kişilik Otomatik Çadır', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kamp & Dağcılık'), 1400.00, 3800.00, 35),
('21 Vites Dağ Bisikleti', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Bisiklet'), 3500.00, 8200.00, 20),
('Kaymaz Yoga Matı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Pilates & Yoga'), 150.00, 650.00, 200),
('Gore-Tex Doğa Yürüyüş Botu', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Outdoor Ayakkabı'), 1800.00, 4600.00, 40),
('Teleskopik Olta Takımı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Balıkçılık Malzemeleri'), 500.00, 1350.00, 85);

--Kozmetik
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('EDP Erkek Parfümü 100ml', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Parfüm'), 950.00, 2800.00, 50),
('Nemlendirici Yüz Kremi', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 220.00, 750.00, 180),
('Mat Ruj Serisi', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 110.00, 450.00, 300),
('Keratin Saç Maskesi', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Saç Bakımı'), 180.00, 580.00, 140),
('Şarjlı Diş Fırçası', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Ağız Bakım'), 650.00, 1750.00, 90),
('Floral Bayan Parfüm 50ml', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Parfüm'), 1200.00, 3200.00, 45),
('Odunsu Erkek Parfüm 100ml', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Parfüm'), 1500.00, 3800.00, 30),
('Unisex Niş Parfüm', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Parfüm'), 2800.00, 6500.00, 15),
('Vücut Spreyi Tropikal', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Parfüm'), 150.00, 450.00, 200),
('C Vitamini Aydınlatıcı Serum', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 250.00, 850.00, 120),
('Hyaluronik Asit Dolgunlaştırıcı', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 300.00, 950.00, 100),
('Göz Altı Torba Karşıtı Krem', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 180.00, 620.00, 85),
('Yaşlanma Karşıtı Gece Kremi', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 450.00, 1400.00, 40),
('Yüz Temizleme Jeli 200ml', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Cilt Bakımı'), 120.00, 380.00, 250),
('Hacim Veren Siyah Maskara', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 140.00, 550.00, 300),
('Likit Eyeliner Su Geçirmez', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 90.00, 320.00, 200),
('Nude Far Paleti 12li', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 350.00, 1100.00, 60),
('Kapatıcı (Concealer) Light', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 180.00, 580.00, 150),
('Aydınlatıcı Pudra (Highlighter)', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Makyaj Ürünleri'), 220.00, 720.00, 90);

--Hobi
INSERT INTO urunler (urun_adi, kategori_id, alis_fiyati, satis_fiyati, stok) VALUES
('Lego Technic Yarış Arabası', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Lego & Yapı Oyuncakları'), 1200.00, 3100.00, 40),
('Strateji Kutu Oyunu', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Kutu Oyunları'), 350.00, 950.00, 110),
('4K Kameralı Drone', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Drone & Multikopter'), 4500.00, 9800.00, 15),
('Akustik Gitar', (SELECT kategori_id FROM kategoriler WHERE kategori_adi='Enstrümanlar'), 1400.00, 3600.00, 30);

--==========================================================--
				--//*  SİPARİŞ ÜRETİMİ *//--
--==========================================================--

DO $$
DECLARE 
    i INT;
    v_siparis_id INT;
    v_musteri_id INT;
    v_urun_id INT;
    v_tarih TIMESTAMP;
    v_adet INT;
    v_populer_urunler INT[];
BEGIN

    SELECT ARRAY_AGG(urun_id) INTO v_populer_urunler 
    FROM urunler 
    WHERE urun_adi LIKE '%MacBook%' 
	   OR urun_adi LIKE '%Galaxy Z Fold 5%'
       OR urun_adi LIKE '%XPhone%' 
       OR urun_adi LIKE '%AirPods%'
	   OR urun_adi LIKE '%Kaşmir Palto%'
	   OR urun_adi LIKE '%PlayStation 5 Digital Edition%'       
	   OR urun_adi LIKE '%Unisex Niş Parfüm%'
	   OR urun_adi LIKE '%Mat Ruj Serisi%'
       OR urun_adi LIKE '%Gümüş Zincir Kolye%' 
       OR urun_adi LIKE '%GoPro Hero 12 Black%'
	   OR urun_adi LIKE '%Çalışma Masası (Meşe)%'
	   OR urun_adi LIKE '%Kaymaz Yoga Matı%'
	   OR urun_adi LIKE '%Xiaomi Mi Robot Vacuum S10+%'       
       OR urun_adi LIKE '%Aydınlatıcı Pudra (Highlighter)%'
       OR urun_adi LIKE '%Sony WH-1000XM5%'
	   OR urun_adi LIKE '%iPad Air 5. Nesil%';
	   

    FOR i IN 1..500 LOOP

        SELECT musteri_id INTO v_musteri_id FROM musteriler ORDER BY random() LIMIT 1;

        v_tarih := TIMESTAMP '2023-01-01 00:00:00' + random() * (TIMESTAMP '2025-12-31 23:59:59' - TIMESTAMP '2023-01-01 00:00:00');

        INSERT INTO siparisler (musteri_id, siparis_tarihi, kargo_firmasi, durum)
        VALUES (
            v_musteri_id, 
            v_tarih, 
            (ARRAY['Aras Kargo', 'Yurtiçi Kargo', 'MNG Kargo', 'DHL', 'UPS'])[floor(random()*5)+1],
            (ARRAY['Tamamlandı', 'Tamamlandı', 'Tamamlandı', 'Tamamlandı', 'İade Edildi'])[floor(random()*5)+1]
        ) RETURNING siparis_id INTO v_siparis_id;


        FOR v_adet IN 1..(floor(random()*3)+1) LOOP
            
           
            IF random() < 0.45 THEN

                v_urun_id := v_populer_urunler[floor(random() * array_length(v_populer_urunler, 1)) + 1];
            ELSE
			
                SELECT urun_id INTO v_urun_id FROM urunler ORDER BY random() LIMIT 1;
            END IF;
            
            INSERT INTO siparis_detay (siparis_id, urun_id, miktar, birim_fiyat, indirim)
            SELECT 
                v_siparis_id, 
                v_urun_id, 
                (CASE WHEN random() > 0.9 THEN 2 ELSE 1 END), 
                satis_fiyati,
                (CASE WHEN random() > 0.85 THEN satis_fiyati * 0.10 ELSE 0 END) 
            FROM urunler WHERE urun_id = v_urun_id
            ON CONFLICT DO NOTHING; 
        END LOOP;
    END LOOP;
END $$;