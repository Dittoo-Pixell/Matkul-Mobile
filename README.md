# Tugas 5 - IT Service Pricing Catalog

Sebuah aplikasi antarmuka pengguna (UI) berbasis Flutter yang menampilkan katalog layanan IT beserta detail harganya. Project ini dibuat untuk memenuhi tugas praktikum/mata kuliah [Nama Mata Kuliah].

##  Identitas Mahasiswa
- **Nama:** Hanindito Pratama Wicaksono
- **NIM:** 253140701111005
- **Kelas/Kelompok:** T3B
- **Program Studi:** Teknologi informasi

##  Fitur Utama
- **Katalog Layanan:** Menampilkan daftar paket (Basic, Professional, Enterprise) menggunakan widget `ListView`.
- **Card Interaktif:** Desain kartu harga yang menggunakan efek elevasi animasi (hover) saat disentuh.
- **Navigasi Halaman:** Menggunakan `Navigator.push` dan `Navigator.pop` untuk berpindah dari halaman beranda ke detail paket.
- **State Management Dasar:** Penggunaan `StatefulWidget` pada tombol "Pilih Paket" untuk mengubah status *bookmark*.


##  Cara Menjalankan Project (How to Run)
Pastikan sistem kamu sudah terinstal [Flutter SDK](https://docs.flutter.dev/get-started/install).

1. Buka folder project ini menggunakan *code editor* (VS Code / Android Studio).
2. Buka terminal yang mengarah ke folder project ini.
3. Unduh semua *dependencies* (jika ada) dengan menjalankan perintah:
   ```bash
   flutter pub get
