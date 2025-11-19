import 'package:flutter/material.dart';
import 'package:kickmart_product/screens/productlist_form.dart';
import 'package:kickmart_product/screens/product_entry_list.dart';
import 'package:kickmart_product/screens/login.dart'; // <- untuk redirect ke login
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// Kelas data untuk item di homepage
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

// Widget kartu menu di halaman utama
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); // <- ambil CookieRequest

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          // munculkan SnackBar interaktif
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!"),
              ),
            );

          // Create Product -> navigasi ke form tambah produk
          if (item.name == "Create Product" || item.name == "Tambah Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          }

          // All Products / See Products -> navigasi ke daftar semua produk
          else if (item.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(),
              ),
            );
          }

          // My Products -> untuk sekarang juga arahkan ke daftar produk yang sama
          // nanti kalau sudah punya endpoint /json/my-products/ bisa dibuat page khusus
          else if (item.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(),
              ),
            );
          }

          // Logout
          else if (item.name == "Logout") {
            // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
            // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
            // If you using chrome,  use URL http://localhost:8000
            final response = await request.logout(
              "http://localhost:8000/auth/logout/",
            );
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$message See you again, $uname."),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 5),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
