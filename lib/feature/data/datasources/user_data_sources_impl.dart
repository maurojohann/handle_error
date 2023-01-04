import 'dart:async';

import 'package:dio/dio.dart';

import '../../domain/errors/user_data_failure.dart';
import '../models/user_data_models.dart';

class UserDataSourcesimpl implements UserDataSources {
  final Dio dio = Dio();

  @override
  FutureOr<UserDataModels> fecthUserData() async {
    return await dio.get('https://jsonplaceholder.typicode.com/todo/1').then((response) {
      return UserDataModels.fromJson(response.data);
    }).onError<DioError>((e, s) {
      throw FetchUserDataFailure(
        label: 'UserDataSourcesImpl.fecthUserData()',
        errorMessage: e,
      );
    });
  }
}

abstract class UserDataSources {
  FutureOr<UserDataModels> fecthUserData();
}
