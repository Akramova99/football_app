import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../flutter_toast.dart';

class HiveService {
  static var myBox = Hive.box('email_password');

  static storedInfo(
      {required String emailValue, required String passwordValue}) {
    myBox.put('email', emailValue);
    myBox.put('password', passwordValue);

    showToast("password and email saved successfully");
  }

  /// it is coded, that is, encrypted

  static bool getEmailPassword(
      {required String emailKey, required String passwordKey}) {
    var getEmail = myBox.get(emailKey);
    var getPassword = myBox.get(passwordKey);
    Logger().i(getEmail.toString());
    Logger().i(getPassword.toString());
    bool isCheck = getPassword != null && getEmail != null;

    /// kodlangan ya'ni shriflangan holda bo'ladi /// it is coded, that is, encrypted
    return isCheck;
  }

  static deleteInfo({required String emailKey, required String passwordKey}) {
    myBox.delete(emailKey);
    myBox.delete(passwordKey);
    return showToast("Deleted successfully");
  }
}
