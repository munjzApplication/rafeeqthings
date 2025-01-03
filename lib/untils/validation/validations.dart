class FormFieldValidations {
  static bool isValidEmail(String value) {
    final emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegExp.hasMatch(value);
  }

  static bool isValidame(String value) {
    final nameRegExp = RegExp(r'^[a-zA-Z]+$');

    return nameRegExp.hasMatch(value);
  }

  static bool isValidUserName(String value) {
    final nameRegExp = RegExp(r'^[a-zA-Z\u0600-\u06FF ]+$');

    return nameRegExp.hasMatch(value);
  }
}
