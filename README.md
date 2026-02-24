# 🚗 Rental Mobil Mainan

Aplikasi mobile berbasis Flutter untuk mengelola bisnis penyewaan mobil mainan . Dirancang khusus untuk penjual di lokasi ramai seperti alun-alun kota, dengan alur transaksi yang cepat dan sederhana.

---

## 📱 Deskripsi Aplikasi

**Rental Mobil Mainan** adalah sistem manajemen penyewaan mobil die-cast yang memudahkan penjual mencatat dan memantau transaksi secara real-time. Sistem harga berbasis waktu, dengan durasi yang bisa disesuaikan. Data penyewa bersifat opsional (default titik ".") sehingga transaksi bisa diselesaikan dengan cepat saat kondisi ramai.

---

## ✨ Fitur Aplikasi

### CRUD Lengkap
| Fitur | Keterangan |
|-------|-----------|
| ➕ **Create** | Tambah data mobil baru & buat transaksi penyewaan |
| 👁️ **Read** | Lihat daftar mobil, detail mobil, daftar & detail penyewaan, dashboard statistik |
| ✏️ **Update** | Edit informasi mobil (nama, warna, keterangan) |
| 🗑️ **Delete** | Hapus data mobil & batalkan/hapus penyewaan |

### Fitur Unggulan
- ⏱️ **Sistem Harga Berbasis Waktu** — Rp 20.000 / 15 menit, otomatis dihitung
- 🕐 **Tampil Jam Selesai Otomatis** — langsung terlihat kapan waktu sewa berakhir
- ⚡ **Form Cepat** — data penyewa opsional (default "."), cocok saat kondisi ramai
- 📊 **Dashboard** — ringkasan total mobil, tersedia, aktif disewa, dan total pendapatan
- 🗂️ **Tab Penyewaan** — tampilan terpisah antara penyewaan aktif dan riwayat
- ✅ **Status Penyewaan** — tandai selesai atau batalkan langsung dari detail

---

## 🧭 Navigasi Multi-Halaman

```
HomeScreen (BottomNavigationBar)
├── DashboardScreen         → Statistik & penyewaan terbaru
├── CarsScreen              → Daftar mobil
│   ├── CarDetailScreen     → Detail mobil + riwayat sewa
│   │   └── RentalFormScreen (pre-filled mobil)
│   └── CarFormScreen       → Tambah / Edit mobil
└── RentalsScreen           → Daftar penyewaan (Tab: Aktif | Riwayat)
    ├── RentalDetailScreen  → Detail penyewaan + tandai selesai/hapus
    └── RentalFormScreen    → Form buat penyewaan baru
```

---

## 🧩 Widget yang Digunakan

### Layout & Navigation
| Widget | Penggunaan |
|--------|-----------|
| `Scaffold` | Kerangka dasar setiap halaman |
| `NavigationBar` | Bottom navigation 3 tab utama |
| `TabBar` & `TabBarView` | Tab Aktif / Riwayat di halaman penyewaan |
| `CustomScrollView` & `SliverAppBar` | App bar yang bisa di-scroll di dashboard |
| `SliverList` | List konten di dalam CustomScrollView |
| `BottomNavigationBar` | Navigasi utama antar halaman |

### Input & Form
| Widget | Penggunaan |
|--------|-----------|
| `TextFormField` | Input nama, warna, keterangan, nama penyewa, telepon, alamat |
| `Form` & `GlobalKey<FormState>` | Validasi form |
| `DropdownButtonFormField` | Pilih mobil yang tersedia saat membuat penyewaan |
| `Slider` | Atur durasi sewa secara interaktif |
| `GestureDetector` | Tombol preset durasi (15m, 30m, 45m, dst.) |

### Display
| Widget | Penggunaan |
|--------|-----------|
| `Card` | Kartu informasi mobil & penyewaan |
| `ListTile` | Item list penyewaan & riwayat |
| `CircleAvatar` | Avatar ikon penyewaan di dashboard |
| `Container` | Box styling kustom dengan dekorasi |
| `Row` & `Column` | Layout horizontal & vertikal |
| `Expanded` | Flex layout responsif |
| `ListView.builder` | Daftar dinamis mobil & penyewaan |
| `AlertDialog` | Konfirmasi hapus & selesai |
| `SnackBar` | Notifikasi aksi berhasil |
| `Wrap` | Tombol preset durasi yang otomatis wrap |

### Styling & Decoration
| Widget | Penggunaan |
|--------|-----------|
| `BoxDecoration` | Border radius, warna, & gradient |
| `LinearGradient` | Gradient ungu di header & kartu biaya |
| `Icon` | Ikon berbagai elemen UI |
| `FloatingActionButton.extended` | Tombol tambah mobil & buat penyewaan |
| `ElevatedButton` | Tombol aksi utama |
| `OutlinedButton` | Tombol aksi sekunder (batalkan) |
| `NavigationDestination` | Item destinasi bottom navigation |

### State Management
| Widget / Class | Penggunaan |
|--------|-----------|
| `ChangeNotifier` & `ChangeNotifierProvider` | State management global seluruh aplikasi |
| `context.watch<AppStore>()` | Reactif terhadap perubahan data |
| `context.read<AppStore>()` | Aksi tanpa trigger rebuild |
| `StatefulWidget` | State lokal untuk form & tab controller |
| `TextEditingController` | Kontrol & default value TextField |

---

## 📁 Struktur Proyek

```
lib/
├── main.dart                      # Entry point, tema ungu, inisialisasi locale
├── app_store.dart                 # State management global (ChangeNotifier)
├── models/
│   ├── car.dart                   # Model: id, name, color, note, isAvailable
│   └── rental.dart                # Model: id, car, renterName, renterPhone,
│                                  #        renterAddress, startTime, durationMinutes
└── screens/
    ├── home_screen.dart           # Shell NavigationBar utama
    ├── dashboard_screen.dart      # Statistik & penyewaan terbaru
    ├── cars_screen.dart           # Daftar semua mobil
    ├── car_form_screen.dart       # Form tambah / edit mobil (3 TextField)
    ├── car_detail_screen.dart     # Detail mobil + riwayat penyewaan
    ├── rentals_screen.dart        # Daftar penyewaan (TabBar)
    ├── rental_form_screen.dart    # Form buat penyewaan (3 TextField + durasi)
    └── rental_detail_screen.dart  # Detail penyewaan + aksi selesai/hapus
```

---
## 🚀 Cara Menjalankan

```bash
# Clone repository
git clone https://github.com/username/rental_mobil_mainan.git
cd rental_mobil_mainan

# Install dependencies
flutter pub get

# Jalankan aplikasi
flutter run
```
