# Veterinerlik Otomasyonu Gereksinim Analizi

Bu proje, bir veterinerlik otomasyonu sistemine yönelik gereksinim analizi ve veri ilişkilerini tanımlamaktadır. Aşağıda sistemin temel bileşenleri ve ihtiyaç duyulan özellikler detaylı olarak açıklanmıştır.

## 1. Müşteriler
Veterinerlik hizmetlerinden yararlanan bireyler veya kuruluşlarla ilgili bilgileri saklar.

### Gereksinimler:
* Müşteri ID (PK)
* Müşteri Adı
* Müşteri Soyadı
* Müşteri Telefon Numarası
* Müşteri Adresi

---

## 2. Veterinerler
Veteriner kliniğinde çalışan uzmanların bilgilerini içerir.

### Gereksinimler:
* Veteriner ID (PK)
* Veteriner Adı
* Veteriner Soyadı
* Veteriner Telefon Numarası

---

## 3. Hayvanlar
Veterinerlik hizmeti alan hayvanlarla ilgili bilgileri tutar.

### Gereksinimler:
* Hayvan ID (PK)
* Hayvan Türü
* Hayvan Yaşı
* Hayvan Cinsiyeti

---

## 4. Hastalıklar
Hayvanlarda teşhis edilen hastalıkların bilgisini saklar.

### Gereksinimler:
* Hastalık ID (PK)
* Hastalık Adı

---

## 5. Tedaviler
Hastalıkların teşhis ve tedavi süreçlerini kapsayan verileri içerir.

### Gereksinimler:
* Tedavi ID (PK)
* Tedavi Başlangıç Tarihi
* Tedavi Bitiş Tarihi

---

## 6. Tedavi-İlaç İlişkisi
Tedavide kullanılan ilaçların miktarını ve ilişkisini yönetir.

### Gereksinimler:
* Tedavi ID (FK)
* İlaç ID (FK)
* İlaç Dozu

---

## 7. Tedavi-Hastalık İlişkisi
Tedavi ve hastalık arasındaki ilişkiyi yönetir.

### Gereksinimler:
* Tedavi ID (FK)
* Hastalık ID (FK)

---

## 8. İlaçlar
Veterinerlik hizmetlerinde kullanılan ilaçların veritabanında tutulmasını sağlar.

### Gereksinimler:
* İlaç ID (PK)
* İlaç Adı
* İlaç Fiyatı

---

## 9. Tedavi Sonucu
Tedavi sonucunda hayvanın sağlık durumunu belirten kayıtları tutar.

### Gereksinimler:
* Sonuç ID (PK)
* Sonuç Durumu
* Hayvan Durumu (Enum: Ölü, İyileşti, Tedavi Ediliyor)

---

## 10. İlişkiler ve Kardinaliteler
### İlişki Detayları:
* **Müşteriler** ve **Hayvanlar**: 1 müşterinin birden fazla hayvanı olabilir (1..*).
* **Veterinerler** ve **Hayvanlar**: 1 veteriner birden fazla hayvanla ilgilenebilir (1..*).
* **Hayvanlar** ve **Tedaviler**: 1 hayvana birden fazla tedavi uygulanabilir (1..*).
* **Tedaviler** ve **İlaçlar**: 1 tedavide birden fazla ilaç kullanılabilir (1..*).
* **Tedaviler** ve **Hastalıklar**: 1 tedavi birden fazla hastalık için uygulanabilir (1..*).
* **Tedavi Sonucu** ve **Hayvanlar**: Her hayvanın bir tedavi sonucu olabilir (1..1).

---
