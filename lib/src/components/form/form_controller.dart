class BootstrapFormController {
  final Map<String, dynamic> _values = {};
  final Map<String, String?> _errors = {};

  void setValue(String name, dynamic value) {
    _values[name] = value;
  }

  dynamic getValue(String name) {
    return _values[name];
  }

  void setError(String name, String? error) {
    _errors[name] = error;
  }

  String? getError(String name) {
    return _errors[name];
  }

  bool validate() {
    return !_errors.values.any((error) => error != null);
  }

  Map<String, dynamic> getValues() {
    return Map.from(_values);
  }

  void reset() {
    _values.clear();
    _errors.clear();
  }
} 