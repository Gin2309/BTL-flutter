// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  Future<void> _addProduct() async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': _titleController.text,
        'price': _priceController.text,
        'description': _descriptionController.text,
        'image': _imageController.text,
        'category': _categoryController.text,
      },
    );

    if (response.statusCode == 200) {
      // Xử lý khi thêm sản phẩm thành công
      print('Sản phẩm mới đã được thêm thành công!');
    } else {
      // Xử lý khi có lỗi xảy ra
      print('Đã xảy ra lỗi khi thêm sản phẩm.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm Sản Phẩm Mới'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Tên Sản Phẩm'),
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Giá'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Mô Tả'),
            ),
            TextFormField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Link Ảnh'),
            ),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Danh Mục'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text('Thêm Sản Phẩm'),
            ),
          ],
        ),
      ),
    );
  }
}
