import 'dart:typed_data';

import '../../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll(String? name);
  Future<ProductModel> getProduct(int id);
  Future<void> save(ProductModel productModel);
  Future<String> uploadImage(Uint8List file, String fileName);
  Future<void> deleteProduct(int id);
}