import 'package:flutter/material.dart';
import 'package:kickmart_product/models/product_entry.dart';
import 'package:kickmart_product/screens/menu.dart'; // <-- WAJIB TAMBAH

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final fields = product.fields;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fields.thumbnail.isNotEmpty)
              Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(fields.thumbnail)}',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if (fields.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'FEATURED',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const SizedBox(height: 12),

                  Text(
                    fields.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Chip(
                    label: Text(
                      fields.category,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.indigo.shade100,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Rp ${fields.price}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Stock: ${fields.stock}",
                    style: TextStyle(
                      color: fields.stock > 0 ? Colors.black : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Divider(height: 32),

                  _buildDetailRow("Brand", fields.brand),
                  _buildDetailRow("Size", fields.size),
                  _buildDetailRow("Color", fields.color),
                  _buildDetailRow("League", fields.league),
                  _buildDetailRow("Club", fields.club),
                  _buildDetailRow("Rating", fields.rating),

                  const Divider(height: 32),

                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    fields.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 30),

                  // === BACK BUTTON ===
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Back to Home",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}