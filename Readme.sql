# 🚗 Araç Kiralama Otomasyon Sistemi | Car Rental Automation System

![Oracle](https://img.shields.io/badge/Oracle_23ai-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Advanced-blue?style=for-the-badge)
![Academic](https://img.shields.io/badge/Academic-Sel%C3%A7uk_%C3%9Cniversitesi-00529B?style=for-the-badge)

## 📖 Proje Hakkında (About the Project)
Bu proje, araç kiralama süreçlerini dijitalleştirmek ve otomatize etmek amacıyla geliştirilmiş tam kapsamlı bir **İlişkisel Veritabanı Yönetim Sistemi (RDBMS)** projesidir. Sistem; araç durumu takibi, müşteri yönetimi, finansal raporlama ve otomatik bakım süreçlerini PL/SQL mimarisi ile yönetmektedir.

This is a comprehensive Relational Database Management System (RDBMS) designed to automate car rental processes, including real-time vehicle availability tracking, customer management, financial reporting, and automated maintenance logging.

## ✨ Temel Özellikler (Key Features)
* **Pipelined Functions:** Müsait araçların bellek dostu ve hızlı bir şekilde listelenmesi (`FN_MUSAIT_ARACLAR`).
* **Otomatik Tetikleyiciler (Triggers):** * Araç bakıma girdiğinde durumunun otomatik olarak 'BAKIMDA' şeklinde güncellenmesi.
  * Veri bütünlüğü için girilen plakaların otomatik olarak BÜYÜK HARFE (uppercase) çevrilmesi.
* **İşlem Güvenliği (Exception Handling):** Kirada veya bakımda olan bir aracın tekrar kiralanmasını engelleyen güvenli kiralama prosedürü.
* **Dinamik Raporlama (Cursors):** Müşteri bazlı yıllık kazanç raporlarının (Ciro) otomatik hesaplanması.

## 📂 Dosya Yapısı ve Çalıştırma Sırası (Project Structure & Execution Order)
Sistemin sorunsuz çalışması için veritabanı scriptlerinin aşağıdaki sırayla (dependency order) çalıştırılması gerekmektedir:

1. `types.sql`: Pipelined fonksiyonlar için gerekli olan özel veri tipleri (Objects & Collections).
2. `tables.sql`: Temel tablolar ve aralarındaki Foreign Key ilişkileri.
3. `functions.sql`: İş kurallarını ve hesaplamaları yöneten fonksiyonlar.
4. `procedures.sql`: Kiralama işlemleri ve finansal raporlamalar.
5. `triggers.sql`: Veri kalitesini ve otomasyonu sağlayan tetikleyiciler.

## 🛠️ Teknolojiler (Tech Stack)
* **Database:** Oracle Database 23ai (FreeSQL)
* **Language:** SQL, PL/SQL
* **Architecture:** Code-First Database Design

---
*Developed by a passionate Software Engineering student at Selçuk University.*