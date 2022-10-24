import 'package:intl/intl.dart';

extension ExtensionDouble on double {
  String get formatBRL {
    return NumberFormat.currency(
            locale: 'pt_BR', symbol: "R\$", decimalDigits: 2)
        .format(this);
  }
}
