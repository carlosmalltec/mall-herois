import 'package:flutter/widgets.dart'
    show FormFieldValidator, TextEditingController;

class AppValidators {
  AppValidators._();

  static FormFieldValidator required({String m = 'campo obrigatório'}) {
    return (v) {
      if (v?.isEmpty ?? true) return m;
      return null;
    };
  }

  static FormFieldValidator<String> min(int min,
      {String m = 'valor informado é menor que'}) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) < min) return m;
      return null;
    };
  }

  static FormFieldValidator<String> max(int max,
      {String m = 'valor informado é maior que'}) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) > max) return m;
      return null;
    };
  }

  static FormFieldValidator<String> between(
    int minimumLength,
    int maximumLength,
    String errorMessage,
  ) {
    assert(minimumLength < maximumLength);
    return multiple([
      min(minimumLength, m: errorMessage),
      max(maximumLength, m: errorMessage),
    ]);
  }

  static FormFieldValidator<String> multiple(
      List<FormFieldValidator<String>> v) {
    return (value) {
      for (final validator in v) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> date(String errorMessage) {
    return (value) {
      final date = DateTime.tryParse(value ?? '');
      if (date == null) {
        return errorMessage;
      }
      return null;
    };
  }

  static FormFieldValidator<String> compare(
      TextEditingController? controller, String message) {
    return (value) {
      final textCompare = controller?.text ?? '';
      if (value == null || textCompare != value) {
        return message;
      }
      return null;
    };
  }
}
