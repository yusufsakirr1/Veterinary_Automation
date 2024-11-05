# Veterinerlik Otomasyonu

### Proje Üyeleri
- **215260016** Yusuf Burak DAĞISTANLI
- **225260070** Emre ALTUNDAĞ
- **225260082** Yusuf ŞAKİR

### Proje Gereksinimi
Veterinerlik otomasyon sisteminin amacı, müşteriler ve onların sahip olduğu hayvanların tedavi süreçlerini yönetmek, hayvanların sağlık kayıtlarını tutmak ve veterinerlerin bu süreçteki görevlerini izlemek için bir sistem sağlamaktır. Bu sistem, müşteri ve hayvan bilgilerinin yanı sıra tedavi ve ilaç bilgilerini de içerecek şekilde kapsamlı bir veri yönetimi sağlamalıdır.

---

### Varlıklar ve Nitelikleri

1. **Müşteriler**
   - **Müşteri_ID (PK)**: Müşteriye özgü bir kimlik numarası.
   - **MusteriAdi**: Müşterinin adı.
   - **MusteriSoyadi**: Müşterinin soyadı.
   - **MusteriTelefon**: Müşterinin telefon numarası.
   - **MusteriAdres**: Müşterinin adres bilgisi.

2. **Veterinerler**
   - **Veteriner_ID (PK)**: Veterinere özgü bir kimlik numarası.
   - **VeterinerAdi**: Veterinerin adı.
   - **VeterinerSoyadi**: Veterinerin soyadı.
   - **VeterinerTelefon**: Veterinerin telefon numarası.

3. **İlaçlar**
   - **Ilac_ID (PK)**: İlaç kimlik numarası.
   - **IlacAdi**: İlaç adı.
   - **IlacFiyati**: İlacın fiyat bilgisi.

4. **Hayvanlar**
   - **Hayvan_ID (PK)**: Hayvana özgü kimlik numarası.
   - **HayvanTur**: Hayvanın tür bilgisi (örneğin kedi, köpek).
   - **HayvanYas**: Hayvanın yaşı.
   - **HayvanCinsiyet**: Hayvanın cinsiyeti.

5. **Tedaviler**
   - **Tedavi_ID (PK)**: Tedaviye özgü kimlik numarası.
   - **Veteriner_ID (FK)**: Tedavi uygulayan veterinerin kimlik numarası.
   - **TedaviBaslangicTarihi**: Tedavi başlangıç tarihi.
   - **TedaviBitisTarihi**: Tedavi bitiş tarihi.
   - **Hayvan_ID (FK)**: Tedavi gören hayvanın kimlik numarası.
   - **HayvanHastalik**: Hayvanın hastalık bilgisi.
   - **Ilac_ID (FK)**: Tedavi sürecinde kullanılan ilacın kimlik numarası.
   - **IlacDozu**: İlacın dozaj bilgisi.

6. **Ölen Hayvanlar**
   - **Hayvan_ID (FK)**: Hayvanın kimlik numarası.
   - **HayvanOlumTarihi**: Hayvanın ölüm tarihi.
   - **HayvanOlumNedeni**: Hayvanın ölüm nedeni.
   - **Tedavi_ID (FK)**: Ölen hayvana uygulanan tedavi kimlik numarası.
   - **Musteri_ID (FK)**: Hayvanın sahibinin kimlik numarası.

7. **İyileşen Hayvanlar**
   - **Hayvan_ID (FK)**: Hayvanın kimlik numarası.
   - **HayvanIyilesmeTarihi**: Hayvanın iyileşme tarihi.
   - **Tedavi_ID (FK)**: İyileşen hayvana uygulanan tedavi kimlik numarası.
   - **Musteri_ID (FK)**: Hayvanın sahibinin kimlik numarası.

---

### Varlıklar Arasındaki İlişkiler
- **Müşteriler - Hayvanlar**: Bir müşteri bir veya birden fazla hayvana sahip olabilir (1..*) ancak her hayvan yalnızca bir müşteriye aittir (1..1).
- **Veterinerler - Tedaviler**: Bir veteriner bir veya birden fazla tedavi uygulayabilir (1..*) ancak her tedavi yalnızca bir veteriner tarafından yapılır (1..1).
- **Hayvanlar - Tedaviler**: Bir hayvan bir veya birden fazla tedavi görebilir (1..*) ancak her tedavi yalnızca bir hayvana uygulanır (1..1).
- **Tedaviler - İlaçlar**: Bir tedavi sürecinde bir veya birden fazla ilaç kullanılabilir (1..*), bir ilaç birden fazla tedavide kullanılabilir (1..*).
- **Tedaviler - Ölen Hayvanlar**: Bir hayvan öldüğünde bu kayıt altında tutulur ve her ölen hayvan sadece bir hayvan kaydına karşılık gelir (1..1).
- **Tedaviler - İyileşen Hayvanlar**: Bir hayvan iyileştiğinde bu kayıt altında tutulur ve her iyileşen hayvan yalnızca bir hayvan kaydına karşılık gelir (1..1).

---

### Veterinerlik Otomasyonu E-R Diyagramı
Bu bölümde, Veterinerlik Otomasyon Sistemi'ndeki varlıkların ve ilişkilerin görselleştirildiği E-R (Entity-Relationship) diyagramı yer almaktadır.

![uml](https://github.com/user-attachments/assets/8473aa10-38c1-4b1f-b18d-7cde81ac11f8)


