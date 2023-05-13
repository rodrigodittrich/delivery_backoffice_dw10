import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deleteProduct(int id) async {
    try {
        await _dio.auth().delete('/products/$id', data: {
          'anabled': false,
        },);
      } on DioError catch (e, s) {
          log('Erro ao deletar produto', error: e, stackTrace: s);
          throw RepositoryException(message: 'Erro ao deletar produto');
      }
  }

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
        final productResult = await _dio.auth().get('/products', 
        queryParameters: {
          if(name != null) 'name': name,
          'enabled': true,
          },
        );
        return productResult.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
      } on DioError catch (e, s) {
          log('Erro ao buscar produtos', error: e, stackTrace: s);
          throw RepositoryException(message: 'Erro ao buscar produtos');
      }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
        final productResult = await _dio.auth().get('/products/$id',);
        return ProductModel.fromMap(productResult.data);
      } on DioError catch (e, s) {
          log('Erro ao buscar produtos', error: e, stackTrace: s);
          throw RepositoryException(message: 'Erro ao buscar produtos');
      }
  }

  @override
  Future<void> save(ProductModel productModel) async {
    try {
      final client = _dio.auth();

      if(productModel.id != null) {
        await client.put(
          '/products/${productModel.id}',
          data: productModel.toMap(),
        );
      } else {
        await client.post(
          '/products/',
          data: productModel.toMap(),
        );
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImage(Uint8List file, String fileName) async {
    try {
      final formData = FormData.fromMap(
        {
        'file': MultipartFile.fromBytes(file, filename: fileName)
        }
      );
      final response = await _dio.auth().post(
        '/uploads',
        data: formData,
      );
      return response.data['url'];
    }  on DioError catch (e, s) {
      log('Erro ao fazer upload da imagem', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao fazer upload da imagem');
    }
  }

}