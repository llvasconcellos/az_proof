class Utils {
  static String cpfCnpjFormat(String docNumber) {
    var badChars = RegExp(r'/[^\d]/g');
    docNumber = docNumber.replaceAll(badChars, "");
    if (docNumber.length == 11) {
      var mask = RegExp(
          r'(?<First>\d{3})(?<Second>\d{3})(?<Third>\d{3})(?<Digit>\d{2})');
      var matches = mask.firstMatch(docNumber);
      return '${matches?.namedGroup('First')}.${matches?.namedGroup('Second')}.${matches?.namedGroup('Third')}-${matches?.namedGroup('Digit')}';
    } else if (docNumber.length == 14) {
      var mask = RegExp(
          r'(?<First>\d{2})(?<Second>\d{3})(?<Third>\d{3})(?<Forth>\d{4})(?<Digit>\d{2})');
      var matches = mask.firstMatch(docNumber);
      return '${matches?.namedGroup('First')}.${matches?.namedGroup('Second')}.${matches?.namedGroup('Third')}/${matches?.namedGroup('Forth')}-${matches?.namedGroup('Digit')}';
    } else {
      return docNumber;
    }
  }

  static String orderStatusFormat(String input) {
    input = input.toLowerCase();
    switch (input) {
      case 'canceled':
        return 'Cancelado';
      case 'paid':
        return 'Pago';
      case 'pending':
        return 'Pendente';
      default:
        return input;
    }
  }

  static String paymentStatusFormat(String input) {
    input = input.toLowerCase();
    switch (input) {
      case 'succeeded':
        return 'Êxito';
      case 'pending':
        return 'Pendente';
      default:
        return input;
    }
  }

  static String paymentMethodFormat(String input) {
    input = input.toLowerCase();
    switch (input) {
      case 'pix':
        return 'Pix';
      case 'credit':
        return 'Crédito a vista';
      case 'credit_installments':
        return 'Crédito a prazo';
      case 'boleto':
        return 'Boleto';
      default:
        return input;
    }
  }
}
