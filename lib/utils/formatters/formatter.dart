import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Remove caracteres não numéricos
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 11) {
      // Formato para celular com 11 dígitos: (XX) XXXXX-XXXX
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 10) {
      // Formato para telefone fixo com 10 dígitos: (XX) XXXX-XXXX
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
    }
    // Se o número não tiver 10 ou 11 dígitos, retorna como está
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove caracteres não numéricos
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length < 10) {
      // Retorna como está se o número for muito curto
      return phoneNumber;
    }

    // Define o código do país (assume +55 como padrão para brasileiros)
    String countryCode = '+55';

    // Ajusta se o número já começar com o código internacional
    if (phoneNumber.startsWith('55')) {
      countryCode = '+${phoneNumber.substring(0, 2)}';
      phoneNumber = phoneNumber.substring(2);
    }

    // Formata o número no padrão internacional
    if (phoneNumber.length == 11) {
      return '$countryCode (${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 10) {
      return '$countryCode (${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
    }

    // Retorna o número não formatado caso não seja 10 ou 11 dígitos
    return phoneNumber;
  }
}
