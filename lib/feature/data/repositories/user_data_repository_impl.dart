import 'dart:async';

import 'package:dio/dio.dart';
import 'package:erros_handle/feature/data/models/user_data_models.dart';
import 'package:erros_handle/feature/domain/entities/user_entity.dart';
import 'package:erros_handle/feature/domain/repositories/user_data_repository.dart';

import '../../domain/errors/user_data_failure.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  UserDataSources fetchRemoteUserData = UserDataSources();
  @override
  Future<UserEntity> fetchUserData() async {
    return fetchRemoteUserData.fecthUserData();
  }
}

class UserDataSources {
  final Dio dio = Dio();
  FutureOr<UserDataModels> fecthUserData() async {
    return await dio.get('https://jsonplaceholder.typicode.com/todo/1').then((response) {
      return UserDataModels.fromJson(response.data);
    }).onError<DioError>((e, s) {
      throw FetchUserDataFailure(
        label: 'UserDataSources.fecthUserData()',
        errorMessage: e,
      );
    });
  }
}
