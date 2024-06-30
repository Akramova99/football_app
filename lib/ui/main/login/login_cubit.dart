

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repo/auth/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginPageState> {
  LoginCubit( {required this.repo}):super(InitialState()) ;
  final LoginRepo repo;

  void logintoPlatform(String email, String password) async {
    try {
      emit(Loading());
      await repo.login(email, password);
      emit(Loaded());

    } catch (e) {
      emit(Error());
    }
  }
}
