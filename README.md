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

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memil iki identitas visual yang konsisten dengan brand toko?
   kita bisa set warna utama (primary color) di ThemeData pada MaterialApp, misalnya warna biru. 
   Lalu warna itu kita pakai lagi di AppBar, tombol ElevatedButton, dan DrawerHeader. Dengan begitu, user bakal ngerasa semua halaman itu satu aplikasi yang sama, bukan kayak halaman random. 
   Di kode yang aku pakai, AppBar dan DrawerHeader pakai Colors.indigo dan tombol Save di form juga pakai warna yang sama 

Jawaban Pertanyaan Tugas 9 :
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
   Pembuatan model Dart diperlukan karena model nya ini tuh memberikan struktur data yang lebih rapi, aman, dan mudah dijaga. 
   Dengan model, setiap atribut memiliki tipe yang jelas sehingga kesalahan seperti tipe data yang tidak sesuai, nilai yang null secara tidak terduga, atau kesalahan penulisan key dapat terdeteksi lebih awal sebelum aplikasi dijalankan. 
   Kalo kita hanya memakai Map<String, dynamic> tanpa model, seluruh nilai akan bersifat dinamis dan tidak ada jaminan tipe data, sehingga biasanya rawan menimbulkan error di waktu runtime. 
   Selain itu, kode menjadi kurang terstruktur dan sulit di-maintain, karena akses data tersebar di banyak tempat tanpa validasi tipe yang kuat. 
   Nah menggunakan model menjadikan proses parsing lebih konsisten, mendukung null-safety, dan mempermudah pengembangan jangka panjang.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
   Package http berfungsi sebagai alat dasar untuk melakukan request HTTP seperti GET atau POST yang tidak memerlukan autentikasi khusus. Sementara itu, 
   CookieRequest dirancang untuk berinteraksi dengan Django, terutama karena dia dapat menyimpan dan mengirim kembali session cookie secara otomatis. 
   Dengan demikian, http ini biasanya lebih cocok untuk permintaan biasa yang tidak membutuhkan status login, sedangkan CookieRequest digunakan untuk endpoint yang membutuhkan autentikasi, seperti login, logout, atau data yang hanya boleh diakses oleh pengguna yang telah memiliki sesi. 
   Perbedaan utama keduanya terletak pada penanganan cookie: http bersifat stateless, sedangkan CookieRequest menjaga sesi agar permintaan dari Flutter dapat dikenali oleh Django sebagai pengguna yang sama.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
   Satu instance CookieRequest ini harus dibagikan ke seluruh komponen karena instancenya tersebut menyimpan session cookie hasil autentikasi Django. Cookie ini bisa jadi tanda bahwa pengguna telah login dan harus dikirim setiap kali Flutter melakukan request ke backend. 
   Jika setiap halaman membuat instance CookieRequest baru, maka cookie yang disimpan tidak akan terbawa, dan Django akan menganggap pengguna belum login meskipun sebelumnya sudah berhasil masuk. 
   Dengan menggunakan provider untuk mendistribusikan instance yang sama ke seluruh widget, status autentikasi pengguna akan konsisten dan tidak hilang saat aplikasi berpindah halaman.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android?
   Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
   Agar aplikasi Flutter dapat terhubung dengan Django, beberapa konfigurasi penting harus disesuaikan. Penambahan 10.0.2.2 pada ALLOWED_HOSTS diperlukan karena Android emulator mengakses komputer host melalui alamat tersebut, sehingga Django harus mengizinkan host tersebut untuk menghindari error DisallowedHost. 
   Pengaktifan CORS juga penting supaya permintaan dari aplikasi Flutter diizinkan oleh Django, terutama saat aplikasi berjalan pada origin yang berbeda. Selain itu, pengaturan cookie dan SameSite harus disesuaikan agar session cookie dapat dikirim dan dibaca dengan benar. 
   Di sisi Android, izin internet permission wajib ditambahkan agar Flutter dapat mengakses jaringan. Kalo konfigurasi nya tidak dilakukan, request dari Flutter dapat diblokir, cookie tidak akan terkirim, atau aplikasi gagal mengakses Django sehingga login dan pengambilan data tidak dapat berjalan dengan semestinya.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
   Mekanisme pengiriman data dimulai ketika pengguna mengisi form pada Flutter. Data input tersebut kemudian dikumpulkan dan dikirim ke Django menggunakan request HTTP melalui http atau CookieRequest. 
   Django menerima data tersebut, memproses dan memvalidasi input, lalu menyimpannya ke dalam basis data. Setelah proses selesai, Django mengembalikan respons dalam bentuk JSON yang berisi informasi hasil penyimpanan maupun pesan error jika validasi gagal. 
   Flutter kemudian menerima JSON tersebut, melakukan decoding, dan mengubahnya menjadi objek model. Data yang telah diproses ini ditampilkan kembali melalui UI, sehingga pengguna dapat melihat hasil input secara langsung di aplikasi.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
   Pada proses registrasi, Flutter mengirimkan data akun seperti username, email, dan password ke Django untuk diverifikasi dan disimpan sebagai akun baru. Setelah registrasi berhasil, pengguna dapat melakukan login dengan memasukkan username dan password di Flutter. 
   Data login ini dikirim melalui CookieRequest, dan Django akan memeriksa kecocokan kredensial menggunakan sistem autentikasinya. Jika berhasil, Django membuat session baru dan mengirim session cookie kembali ke Flutter. 
   Cookie ini disimpan dalam instance CookieRequest, sehingga setiap request berikutnya akan dikenali sebagai permintaan dari pengguna yang sudah login. Setelah autentikasi berhasil, Flutter menampilkan halaman menu atau fitur yang memerlukan login. 
   Ketika pengguna melakukan logout, Flutter mengirim permintaan logout ke Django, Django menghapus sesi, dan CookieRequest menghapus cookie lokal, sehingga status pengguna kembali menjadi tidak login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
   Pertama, saya bereskan dulu sisi Django. Saya buat app authentication, menginstal beberapa paket yang diminta seperti django-cors-headers, python-dotenv, requests, dan whitenoise ke dalam virtual environment proyek. Setelah itu saya update settings.py: menambahkan authentication dan corsheaders ke INSTALLED_APPS, mendaftarkan CorsMiddleware dan WhiteNoiseMiddleware di MIDDLEWARE, mengatur ALLOWED_HOSTS, CSRF_TRUSTED_ORIGINS, dan opsi CORS supaya backend boleh diakses dari Flutter, serta mengatur konfigurasi database dan STATICFILES sesuai template PBP. Saya juga mengimpor dan memanggil load_dotenv() untuk membaca variabel lingkungan dari file .env.
   Berikutnya saya implementasi endpoint yang dibutuhkan. Di app utama saya buat view untuk mengembalikan data produk dalam bentuk JSON (show_json) dan view create_product_flutter yang menerima request POST dari Flutter. Di view ini saya parsing request.body pakai json.loads, mengambil field seperti name, price, description, thumbnail, category, serta field tambahan yang saya butuhkan (stock, brand, rating, size, color, league, club), lalu membuat instance model Product dan menyimpannya ke database. Saya juga buat route di urls.py dengan path('create-flutter/', create_product_flutter, ...) dan endpoint /json/ untuk list produk, plus satu view proxy gambar (proxy_image) supaya Flutter bisa menampilkan thumbnail dari URL eksternal melalui backend Django. Semua URL ini saya tes dulu di browser/Postman sebelum disambungkan ke Flutter.
   Setelah backend beres, saya pindah ke sisi Flutter. Di pubspec.yaml saya menambahkan dependency pbp_django_auth dan provider. Di main.dart saya bungkus MaterialApp dengan Provider<CookieRequest> sehingga di semua widget saya bisa akses CookieRequest lewat context.watch<CookieRequest>(). Lalu saya buat halaman login.dart dan register.dart sendiri: form login akan memanggil request.login("http://localhost:8000/auth/login/", {...}) dan kalau sukses, saya tampilkan SnackBar lalu pindah ke MyHomePage; halaman register memakai request.postJson("/auth/register/") dan setelah status success juga diarahkan ke login. Di item_card.dart saya sambungkan kartunya dengan logika navigasi: tombol “Create Product” membuka ProductFormPage, tombol “See Products” membuka ProductEntryListPage, dan tombol “Logout” memanggil request.logout("http://localhost:8000/auth/logout/") lalu kembali ke LoginPage.
   Untuk form produk, saya tidak pakai contoh yang paling minimal di tutorial, tapi saya sesuaikan dengan field yang ada di website KickMart. Di productlist_form.dart saya definisikan banyak TextEditingController (name, price, description, thumbnail, stock, brand, rating, size, color, league, club), plus DropdownButtonFormField untuk kategori dan SwitchListTile untuk status featured. Di tombol Save, saya tulis sendiri logika validasi (wajib isi, angka harus > 0, URL harus mulai dengan http/https) lalu memanggil request.postJson("http://localhost:8000/create-flutter/", jsonEncode({...})) dengan semua field tersebut. Kalau responsenya status == "success", saya tampilkan pesan “Product successfully saved!” dan melakukan Navigator.pushReplacement ke MyHomePage; kalau gagal, saya tampilkan SnackBar error. Label dan teks form sengaja saya ubah ke bahasa Inggris supaya konsisten dengan tampilan website.
   Terakhir, saya buat model dan tampilan list/detail produk. Saya generate product_entry.dart dari contoh JSON backend, lalu di product_entry_list.dart saya buat fungsi fetchProducts yang memanggil request.get("http://localhost:8000/json/") dan mengubahnya menjadi list ProductEntry. Halaman ini menggunakan FutureBuilder dan menampilkan setiap produk dengan ProductEntryCard yang saya desain sendiri (image lewat /proxy-image/, nama, kategori, harga, sedikit deskripsi, indikator stok, dan badge “Featured”). Saat kartu ditekan, saya arahkan ke ProductDetailPage yang menampilkan detail lengkap dan tombol “Back to Home” yang melakukan Navigator.pushReplacement ke MyHomePage. Di sisi Android, saya juga menambahkan permission <uses-permission android:name="android.permission.INTERNET" /> di AndroidManifest.xml agar aplikasi bisa memanggil backend. Sepanjang proses ini saya beberapa kali memperbaiki error (misalnya ModuleNotFoundError untuk dotenv, corsheaders, whitenoise, dan error tipe di model Flutter), jadi implementasinya benar-benar saya sesuaikan dengan struktur proyek saya, bukan sekadar copy–paste dari tutorial.