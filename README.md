# kickmart_product

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Jawaban Pertanyaan Tugas 7 :
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
   Widget tree adalah struktur hierarki yang menggambarkan susunan semua widget di dalam aplikasi Flutter. 
   Setiap elemen di layar (seperti teks, tombol, atau gambar) merupakan bagian dari pohon widget ini. Hubungan parent-child berarti setiap widget dapat memiliki anak (child) yang ditampung di dalamnya. 
   Widget induk (parent) berfungsi sebagai pembungkus atau pengatur letak, sedangkan widget anak (child) menampilkan isi atau komponen yang lebih spesifik. Perubahan pada parent bisa memengaruhi tata letak atau tampilan child-nya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
   MaterialApp → pembungkus utama aplikasi berbasis Material Design yang mengatur tema, warna, dan rute halaman.
   Scaffold → kerangka dasar halaman yang menyediakan struktur umum seperti AppBar, Body, dan SnackBar.
   AppBar → menampilkan judul aplikasi di bagian atas layar. 
   Padding → memberi jarak di sekeliling konten agar tidak terlalu rapat dengan tepi layar. 
   SingleChildScrollView → memungkinkan halaman di-scroll ketika kontennya lebih panjang dari ukuran layar. 
   Column → menata widget secara vertikal dari atas ke bawah. 
   Row → menata beberapa widget secara horizontal (samping). 
   Card → menampilkan konten dalam kotak dengan bayangan lembut agar terlihat seperti kartu informasi. 
   Text → menampilkan tulisan seperti judul, label, atau isi kartu. 
   GridView.count → menampilkan beberapa elemen dalam bentuk grid (kotak-kotak sejajar). 
   Material → memberi efek material design seperti bayangan dan ripple effect saat ditekan. 
   InkWell → mendeteksi sentuhan (tap) pada widget dan menampilkan efek klik. 
   Icon → menampilkan ikon sesuai fungsi tombol. 
   SnackBar → menampilkan pesan singkat di bagian bawah layar setelah tombol ditekan.
   SizedBox → memberi jarak antar komponen secara vertikal.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
   MaterialApp berfungsi sebagai wadah utama aplikasi berbasis Material Design. Widget ini mengatur tema warna, font, navigasi antarhalaman, dan pengaturan umum lainnya. MaterialApp sering dijadikan widget root karena menyediakan konteks global untuk seluruh aplikasi, 
   sehingga semua widget di dalamnya bisa mengakses properti seperti tema atau navigator dengan mudah. Tanpa MaterialApp, aplikasi tidak akan bisa menggunakan komponen khas Material Design seperti Scaffold atau AppBar.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
   StatelessWidget adalah widget yang tampilannya bersifat statis, artinya tidak berubah selama aplikasi berjalan. Digunakan untuk elemen yang tidak memerlukan perubahan data atau interaksi kompleks, seperti teks statis, ikon, atau tombol sederhana.
   StatefulWidget adalah widget yang bisa berubah karena memiliki state (keadaan) yang dapat diperbarui. Digunakan untuk elemen yang dinamis, seperti form input, animasi, atau data yang berubah saat pengguna berinteraksi.
   Dalam proyek KickMart Product, digunakan StatelessWidget karena tampilan aplikasi tidak berubah secara dinamis, hanya menampilkan informasi dan menampilkan SnackBar ketika tombol ditekan.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
   BuildContext adalah objek yang menyimpan informasi tentang posisi sebuah widget di dalam widget tree. Objek ini penting karena digunakan untuk mengakses widget lain di atasnya dalam hierarki, seperti mengambil tema (Theme.of(context)), menampilkan SnackBar (ScaffoldMessenger.of(context)), atau berpindah halaman (Navigator.of(context)).
   Di metode build, BuildContext digunakan sebagai parameter agar setiap widget bisa tahu konteksnya sendiri dan berinteraksi dengan elemen lain di pohon widget.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
   Hot reload memungkinkan pengembang memperbarui kode dan langsung melihat perubahan di layar tanpa kehilangan state aplikasi yang sedang berjalan. Ini berguna untuk mempercepat proses pengembangan antarmuka. 
   Hot restart menjalankan ulang seluruh aplikasi dari awal, sehingga semua state akan hilang dan aplikasi dimulai ulang seperti saat pertama kali dijalankan.
   Perbedaannya ada pada penyimpanan state: hot reload mempertahankan, sedangkan hot restart mengatur ulang semuanya.

Jawaban Pertanyaan Tugas 8 :
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. 
   Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
   Di Flutter, Navigator.push() itu kayak kita nambahin halaman baru di atas tumpukan halaman yang sekarang. Halaman lama masih ada di bawahnya, jadi kalau user tekan tombol back (atau Navigator.pop()), dia bisa balik ke halaman sebelumnya. 
   Sementara itu, Navigator.pushReplacement() bakal ganti halaman yang sekarang dengan halaman baru. Artinya, halaman lama “dibuang” dari stack, jadi user nggak bisa balik ke halaman sebelumnya pakai back.
   Di aplikasi Football Shop/KickMart, Navigator.push() cocok dipakai waktu user dari halaman utama mau mengisi form tambah produk. Soalnya setelah tambah produk kan mungkin dia mau balik lagi ke home. 
   Sedangkan Navigator.pushReplacement() lebih pas dipakai di menu drawer (misal pilih “Halaman Utama”), biar halaman nggak numpuk banyak tiap kali dia ganti halaman dari drawer.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
   Scaffold jadi “kerangka” satu halaman: di situ kita taruh appBar: untuk judul halaman, drawer: untuk menu samping, dan body: untuk isi kontennya. 
   Dengan pola ini, semua halaman di aplikasi kita bisa punya tampilan yang konsisten: atasnya ada AppBar “KickMart” , di kiri ada Drawer yang isinya “Halaman Utama” dan “Tambah Produk”, dan isi halamannya beda-beda sesuai fungsinya. 
   Jadi bukan tiap halaman bikin layout dari nol, tapi pakai pola yang sama supaya user nggak bingung.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? 
   Berikan contoh penggunaannya dari aplikasi kamu.
   Padding dipakai supaya elemen form nggak mepet ke pinggir layar, jadi lebih rapi dan terbaca. 
   SingleChildScrollView penting banget kalau form-nya panjang. Kalau layar HP kecil dan keyboard muncul, tanpa scroll form-nya bisa ketutup. Dengan widget ini, user tetap bisa geser ke atas-bawah.
   ListView atau Column + SingleChildScrollView enak buat naro banyak field form secara vertikal.
   Contoh di aplikasi kickmart: di ProductFormPage aku bungkus Form pakai SingleChildScrollView dan di dalamnya ada beberapa Padding yang isinya TextFormField (nama produk, harga, deskripsi, kategori, URL thumbnail, switch featured). 
   Itu bikin form tetap enak di-scroll dan tiap field punya jarak yang proper.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
   kita bisa set warna utama (primary color) di ThemeData pada MaterialApp, misalnya warna biru. 
   Lalu warna itu kita pakai lagi di AppBar, tombol ElevatedButton, dan DrawerHeader. Dengan begitu, user bakal ngerasa semua halaman itu satu aplikasi yang sama, bukan kayak halaman random. 
   Di kode yang aku pakai, AppBar dan DrawerHeader pakai Colors.indigo dan tombol Save di form juga pakai warna yang sama 