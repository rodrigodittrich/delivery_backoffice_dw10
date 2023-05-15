import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/user_model.dart';
import './user_repository.dart' show UserRepository;

class UserRepositoryImpl implements UserRepository {
  final CustomDio _dio;

  UserRepositoryImpl(this._dio);

  @override
  Future<UserModel> getbyId(int id) async {
    try {
        final orderResponse = await _dio.auth().get('/users/$id');
        return UserModel.fromMap(orderResponse.data);
      } on DioError catch (e, s) {
      log('Erro ao buscar usuario', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar usuario');
    }
  }

}