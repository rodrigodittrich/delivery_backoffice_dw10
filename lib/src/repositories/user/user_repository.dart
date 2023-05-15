import '../../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getbyId(int id);
}