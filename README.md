# 📊 Orizon: Küresel Satış ve Performans Yönetimi Dashboard

Orizon, bir e-ticaret platformunun satış, kâr ve lojistik verilerini uçtan uca işleyen profesyonel bir iş zekası (BI) çözümüdür. Bu çalışma; ham verinin SQL ile modellenmesinden, karmaşık DAX ölçüleri ile anlamlandırılmasına ve son kullanıcı için etkileşimli bir rapor haline getirilmesine kadar olan tüm süreçleri kapsar.

---

## 🧭 Kullanıcı Deneyimi ve Navigasyon
Rapor, veri yoğunluğunu kullanıcıyı yormadan sunmak amacıyla minimalist ve sezgisel bir arayüzle tasarlanmıştır.

* **Akıllı Navigasyon:** Sol panelde yer alan ikon tabanlı menü sayesinde sayfalar arası geçiş akıcı hale getirilmiştir.
    * 🏠 **Ana Panel:** Genel KPI'lar ve özet satış verileri.
    * 🌍 **Küresel Analiz:** Harita tabanlı bölgesel performans takibi.
    * 📈 **Performans Detayı:** Operasyonel ve ürün odaklı derinlemesine analiz.
* **Dinamik Filtreleme:** Sayfa altındaki yıl ve ay dilimleyicileri (slicers) tüm görsellerle senkronize çalışarak anlık analiz imkanı sunar.

---

## 📈 Rapor Sayfaları ve Analiz Detayları

### 1. Ana Panel (Genel Bakış)
İşletmenin genel sağlığını tek bakışta özetleyen stratejik katmandır:
* **KPI Takibi:** Toplam satış, kâr marjı ve sipariş adetleri gibi kritik metrikler anlık izlenir.
* **Trend Analizi:** Satışların zamana göre değişimi, mevsimsellik ve büyüme hızı grafiklerle görselleştirilmiştir.
* **Stratejik Hedef İzleme:** Belirlenen 5M ₺ yıllık hedeflerin gerçekleşme oranı kümülatif olarak takip edilir.

### 2. Küresel Performans ve Coğrafi Analiz
Satışların dünya genelindeki yayılımını incelemek için tasarlanmıştır:
* **Etkileşimli Harita Analizi:** Ülke bazlı satış hacmi üzerinden dinamik bölge seçimi ve çapraz filtreleme.
* **Pazar Büyüme Eğilimi:** Haritadaki seçimlere göre anlık güncellenen aylık ve yıllık satış trendleri.

### 3. Operasyonel Verimlilik ve Ürün Odaklı Analiz
Lojistik süreçlerin ve ürün performansının değerlendirildiği en kapsamlı katmandır:
* **Kategori ve Ürün Analizi:** En yüksek ciro sağlayan ilk 5 kategori ve ürün grubunun karşılaştırmalı sunumu.
* **Müşteri ve Pazar Yoğunluğu:** Sipariş adetlerine göre en aktif 5 pazarın belirlenmesi.
* **Lojistik Dağılımı:** Ürünlerin kargo firmalarına (Aras, Yurtiçi, DHL vb.) göre operasyonel iş yükü analizi.

---

## 🛠️ Teknik Mimari

### 1. Veri Modelleme (SQL)
Veri tabanı, ilişkisel modelleme prensiplerine uygun olarak **PostgreSQL** üzerinde yapılandırılmıştır:
* **İlişkisel Yapı:** `kategoriler`, `urunler`, `musteriler` ve `siparisler` tabloları arasında Foreign Key ilişkileri kurulmuştur.
* **Veri Simülasyonu:** 2023-2025 yıllarını kapsayan veriler, popüler ürün ağırlıklandırmaları içeren özel SQL scriptleri ile üretilmiştir.

### 2. İş Zekası ve DAX (Power BI)
Analizlerin temelini oluşturan bazı ileri seviye hesaplamalar:
* **Yıllık Hedef Takibi:** 5.000.000 ₺ hedefe karşı kümülatif gerçekleşme oranı.
* **Kümülatif Satış (YTD):** Yıl başından itibaren birikimli satış performansı.
* **Pareto Analizi (%80/20):** Toplam cironun %80'ini getiren kritik ürünlerin tespiti.
* **Kâr Marjı Verimliliği:** %31,13 oranındaki net operasyonel kârlılık metriği.
* **Dinamik Sıralama:** Top 5 ürün ve kategorinin otomatik filtrelenmesi.

---
*Not: Bu proje, ham veriden stratejik karara giden yolu simüle eden bir portfolyo çalışmasıdır.*
