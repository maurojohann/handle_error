import 'dart:async';

import 'package:dio/dio.dart';
import 'package:erros_handle/feature/data/models/user_data_models.dart';
import 'package:erros_handle/feature/domain/entities/user_entity.dart';
import 'package:erros_handle/feature/domain/repositories/user_data_repository.dart';

import '../../domain/errors/user_data_failure.dart';
import '../datasources/user_data_sources_impl.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  UserDataSourcesimpl fetchRemoteUserData = UserDataSourcesimpl();
  @override
  Future<UserEntity> fetchUserData() async {
    return fetchRemoteUserData.fecthUserData();
  }
}
