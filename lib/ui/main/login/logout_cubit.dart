
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repo/auth/logout_repo.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState>{
  LogoutCubit( {required this.repo}):super(InitialLogout()) ;
  final LogoutRepo repo;
  void logoutPlatform() async {
    try {
      emit(LoadingLogout());
      await repo.logout();
      emit(LoadedLogout());

    } catch (e) {
      emit(LogoutError());
    }
  }

}