import 'package:erros_handle/feature/domain/entities/user_entity.dart';

import '../repositories/user_data_repository.dart';

class FetchUserDataUseCases {
  final UserDataRepository repository;

  FetchUserDataUseCases(this.repository);
  Future<UserEntity> call() async {
    return await repository.fetchUserData();
  }
}
