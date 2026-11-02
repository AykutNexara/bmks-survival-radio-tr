# BMKs Survival Radio – Türkçe Sürüm

Quansheng UV-K5 / UV-K6 el telsizi için **BMKs Survival Radio** firmware'inin Türkçe sürümü.
Menü, ekran mesajları ve dahili kılavuz (F+6) Türkçedir.

**🔧 Ayar aracını aç: [aykutnexara.github.io/bmks-survival-radio-tr](https://aykutnexara.github.io/bmks-survival-radio-tr/)**
· **⬇ Firmware indir: [son sürüm](../../releases/latest)**

Bu depo, Melih Karakelle'nin [melihkarakelle/bmks-survival-radio](https://github.com/melihkarakelle/bmks-survival-radio)
projesinin bir fork'udur. Bütün özellikler ve emek orijinal projeye aittir. Bu fork sadece yazıları
Türkçeye çevirir ve iki küçük ekran düzeltmesi içerir. Orijinal İngilizce açıklama: [README.en.md](README.en.md).

## Ne değişti

- **Kılavuz (F+6):** 27 konunun hepsi Türkçe (`design/manual.txt`). İngilizce metin `design/manual.en.txt` içinde duruyor.
- **Menü:** Menü adları, başlıklar, seçenekler ve alt satır ipuçları Türkçe (Grup, Favori, Sessiz, Ileri; KAPALI/ACIK, IZIN/YASAK...).
- **Ana ekran, FM ekranı, mesajlar:** KANAL MESGUL, PIL ZAYIF, FAVORI EKLENDI, M'YE BAS / KILAVUZ ICIN...
- **Gruplar:** PMR446, DENIZ, HAVA, AMATOR, CB, FM RADYO, OZEL, FAVORI.
- **FRS kaldırıldı:** FRS (462/467 MHz) ABD ve Kanada'nın lisanssız servisidir, Türkiye'de kullanılamaz.
  Bu sürümde FRS grubu ve TxFRS ayarı yoktur. Türkiye'de lisanssız telsiz PMR446'dır.
- **FAVORI:** Kendi kanalların için 80 yer (telsizde kanal 121–200).
- **Tuş adları** cihazdaki gibi kaldı: M, F, EXIT, PTT, UP/DN. "Basılı tut" = **UZUN**, yan tuşlar = **YAN1 / YAN2**.
- **Değişmeyenler:** Fonetik alfabe (Alfa, Bravo...) ve MAYDAY, PAN-PAN, OVER uluslararası olduğu için aynı kaldı.
- **Düzeltme:** Menüde *Isim* (kanal adı) ekranında kanal numarası başlığın üstüne biniyordu. Artık bir alt satırda küçük yazılıyor.
- **Süre birimi:** `01m:00s` yerine `01dk:00sn`.

Ekran fontunda Türkçe harf (ç, ğ, ı, ö, ş, ü) yok. Bu yüzden yazılar düz harflerle yazıldı: "Kilavuz", "Isik", "Oncelik".

**Bilinen durum:** Telsizin hafızasındaki kanal adları ("MAR 16", "2M CALL EU" gibi) İngilizce kalır.

## Uyumluluk

- **DP32G030 işlemcili** Quansheng UV-K5, UV-K5(8), UV-K6, UV-5R Plus.
- **Yeni UV-K5 V3 / UV-K1 (PY32F071 işlemci) için DEĞİLDİR. Bunlara yüklemeyin.**
- Nasıl anlaşılır: Orijinal firmware sürümü **2.xx** ise uygundur. **7.xx** ise uygun değildir.
  Telsizde egzumer ya da F4HWN (4.x) çalışıyorsa da uygundur.
- Bir UV-K6 (egzumer v0.22'den geçilerek) üzerinde denendi. Menü, kılavuz, ana ekran ve FM ekranı kontrol edildi.

## Kurulum

Gereken: K tipi (Kenwood) USB programlama kablosu ve Chrome ya da Edge tarayıcısı.

### 1. Önce yedek al

Telsizin kalibrasyon verisi EEPROM'da durur ve her cihaza özeldir. Kaybolursa geri gelmez.

1. **Önce telsizi normal aç** (PTT'ye basmadan), **sonra kabloyu tak.**
   Kablo takılıyken açarsan bazı telsizler kendiliğinden yükleme moduna girer (ekran boş kalır), yedek alınamaz.
2. [Multi-UVTools](https://spm81.github.io/Multi-UVTools) sitesini aç, **Connect** de.
   Listeden **USB Serial / CH340** olan bağlantı noktasını seç. "İletişim Bağlantı Noktası (COM1)" kablonuz değildir.
3. **Tools** sekmesinde **Backup EEPROM** (8 KB) ve **Dump Calibration** (512 bayt) dosyalarını indir. Güvenli bir yere koy.

### 2. Firmware'i yükle

1. [`builds/bmks.survival.tr.packed.bin`](builds/bmks.survival.tr.packed.bin) dosyasını indir.
2. Multi-UVTools'ta **Flash** sekmesinde **Dosya Seç** ile bu dosyayı seç.
3. Telsizi kapat. **PTT'yi basılı tut, telsizi aç, PTT'yi bırak.** Ekran boş kalır.
4. **Flash UV-K5/K6/5R** düğmesine bas. %100 olana kadar kabloya dokunma.
5. Kabloyu çıkar, telsizi PTT'ye basmadan aç. İlk açılışta kanal tablolarını yazar,
   sonra logo ve **M'YE BAS / KILAVUZ ICIN** görünür.

[UV tools web flasher](https://egzumer.github.io/uvtools) ile de yüklenebilir (aynı `.packed.bin` dosyası).
Komut satırı için ham dosya: `builds/bmks.survival.tr.bin` ve `tools/k5flash.py`.

Geri dönmek için başka bir firmware'i (örneğin İngilizce `builds/bmks.survival.packed.bin`) aynı yolla yükle.

## Gönderme (TX) hakkında

Firmware sadece *Menu > Ileri* içinde açtığın bantlarda FM göndermeye izin verir
(TxPMR, TxDNZ, TxAMT, TxCB, TxHep). Başta sadece PMR açıktır.
Bulunduğun yerde lisanssız olup olmadıklarını kontrol et. Deniz, amatör ve birçok CB kullanımı lisans ister.

Firmware olduğu gibi, hiçbir garanti olmadan verilir. Yükleme riski sana aittir.
Sertifikalı bir acil durum cihazı değildir.

## Ayar aracı (bilgisayardan düzenleme)

Adres: **https://aykutnexara.github.io/bmks-survival-radio-tr/** (kurulum gerekmez, tarayıcıda çalışır).

**Gerekenler:** Chrome ya da Edge (Firefox ve Safari seri bağlantıyı desteklemez), K tipi USB programlama kablosu,
telsizde bu firmware.

**Kullanım:**
1. **Önce** telsizi normal aç (PTT'ye basmadan), **sonra** kabloyu tak.
   Telsiz kablo takılıyken açılırsa yükleme moduna girebilir (ekran boş kalır).
2. **1. Bağlan**'a bas. Listeden **USB Serial / CH340** olanı seç. "İletişim Bağlantı Noktası (COM1)" kablo değildir.
3. **2. Telsizden oku**'ya bas. Sonra **Yedeği indir** ile 8 KB yedeği sakla.
4. Ayarları değiştir ya da **FAVORI kanalları**na kendi rölelerini ekle (elle ya da CSV ile).
5. **Değişiklikler** kutusundaki listeyi kontrol et, **Değişiklikleri telsize yaz** ve **Onayla ve yaz**'a bas.
6. Telsiz yeniden başlar. Ekran boş kalırsa kabloyu çıkar, telsizi kapatıp aç.

**Neler değiştirilebilir:** squelch, Eko, arka ışık, tuş sesi, otomatik kilit, TX süre sınırı, mikrofon,
FM arka plan izleme, OZEL aralık, TX izinleri ve FAVORI kanalları (ad, frekans, kaydırma, ton, güç, bant).

**CSV biçimi** (Excel'de açılabilir, `;` ile ayrılır):
```
ad;alma_mhz;kaydirma_mhz;gonderme_tonu;alma_tonu;guc;bant;mod
ROLE ADI;145.67500;-0.6;88.5;;Yüksek;Geniş;FM
ROLE UHF;439.20000;-7.6;88.5;;Yüksek;Geniş;FM
```
Kaydırma röle için VHF'de genelde -0.6, UHF'de -7.6 MHz. Ton CTCSS (ör. 88.5) ya da DCS (ör. D023N), boşsa ton yok.

**Güvenlik:** Sabit kanallara (PMR, Deniz, CB…) ve kalibrasyona yazmaz. Yazmadan önce otomatik yedek indirir,
yazdıktan sonra geri okuyup kontrol eder. Telsiz olmadan bir yedek dosyasını **Dosyadan aç** ile inceleyebilirsin.

Araç dosyası: [`docs/index.html`](docs/index.html). İnternetsiz kullanmak için indirip Chrome'a sürükleyebilirsin.

## Kaynaktan derleme

Kaynak `firmware/` klasöründe. Kılavuz `design/manual.txt` dosyasından `python3 tools/manual2c.py` ile üretilir.
Bu araç her satırın ekrana sığdığını da kontrol eder (başlık 12, satır 18 karakter).

- Docker ile (orijinal yöntem): `EDITION=survival SURVIVAL_VERSION=v6.9 TARGET=bmks.survival.tr tools/build-f4hwn.sh "$PWD/firmware"`
- Docker olmadan (Linux): `tools/build-local.sh firmware builds bmks.survival.tr`

`builds/` içindeki Türkçe dosyalar **GCC 15.2.1 (xPack)** ile derlendi.
Orijinal İngilizce dosyalar yazarın Docker (Alpine) ortamında derlenmişti.
Derleyiciye göre dosya boyutu biraz değişir. Sınır 61.440 bayttır.

## Teşekkür

- [Melih Karakelle](https://github.com/melihkarakelle/bmks-survival-radio): BMKs Survival Radio.
- [DualTachyon](https://github.com/DualTachyon/uv-k5-firmware), [egzumer](https://github.com/egzumer/uv-k5-firmware-custom),
  [armel / F4HWN](https://github.com/armel/uv-k5-firmware-custom): temel aldığı firmware.
- Türkçe çeviri: TA1BAO.

## Lisans

Apache License 2.0, orijinal proje gibi. Bkz. [LICENSE](LICENSE).
Bu fork orijinal dosyalarda değişiklik yapmıştır. Değişiklikler yukarıda "Ne değişti" bölümünde
ve git geçmişinde listelenmiştir.
