import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:flutter/cupertino.dart';

class HistoryController extends ChangeNotifier {
  final List<TotalandCategory> registersList = [];

  double renda = 0;
  double saldoDisponivel = 0;
  double saida = 0;
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

  double novaRenda(double result) {
    return renda += result;
  }

  double novoSaldoEntrada(double result) {
    return saldoDisponivel += result;
  }

  double novoSaldoSaida(double result) {
    return saldoDisponivel -= result;
  }

  double totalSaida(double result) {
    return saida += result;
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
    return result = supermerc * 100 / renda;
  }

  double porcentLazer(double result) {
    return result = lazer * 100 / renda;
  }

  double porcentTranspor(double result) {
    return result = transpor * 100 / renda;
  }

  double porcentGastosex(double result) {
    return result = gastosex * 100 / renda;
  }

  double porcentPagament(double result) {
    return result = pagament * 100 / renda;
  }

  double porcentFarmac(double result) {
    return result = farmac * 100 / renda;
  }
}
