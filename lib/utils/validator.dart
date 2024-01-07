class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }
    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$');

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 8) {
      return 'Enter a password with a length of at least 6';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'Enter a correct password';
    }
    return null;
  }

  static String? validateNrp({required String? nrp}) {
    if (nrp == null) {
      return null;
    }

    RegExp nrpRegExp = RegExp(r'^[0-9]+$');

    if (nrp.isEmpty) {
      return 'NRP can\'t be empty';
    } else if (nrp.length < 9) {
      return 'Enter a nrp with a length of at least 6';
    } else if (!nrpRegExp.hasMatch(nrp)) {
      return 'Enter a correct nrp';
    }
    return null;
  }
}
