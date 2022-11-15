import 'package:ctrl_real/src/model/transections_model.dart';
import 'package:flutter/cupertino.dart';

class HistoryController extends ChangeNotifier {
  final List<Transaction> transactionList = [];
  double saldo = 10000;
  double supermerc = 0;
  double lazer = 0;
  double transpor = 0;
  double gastosex = 0;
  double pagament = 0;
  double farmac = 0;

  void setTransAction(Transaction trans) {
    transactionList.add(trans);
    notifyListeners();
  }

}
