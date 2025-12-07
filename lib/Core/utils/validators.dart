class AppRegex {
  static const String gmailPattern =
      r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
}

class Validator {
  static String? validateGmail(String? value) {
    final regex = RegExp(AppRegex.gmailPattern);

    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid Gmail address";
    }

    return null;
  }
}
