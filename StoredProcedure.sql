
-- 1. Musteri Ekle 
CREATE PROCEDURE MusteriEkle
    @MusteriAdi VARCHAR(50),
    @MusteriSoyadi VARCHAR(50),
    @MusteriTelefon VARCHAR(15),
    @MusteriAdres VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Musteriler (MusteriAdi, MusteriSoyadi, MusteriTelefon, MusteriAdres)
    VALUES (@MusteriAdi, @MusteriSoyadi, @MusteriTelefon, @MusteriAdres);
END;
GO

-- 2. Hayvan Ekle
CREATE PROCEDURE HayvanEkle
    @HayvanTuru VARCHAR(50),
    @HayvanYasi INT,
    @HayvanCinsiyeti VARCHAR(10),
    @Musteri_ID INT
AS
BEGIN
    INSERT INTO Hayvanlar (HayvanTur, HayvanYas, HayvanCinsiyet, Musteri_ID)
    VALUES (@HayvanTuru, @HayvanYasi, @HayvanCinsiyeti, @Musteri_ID);
END;
GO

-- 3. Veteriner Ekle
CREATE PROCEDURE VeterinerEkle
    @VeterinerAdi VARCHAR(50),
    @VeterinerSoyadi VARCHAR(50),
    @VeterinerTelefon VARCHAR(15)
AS
BEGIN
    INSERT INTO Veterinerler (VeterinerAdi, VeterinerSoyadi, VeterinerTelefon)
    VALUES (@VeterinerAdi, @VeterinerSoyadi, @VeterinerTelefon);
END;
GO

-- 4. Tedavi Ekle
CREATE PROCEDURE TedaviEkle
    @BaslangicTarihi DATE,
    @BitisTarihi DATE,
    @Hayvan_ID INT,
    @Veteriner_ID INT
AS
BEGIN
    INSERT INTO Tedaviler (TedaviBaslangicTarihi, TedaviBitisTarihi, Hayvan_ID, Veteriner_ID)
    VALUES (@BaslangicTarihi, @BitisTarihi, @Hayvan_ID, @Veteriner_ID);
END;
GO

-- 5. Musteriye Gore Hayvanlari Listele
CREATE PROCEDURE MusteriyeGoreHayvanlariListele
    @Musteri_ID INT
AS
BEGIN
    SELECT Hayvan_ID, HayvanTur, HayvanYas, HayvanCinsiyet
    FROM Hayvanlar
    WHERE Musteri_ID = @Musteri_ID;
END;
GO

-- 6. Tedavi Detaylarini Listele
CREATE PROCEDURE TedaviDetaylariniListele
    @Tedavi_ID INT
AS
BEGIN
    SELECT t.TedaviBaslangicTarihi, t.TedaviBitisTarihi, h.HayvanTur, h.HayvanCinsiyet, v.VeterinerAdi, v.VeterinerSoyadi
    FROM Tedaviler t
    JOIN Hayvanlar h ON t.Hayvan_ID = h.Hayvan_ID
    JOIN Veterinerler v ON t.Veteriner_ID = v.Veteriner_ID
    WHERE t.Tedavi_ID = @Tedavi_ID;
END;
GO

-- 7. Tedaviye Ilac Ekle
CREATE PROCEDURE TedaviyeIlacEkle
    @Tedavi_ID INT,
    @Ilac_ID INT,
    @IlacDozu VARCHAR(50)
AS
BEGIN
    INSERT INTO Tedavi_Ilac (Tedavi_ID, Ilac_ID, IlacDozu)
    VALUES (@Tedavi_ID, @Ilac_ID, @IlacDozu);
END;
GO

-- 8. Tedaviye Hastalik Ekle
CREATE PROCEDURE TedaviyeHastalikEkle
    @Tedavi_ID INT,
    @Hastalik_ID INT
AS
BEGIN
    INSERT INTO Tedavi_Hastalik (Tedavi_ID, Hastalik_ID)
    VALUES (@Tedavi_ID, @Hastalik_ID);
END;
GO

-- 9. Tedavi Sonucu Guncelle
CREATE PROCEDURE TedaviSonucuGuncelle
    @Tedavi_ID INT,
    @SonucDurumu VARCHAR(50),
    @HayvanDurumu NVARCHAR(50)
AS
BEGIN
    UPDATE TedaviSonucu
    SET SonucDurumu = @SonucDurumu, HayvanDurumu = @HayvanDurumu
    WHERE Tedavi_ID = @Tedavi_ID;
END;
GO