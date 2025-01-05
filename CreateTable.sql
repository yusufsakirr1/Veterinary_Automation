--ilk tablomuz olan müşteriler tablomuz
CREATE TABLE Musteriler (
    Musteri_ID INT PRIMARY KEY IDENTITY(1,1),
    MusteriAdi VARCHAR(50) NOT NULL,
    MusteriSoyadi VARCHAR(50) NOT NULL,
    MusteriTelefon VARCHAR(15),
    MusteriAdres VARCHAR(MAX)
);

-- ikinci tablomuzda müşterilerin hayvanları olacak
CREATE TABLE Hayvanlar (
    Hayvan_ID INT PRIMARY KEY IDENTITY(1,1),
    HayvanTur VARCHAR(50) NOT NULL,
    HayvanYas INT,
    HayvanCinsiyet VARCHAR(10),
    Musteri_ID INT NOT NULL,
    FOREIGN KEY (Musteri_ID) REFERENCES Musteriler(Musteri_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Veterinerlerin tutulduğu tablo
CREATE TABLE Veterinerler (
    Veteriner_ID INT PRIMARY KEY IDENTITY(1,1),
    VeterinerAdi VARCHAR(50) NOT NULL,
    VeterinerSoyadi VARCHAR(50) NOT NULL,
    VeterinerTelefon VARCHAR(15)
);

-- yapılan tedavinin özellikleri
CREATE TABLE Tedaviler (
    Tedavi_ID INT PRIMARY KEY IDENTITY(1,1),
    TedaviBaslangicTarihi DATE NOT NULL,
    TedaviBitisTarihi DATE,
    Hayvan_ID INT NOT NULL,
    Veteriner_ID INT NOT NULL,
    FOREIGN KEY (Hayvan_ID) REFERENCES Hayvanlar(Hayvan_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Veteriner_ID) REFERENCES Veterinerler(Veteriner_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--kullanılan Ilaclar 
CREATE TABLE Ilaclar (
    Ilac_ID INT PRIMARY KEY IDENTITY(1,1),
    IlacAdi VARCHAR(50) NOT NULL,
    IlacFiyati DECIMAL(10, 2)
);

-- o tedavide kullanılan ilaçlar (Ara Tablo)
CREATE TABLE Tedavi_Ilac (
    Tedavi_ID INT NOT NULL,
    Ilac_ID INT NOT NULL,
    IlacDozu VARCHAR(50),
    PRIMARY KEY (Tedavi_ID, Ilac_ID),
    FOREIGN KEY (Tedavi_ID) REFERENCES Tedaviler(Tedavi_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Ilac_ID) REFERENCES Ilaclar(Ilac_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- hayvanın hastalığı için
CREATE TABLE Hastalik (
    Hastalik_ID INT PRIMARY KEY IDENTITY(1,1),
    HastalikAdi VARCHAR(50) NOT NULL
);

-- hastalık için tedavi (Ara Tablo)
CREATE TABLE Tedavi_Hastalik (
    Tedavi_ID INT NOT NULL,
    Hastalik_ID INT NOT NULL,
    PRIMARY KEY (Tedavi_ID, Hastalik_ID),
    FOREIGN KEY (Tedavi_ID) REFERENCES Tedaviler(Tedavi_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Hastalik_ID) REFERENCES Hastalik(Hastalik_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- hayvan öldü mü iyileşti mi 
CREATE TABLE TedaviSonucu (
    Sonuc_ID INT PRIMARY KEY IDENTITY(1,1),
    SonucDurumu VARCHAR(50),
    HayvanDurumu NVARCHAR(50) NOT NULL CHECK (HayvanDurumu IN ('Olmustur', 'Iyilesmiştir', 'Tedavi Ediliyor')),
    Tedavi_ID INT NOT NULL,
    FOREIGN KEY (Tedavi_ID) REFERENCES Tedaviler(Tedavi_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);