
import 'package:flutter/material.dart';
import '../../../../core/dummy_data.dart';
import 'categoryModel.dart';

class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  CategoryModel? category;
  List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  Product toProduct() {
    String img = '';
    if (images != null && images!.isNotEmpty) {
      img = images!.first.replaceAll(RegExp(r'[\[\]"]'), '').trim();
    }
    if (img.isEmpty || !img.startsWith('http')) {
      img = 'https://picsum.photos/seed/${id ?? 1}/300/300';
    }
    return Product(
      id: id?.toString() ?? '',
      name: title ?? '',
      description: description ?? '',
      price: (price ?? 0).toDouble(),
      imageUrl: img,
      colors: const [Colors.black, Colors.blue, Colors.grey],
      sizes: const ['S', 'M', 'L', 'XL'],
    );
  }
}
