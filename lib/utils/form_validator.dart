class FormValidator {
  FormValidator._();

  static String? isValidName(String? value) {
    final name = value ?? '';
    if (name.trim().length < 2) {
      return 'Name must be more than 2 characters!';
    }
    return null;
  }

  static String? isValidEmail(String? value) {
    final email = value ?? '';
    RegExp emailRE = RegExp(r'^[\w-\.]+@[\w-\.]+\.[a-z]{2,3}$');
    if (!emailRE.hasMatch(email)) {
      return 'Enter with a valid email address';
    }
    return null;
  }

  static String? isValidPassword(String? value) {
    final password = value ?? '';
    if (password.trim().length < 3) {
      return 'Yout password must be more than 3 characters!';
    }
    return null;
  }
}
