USE Veterinerlik;
GO

-- Transaction Yapisi ile COMMIT ve ROLLBACK Ornegi
BEGIN TRANSACTION;

BEGIN TRY
    -- 1. Yeni musteri ekleme
    INSERT INTO Musteriler (MusteriAdi, MusteriSoyadi, MusteriTelefon, MusteriAdres)
    VALUES ('Test', 'Musteri', '05551234567', 'Test Adresi');

    PRINT 'Müşteri başariyla eklendi.';

    -- 2. Eklenen musterinin ID'sini al
    DECLARE @Musteri_ID INT;
    SET @Musteri_ID = SCOPE_IDENTITY();

    -- 3. Yeni hayvan ekleme
    INSERT INTO Hayvanlar (HayvanTur, HayvanYas, HayvanCinsiyet, Musteri_ID)
    VALUES ('Tavsan', 3, 'Erkek', @Musteri_ID);

    PRINT 'Hayvan başariyla eklendi.';

    -- Islemi basarili bir sekilde tamamlama
    COMMIT TRANSACTION;
    PRINT 'İşlem başariyla gerçekleştirildi.';

END TRY
BEGIN CATCH
    -- Hata durumunda islemi geri al
    PRINT 'Bir hata oluştu. İşlemi geri ';
    ROLLBACK TRANSACTION;

    -- Hatanin detaylarini yazdir
    PRINT ERROR_MESSAGE();
END CATCH;
GO