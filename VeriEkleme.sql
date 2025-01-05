-- kullanici konumundaki müşteriler
INSERT INTO Musteriler (MusteriAdi, MusteriSoyadi, MusteriTelefon, MusteriAdres)
VALUES 
('Ahmet', 'Dağistanli', '0551641235', 'Ankara'),
('Emre', 'Altundağ', '05522167548', 'Istanbul'),
('Yusuf', 'Şakir', '05341737542', 'Mardin');

-- müsterilerin hayvanları
INSERT INTO Hayvanlar (HayvanTur, HayvanYas, HayvanCinsiyet, Musteri_ID)
VALUES 
('Eşşek', 10, 'Disi', 1),  
('zurafa', 2, 'Erkek', 2),
('kaplumbağa', 1, 'Disi', 3); 

-- tedavi ediciler
INSERT INTO Veterinerler (VeterinerAdi, VeterinerSoyadi, VeterinerTelefon)
VALUES 
('Ayşe', 'Celik', '05902312334'),
('Zülfikar', 'Er', '06107239284'),
('Fatih', 'Dağkiran', '03322342354');

-- lazım olan tarihler
INSERT INTO Tedaviler (TedaviBaslangicTarihi, TedaviBitisTarihi, Hayvan_ID, Veteriner_ID)
VALUES 
('2025-01-01', '2024-01-05', 1, 1), 
('2025-04-10', '2024-01-15', 2, 2), 
('2025-02-20', '2024-01-22', 3, 3); 

INSERT INTO Ilaclar (IlacAdi, IlacFiyati)
VALUES 
('gripin', 50.00),
('ateş düşürücü', 30.00),
('kas gevşetici', 20.00);

-- ara tablomuz
INSERT INTO Tedavi_Ilac (Tedavi_ID, Ilac_ID, IlacDozu)
VALUES 
(6, 1, '1x1'), -- 1. günde 1 tane 
(7, 3, '2x1'),
(3, 3 , '3x3'), -- 2. günde 1 tane
(10, 2, '1x2'); -- 1. 2 tane

-- tedavi_id = 1 ve ilac_id = 3 olan veriyi eklemek için
INSERT INTO Tedavi_Ilac (Tedavi_ID, Ilac_ID , IlacDozu)
VALUES (3, 3 , '3x3');
SELECT * FROM Tedavi_Ilac; 

-- rahatsızlığı
INSERT INTO Hastalik (HastalikAdi)
VALUES 
('kolera'),
('kirilma'),
('tansiyon');


INSERT INTO Tedavi_Hastalik (Tedavi_ID, Hastalik_ID)
VALUES 
(1, 1), -- 1. kolera  icindi
(2, 2), -- 2. tedavi kirilma icindi
(3, 3); -- 3. tedavi tansiyon icindi

-- hayvana ne olduğu burada
INSERT INTO TedaviSonucu (SonucDurumu, HayvanDurumu, Tedavi_ID)
VALUES 
('olumlu', 'Iyilesmistir', 1), -- Ilk tedavi basarili oldu
('Devam Ediyor', 'Tedavi Ediliyor', 2), -- Ikinci tedavi devam ediyor
('olumsuz', 'Olmustur', 3); -- Ucuncu tedavi basarisiz oldu

