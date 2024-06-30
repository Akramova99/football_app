import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/hive_service/selection_section.dart';
import '../../utils/list/lists.dart';

class TCubit extends Cubit<int> {
  TCubit() : super(0);

  void check() async {
    var s = await PrefSection.getSection() ?? teamSection[0];
    if (s == teamSection[1]) {
      emit(1);
    } else if (s == teamSection[2]) {
      emit(2);
    } else if (s == teamSection[3]) {
      emit(3);
    }
  }
}
