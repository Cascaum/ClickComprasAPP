class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName é necessário.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O email é necessário.';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'O email invalido.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'A Senha é necessária.';
    }

    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'A senha deve conter pelo menos um número.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?": {}|<>]'))) {
      return 'A senha deve conter pelo menos um caractere especial.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'O numero de telefone é necessário.';
    }

    // MUDAR QUANTIDADE DE NUMEROS DE TELEFONE
    final phoneRegExp = RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Formato do numero de telefone invalido';
    }
    return null;
  }
}