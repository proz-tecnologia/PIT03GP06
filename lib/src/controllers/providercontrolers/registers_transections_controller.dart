import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:flutter/cupertino.dart';

class HistoryController extends ChangeNotifier {
  final List<TotalandCategory> registersList = [];

  double saldo = 5000;
  double supermerc = 0;
  double lazer = 0;
  double transpor = 0;
  double gastosex = 0;
  double pagament = 0;
  double farmac = 0;

  addTotaltransection(TotalandCategory trans) {
    registersList.add(trans);
    notifyListeners();
  }

    void removeByID(String id) {
    registersList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  removePorcentChart(String index) {
    var element = registersList.where((element) => element.id == index).first;
        menosValueCategory(element.valor, element.categoryname ?? '');
    }
  double addValueCategory(double result, String categorynames) {
    if (categorynames == 'Supermercado') {
      return supermerc += result;
    } else if (categorynames == 'Lazer') {
      return lazer += result;
    } else if (categorynames == 'Transporte') {
      return transpor += result;
    } else if (categorynames == 'Farmacia') {
      return farmac += result;
    } else if (categorynames == 'Pagamentos') {
      return pagament += result;
    } else {
      return gastosex += result;
    }
  }

  double menosValueCategory(double result, String categorynames) {
    if (categorynames == 'Supermercado') {
      return supermerc -= result;
    } else if (categorynames == 'Lazer') {
      return lazer -= result;
    } else if (categorynames == 'Transporte') {
      return transpor -= result;
    } else if (categorynames == 'Farmacia') {
      return farmac -= result;
    } else if (categorynames == 'Pagamentos') {
      return pagament -= result;
    } else if (categorynames == 'Gastos extras') {
      return gastosex -= result;
    } else {
      return supermerc -= 0;
    }
  }

  double porcentSupermerc(double result) {
    return result = supermerc * 100 / saldo;
  }

  double porcentLazer(double result) {
    return result = lazer * 100 / saldo;
  }

  double porcentTranspor(double result) {
    return result = transpor * 100 / saldo;
  }

  double porcentGastosex(double result) {
    return result = gastosex * 100 / saldo;
  }

  double porcentPagament(double result) {
    return result = pagament * 100 / saldo;
  }

  double porcentFarmac(double result) {
    return result = farmac * 100 / saldo;
  }
}
