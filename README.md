# Agendaku - Modern Minimalist To-Do List

Aplikasi To-Do List modern, rapi, dan responsif yang dibangun menggunakan Flutter untuk membantu mahasiswa mengelola tugas kuliah, proyek/tubes, dan aktivitas harian dengan efisien tanpa antarmuka yang membosankan.

---

## ✨ Fitur Unggulan

1. **Manajemen Tugas Lengkap (CRUD)**
   - Tambah tugas baru dengan judul, catatan opsional, kategori, prioritas, dan tenggat waktu.
   - Edit tugas yang sudah ada dengan mudah.
   - Hapus tugas menggunakan gesture **Swipe-to-Dismiss** yang dilengkapi tombol **Batalkan (Undo)** pada SnackBar.
   - Checklist interaktif satu ketukan dengan efek coret dan animasi halus.

2. **Pengelompokan Kategori & Filter Cepat**
   - Kategori bawaan: *Kuliah*, *Tubes*, *Tugas*, *Pribadi*, *Umum*.
   - Filter horizontal dengan indikator jumlah tugas aktif per kategori.

3. **Indikator Prioritas & Tenggat Waktu (Due Date)**
   - 3 level prioritas: **Rendah** (Slate), **Sedang** (Amber), dan **Tinggi** (Crimson).
   - Penanda tenggat waktu pintar (mendeteksi status *Hari Ini*, *Besok*, maupun *Terlambat*).

4. **Progress Tracker & Ringkasan Harian**
   - Kartu progress elegan di bagian atas layar yang menghitung persentase penyelesaian tugas secara real-time.
   - Salam personal adaptif sesuai waktu (Pagi/Siang/Sore/Malam) dan tanggal hari ini.

5. **Pencarian Realtime & Pengurutan (Sorting)**
   - Fitur pencarian cepat di AppBar berdasarkan judul, catatan, atau kategori.
   - Urutkan daftar tugas berdasarkan:
     - Tenggat Waktu Terdekat
     - Prioritas Tertinggi
     - Paling Baru Dibuat

6. **Persistensi Data Lokal**
   - Penyimpanan data permanen menggunakan `shared_preferences`. Data tidak akan hilang saat aplikasi ditutup atau dimulai ulang.

7. **Dukungan Tema Terang & Gelap (Light / Dark Mode)**
   - Tombol toggle langsung di AppBar untuk beralih antara tema terang minimalis (Nordic Slate) dan tema gelap (Deep Slate).

---

## 📁 Struktur Direktori

```text
lib/
├── main.dart                      # Titik masuk aplikasi & konfigurasi tema
├── models/
│   └── todo.dart                  # Model Todo, enum Priority, serialisasi JSON
├── services/
│   └── todo_storage.dart          # Layanan SharedPreferences & data awal
├── theme/
│   └── app_theme.dart             # Palet warna, Light Theme, Dark Theme
├── screens/
│   └── home_screen.dart           # Layanan layar utama, filter, pencarian, dan sorting
└── widgets/
    ├── category_filter_bar.dart   # Bar filter kategori horizontal
    ├── empty_task_view.dart       # Tampilan saat daftar tugas kosong
    ├── todo_card.dart             # Komponen kartu tugas (checkbox, badge, swipe)
    ├── todo_form_sheet.dart       # Modal bottom sheet tambah & edit tugas
    └── todo_progress_card.dart    # Kartu ringkasan progress harian
```

---

## 🚀 Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang di perangkat Anda.
2. Buka terminal pada folder proyek ini:
   ```bash
   cd /mnt/d/SEMESTER5/todo_app
   ```
3. Unduh dependensi:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada emulator atau perangkat yang terhubung:
   ```bash
   flutter run
   ```
5. Untuk menjalankan unit/widget test:
   ```bash
   flutter test
   ```
