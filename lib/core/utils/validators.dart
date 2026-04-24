class AppValidators {
  AppValidators._();

  static String? validateEmail({required String? email}) {
    if (email == null || email.trim().isEmpty) {
      return 'this field is required';
    }

    final bool isValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{3}",
    ).hasMatch(email);

    if (!isValid) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.trim().isEmpty) {
      return 'enter password';
    }
    return null;
  }

  static String? validateNationalId({required String? id}) {
    if (id == null || id.trim().isEmpty) {
      return 'enter id';
    }

    final trimmed = id.trim();

    // لازم أرقام فقط
    final isNumeric = RegExp(r'^[0-9]+$').hasMatch(trimmed);
    if (!isNumeric) {
      return 'id must contain numbers only';
    }

    if (trimmed.length != 14) {
      return 'id must be 14 digits';
    }

    return null;
  }

  static String? validateRegisterPassword({required String? password}) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
    );

    if (password == null || password.isEmpty) {
      return 'enter password';
    } else if (password.length < 6) {
      return 'must be at least 6 characters';
    } else if (!passwordRegex.hasMatch(password.trim())) {
      return 'must have at least one non alphanumeric character, and at least one digit';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword({
    required String? password,
    required String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'this field is required';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateUserName({required String? userName}) {
    if (userName == null || userName.isEmpty) {
      return 'enter userName';
    }
    return null;
  }

  // static String? validateUserName({required String? userName}) {
  //   final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,16}$');

  //   if (userName == null || userName.isEmpty) {
  //     return 'this field is required';
  //   } else if (!usernameRegExp.hasMatch(userName)) {
  //     return 'Invalid username (3-16 chars, alphanumeric, underscore)';
  //   } else {
  //     return null;
  //   }
  // }

  static String? validateFullName({required String? fullName}) {
    if (fullName == null || fullName.isEmpty) {
      return 'enter fullName';
    }

    // Custom logic: check for only valid characters and a minimum number of words (optional)
    List<String> words = fullName.trim().split(' ');
    if (words.length < 2) {
      return 'Please enter both first and last name';
    }

    for (String word in words) {
      if (word.length < 2) {
        // Ensure each word has at least 2 characters
        return 'Each name part must be at least 2 characters';
      }
      // Check if the word contains only letters (basic check)
      if (!RegExp(r"^[a-zA-Z]+$").hasMatch(word)) {
        // This basic check might be too restrictive for international names.
        // Use the regex from Method 1 for broader support.
        return 'Invalid characters found in name';
      }
    }

    return null; // The input is valid
  }

  static String? validateMobileNumber({required String? mobileNumber}) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (mobileNumber == null || mobileNumber.isEmpty) {
      return 'this field is required';
    } else if (!regExp.hasMatch(mobileNumber)) {
      return 'Enter a valid mobile number';
    } else if (mobileNumber.length != 11) {
      return 'phone number must be 11 digits';
    } else {
      return null;
    }
  }
}
