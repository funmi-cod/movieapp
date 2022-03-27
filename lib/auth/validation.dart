class Validator {
  // Email validation
  static String? validateEmail({required String email}) {
<<<<<<< HEAD
    // if (email == null) {
    //   return null;
    // }
=======
    if (email == null) {
      return null;
    }
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  // Password validation
  static String? validatePassword({required String password}) {
<<<<<<< HEAD
    // if (password == null) {
    //   return null;
    // }
=======
    if (password == null) {
      return null;
    }
>>>>>>> 05b53130005a2696f02749b48478b846a35509d6
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}