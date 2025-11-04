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