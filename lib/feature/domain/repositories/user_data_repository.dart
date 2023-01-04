import '../entities/user_entity.dart';

abstract class UserDataRepository {
  Future<UserEntity> fetchUserData();
}