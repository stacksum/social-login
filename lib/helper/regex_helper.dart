

class RegExHelper {
  static final RegExHelper _singleton = RegExHelper._internal();

  factory RegExHelper() {
    return _singleton;
  }

  RegExHelper._internal();

  bool isValidEmail(String email) {
    String emailRegEx =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (email.isEmpty) {
      return false;
    } else if (RegExp(emailRegEx).hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool isValidPassword(String password) {
    String passwordRegEx =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (password.isEmpty) {
      return false;
    } else if (RegExp(passwordRegEx).hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

}
