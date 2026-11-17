<p align="center">
  <img src="docs/preview/hero.png" alt="Newsify — ilustrasi aplikasi pembaca berita" width="100%">
</p>

<h1 align="center">Newsify</h1>

<p align="center">
  <b>Berita dunia dalam satu aplikasi yang rapi.</b><br>
  NewsAPI · Firebase Auth · GetX · Flutter
</p>

<p align="center">
  <a href="https://flutter.dev"><img alt="Flutter" src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white"></a>
  <a href="https://pub.dev/packages/get"><img alt="GetX" src="https://img.shields.io/badge/State-GetX-8E24AA"></a>
  <a href="https://firebase.google.com"><img alt="Firebase" src="https://img.shields.io/badge/Auth-Firebase-FFCA28?logo=firebase&logoColor=black"></a>
  <a href="https://newsapi.org"><img alt="NewsAPI" src="https://img.shields.io/badge/API-NewsAPI.org-EF5350"></a>
</p>

---

## ✨ Preview

<p align="center">
  <img src="docs/preview/hero.png" alt="Mockup gelap Newsify" width="90%">
</p>

<table align="center">
  <tr>
    <td><img src="screenshot/onboarding1.png" alt="Onboarding" width="170"></td>
    <td><img src="screenshot/splash_screen.png" alt="Splash" width="170"></td>
    <td><img src="screenshot/login_page.png" alt="Login" width="170"></td>
    <td><img src="screenshot/news_page.png" alt="Berita" width="170"></td>
  </tr>
  <tr>
    <td align="center">Onboarding</td>
    <td align="center">Splash</td>
    <td align="center">Login</td>
    <td align="center">Berita</td>
  </tr>
</table>

<table align="center">
  <tr>
    <td><img src="screenshot/search_page.png" alt="Pencarian" width="170"></td>
    <td><img src="screenshot/detail_page.png" alt="Detail berita" width="170"></td>
    <td><img src="screenshot/saved_page.png" alt="Bookmark" width="170"></td>
    <td><img src="screenshot/share_popup.png" alt="Bagikan" width="170"></td>
  </tr>
  <tr>
    <td align="center">Pencarian</td>
    <td align="center">Detail</td>
    <td align="center">Bookmark</td>
    <td align="center">Share</td>
  </tr>
</table>

---

## 📖 Tentang

Newsify menampilkan berita dari [NewsAPI.org](https://newsapi.org/). Proyek ini dikerjakan
sebagai final project bootcamp Flutter Sanbercode, dengan desain UI yang terinspirasi
[News App UI Kit](https://www.figma.com/design/d7XSnx51jr5nev8iaMT5Es/News-App-(World-News)-UI-Kit-(Community))
di Figma Community.

> Akun NewsAPI gratis hanya memberi headline dan deskripsi singkat.

---

## 🌟 Fitur

- 🔐 **Autentikasi** — register/login email & password, plus Google Sign-In
- 💾 **Sesi tersimpan** dengan `shared_preferences`
- 🗂️ **Berita per kategori**
- 🔎 **Pencarian berita**
- 🔖 **Bookmark** untuk dibaca nanti
- 📤 **Bagikan** berita ke WhatsApp, Instagram, Facebook, dan lainnya
- 🎨 **UI custom** dengan Google Fonts dan animasi Lottie

---

## 🛠️ Tech Stack

| Area | Pilihan |
|---|---|
| Framework | Flutter |
| State management | GetX |
| Auth | Firebase Auth + Google Sign-In |
| HTTP | Dio |
| Penyimpanan lokal | GetStorage, SharedPreferences |
| Media | `image_picker`, Lottie |
| Konfigurasi | `flutter_dotenv` |

---

## 🚀 Menjalankan

```bash
flutter pub get
flutter run
```

Buat file `.env` berisi API key NewsAPI dan Firebase, lalu jalankan `flutterfire configure`
jika project Firebase belum terpasang.

---

## 🧪 Testing

```bash
flutter analyze
flutter test
```
