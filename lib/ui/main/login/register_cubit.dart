import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/ui/main/login/register_state.dart';

import '../../../repo/auth/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.repo}) : super(RegisterInitialState());
  final RegisterRepo repo;

  void registration(
      {required String email,
      required String password,
      required String nickname}) async {
    try {
      emit(RegisterLoading());
      await repo.registerService(
          email: email, password: password, nickname: nickname);
      emit(RegisterLoaded());
    } catch (e) {
      emit(RegisterError());
    }
  }
}
