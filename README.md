# TP2PROVIS2024C2

### Struktur Program

- **main.dart**: Berisi titik masuk utama dari aplikasi Flutter. Ini menampilkan daftar pasien dan memungkinkan pengguna untuk memilih salah satunya.
- **NextPage.dart**: Mewakili langkah berikutnya setelah memilih pasien. Ini memungkinkan pengguna untuk memesan janji temu dengan memilih rumah sakit, spesialisasi, dan hari.

### Fitur

1. **Pemilihan Pasien**:
   - Menampilkan daftar pasien yang dikategorikan sebagai "Myself" dan "Others".
   - Setiap entri pasien mencakup nama, tanggal, dan nomor telepon.
   - Memungkinkan pengguna memilih pasien menggunakan tombol radio.

2. **Pemesanan Janji Temu**:
   - Memungkinkan pengguna untuk menavigasi ke halaman berikutnya untuk memesan janji temu setelah memilih pasien.
   - Memberikan menu dropdown untuk memilih rumah sakit, spesialisasi, dan hari untuk janji temu.

3. **Navigasi**:
   - Memanfaatkan sistem navigasi Flutter untuk berpindah antara layar.

### Dependencies

- **flutter**
- **google_fonts**
