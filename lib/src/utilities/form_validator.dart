class FormValidator {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? minLength(String? value, int length) {
    if (value == null || value.isEmpty) return null;
    
    if (value.length < length) {
      return 'Must be at least $length characters long';
    }
    return null;
  }

  static String? maxLength(String? value, int length) {
    if (value == null || value.isEmpty) return null;
    
    if (value.length > length) {
      return 'Must be no more than $length characters long';
    }
    return null;
  }

  static String? numeric(String? value) {
    if (value == null || value.isEmpty) return null;
    
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }
} 