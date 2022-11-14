import 'package:flutter/cupertino.dart';

class CategoriesController extends ChangeNotifier {
  double renda = 3000;
  double supermercado = 0;
  double lazer = 0;
  double farmacia = 0;
  double transporte = 0;
  double gastosextras = 0;
  double pagamentos = 0;

  double porncetSupermec() {
    if (supermercado == 0) {
      return 0.0001;
    } else {
      return supermercado = supermercado / renda * 100;
    }
  }

  double porcentFarmac() {
    return farmacia = farmacia / renda * 100;
  }

  double porncetLazer() {
    return lazer = lazer / renda * 100;
  }

  double porncetTranspor() {
    return transporte = transporte / renda * 100;
  }

  double porncetGastosExs() {
    return gastosextras = gastosextras / renda * 100;
  }

  double porncetPagaments() {
    return pagamentos = pagamentos / renda * 100;
  }
}
