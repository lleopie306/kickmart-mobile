import 'package:flutter/material.dart';
import 'package:kickmart_product/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:kickmart_product/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();

  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _leagueController = TextEditingController();
  final TextEditingController _clubController = TextEditingController();

  String _selectedCategory = "Shoes";
  bool _isFeatured = false;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _stockController.dispose();
    _brandController.dispose();
    _ratingController.dispose();
    _sizeController.dispose();
    _colorController.dispose();
    _leagueController.dispose();
    _clubController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // === PRODUCT NAME ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Product name cannot be empty!";
                    }
                    if (value.length < 3) {
                      return "Product name must be at least 3 characters!";
                    }
                    return null;
                  },
                ),
              ),

              // === PRICE ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be a number!";
                    }
                    if (int.parse(value) <= 0) {
                      return "Price must be greater than zero!";
                    }
                    return null;
                  },
                ),
              ),

              // === DESCRIPTION ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === CATEGORY ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCategory,
                  items: const [
                    DropdownMenuItem(value: "Shoes", child: Text("Shoes")),
                    DropdownMenuItem(value: "Jersey", child: Text("Jersey")),
                    DropdownMenuItem(value: "Equipment", child: Text("Equipment")),
                    DropdownMenuItem(value: "Other", child: Text("Other")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value! as String;
                    });
                  },
                ),
              ),

              // === THUMBNAIL URL ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _thumbnailController,
                  decoration: const InputDecoration(
                    hintText: "Thumbnail URL",
                    labelText: "Thumbnail URL",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Thumbnail URL cannot be empty!";
                    }
                    final uri = Uri.tryParse(value);
                    if (uri == null ||
                        !uri.isAbsolute ||
                        (!value.startsWith("http://") &&
                            !value.startsWith("https://"))) {
                      return "Invalid URL format!";
                    }
                    return null;
                  },
                ),
              ),

              // === STOCK ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _stockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === BRAND ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _brandController,
                  decoration: const InputDecoration(
                    hintText: "Brand",
                    labelText: "Brand",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === SIZE ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _sizeController,
                  decoration: const InputDecoration(
                    hintText: "Size",
                    labelText: "Size",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === COLOR ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _colorController,
                  decoration: const InputDecoration(
                    hintText: "Color",
                    labelText: "Color",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === CLUB ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _clubController,
                  decoration: const InputDecoration(
                    hintText: "Club",
                    labelText: "Club",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === LEAGUE ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _leagueController,
                  decoration: const InputDecoration(
                    hintText: "League",
                    labelText: "League",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === RATING ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _ratingController,
                  decoration: const InputDecoration(
                    hintText: "Rating (1–5)",
                    labelText: "Rating (1–5)",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // === FEATURED SWITCH ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SwitchListTile(
                  title: const Text("Mark as Featured Product"),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),

              // === SAVE BUTTON ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "http://localhost:8000/create-flutter/",
                        jsonEncode({
                          "name": _nameController.text,
                          "price": int.parse(_priceController.text),
                          "description": _descriptionController.text,
                          "thumbnail": _thumbnailController.text,
                          "category": _selectedCategory,
                          "is_featured": _isFeatured,
                          "stock": int.tryParse(_stockController.text) ?? 0,
                          "brand": _brandController.text,
                          "rating": _ratingController.text,
                          "size": _sizeController.text,
                          "color": _colorController.text,
                          "league": _leagueController.text,
                          "club": _clubController.text,
                        }),
                      );

                      if (!context.mounted) return;

                      if (response["status"] == "success") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product successfully saved!"),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Something went wrong, please try again."),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 12),

              // === BACK BUTTON ===
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}