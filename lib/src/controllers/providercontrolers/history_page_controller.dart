import 'package:ctrl_real/src/model/transections_model.dart';
import 'package:flutter/cupertino.dart';

class HistoryController extends ChangeNotifier {

  final List<Transaction> transactionList = [];
  double saldo = 5000;
  double supermerc = 0;
  double lazer = 0;
  double transpor = 0;
  double gastosex = 0;
  double pagament = 0;
  double farmac = 0;

  setTransAction(Transaction trans) {
    transactionList.add(trans);
    notifyListeners();
  }

  double porcentSupermerc(double result){
    return result = supermerc * 100 / saldo;
  }

  double porcentLazer(double result){
    return result = lazer * 100 / saldo;
  }

  double porcentTranspor(double result){
    return result = transpor * 100 / saldo;
  }
    double porcentGastosex(double result){
    return result = gastosex * 100 / saldo;
  }
    double porcentPagament(double result){
    return result = pagament * 100 / saldo;
  }
    double porcentFarmac(double result){
    return result = farmac * 100 / saldo;
  }

}