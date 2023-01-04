import 'package:bloc/bloc.dart';
import 'package:erros_handle/core/error/failure.dart';
import 'package:erros_handle/feature/data/repositories/user_data_repository_impl.dart';
import 'package:erros_handle/feature/domain/entities/user_entity.dart';
import 'package:erros_handle/feature/domain/repositories/user_data_repository.dart';
import 'package:erros_handle/feature/domain/use_cases/fetch_user_data.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static UserDataRepository userDataRepository = UserDataRepositoryImpl();
  final FetchUserDataUseCases _fetchUserData = FetchUserDataUseCases(userDataRepository);
  HomeCubit() : super(HomeInitial());

  void getUserData() async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 1));
      UserEntity user = await _fetchUserData();
      emit(HomeLoadedState(user: user));
    } on Failure {
      emit(HomeErrorState('user: user'));
    } catch (e) {
      emit(HomeErrorState('user: user'));
      throw UnknownError(label: 'HomeCubit.getUserData()', message: e);
    }
  }
}
