import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/product_model.dart';
import '../../../repositories/products/product_repository.dart';
part 'product_detail_controller.g.dart';

enum ProductDetailStateStatus{
  initial,
  loading,
  loaded,
  error,
  errorLoadProduct,
  deleted,
  uploaded,
  saved
}

class ProductDetailController = ProductDetailControllerBase with _$ProductDetailController;

abstract class ProductDetailControllerBase with Store {
  final ProductRepository _productRepository;

  ProductDetailControllerBase(this._productRepository);

  @readonly
  var _status = ProductDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _imagePath;

  @action
  Future<void> uploadImageProduct(Uint8List file, String fileName) async {
    _status = ProductDetailStateStatus.loading;
    _imagePath = await _productRepository.uploadImage(file, fileName);
    _status = ProductDetailStateStatus.uploaded;
  }

  @action
  void save({required String name, required double price, required String description}) {
    try {
      _status = ProductDetailStateStatus.loading;
      final productModel = ProductModel(
        name: name, 
        description: description, 
        price: price, 
        image: _imagePath!,
        enabled: true,
      );      
      _productRepository.save(productModel);
      _status = ProductDetailStateStatus.saved;
    } catch (e, s) {
      log('Erro ao salvar produto...', error: e, stackTrace: s);
      _status = ProductDetailStateStatus.error;
    }
  }
}