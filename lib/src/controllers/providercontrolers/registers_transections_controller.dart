import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/view/databases/firestore_database.dart';
import 'package:flutter/cupertino.dart';

class HistoryController extends ChangeNotifier {
  final List<TotalandCategory> registersList = [];
  late FirebaseFirestore datb;
  late UsersService authentinc;

  HistoryController({required this.authentinc}) {
    _initdataFire();
  }

  _initdataFire() async {
    await _firebaserepository();
    //await transactionsread();
  }

  _firebaserepository() {
    datb = FireStoreDb.get();
  }

  final List<TotalandCategory> registerUser = [];

  double valorLimite = 0;
  double renda = 5000;
  double saldoDisponivel = 0;
  double saida = 0;
  double supermerc = 0;
  double lazer = 0;
  double transpor = 0;
  double gastosex = 0;
  double pagament = 0;
  double farmac = 0;
  String nome = "";
  String email = "";
  String senha = "";

  String nomeUser(String user) {
    return nome = user;
  }

  String emailUser(String emailUser) {
    return email = emailUser;
  }

  String senhaUser(String senhaUser) {
    return senha = senhaUser;
  }

  double rendaInicial(double rendaInicial) {
    return renda = rendaInicial;
  }

  addNewUser(TotalandCategory user) {
    registerUser.add(user);
    notifyListeners();
  }

  addTotaltransection(TotalandCategory trans) async {
    await datb
        .collection("usuarios/${authentinc.usuario!.uid}/transacoes")
        .doc(trans.id)
        .set({
      'id': trans.id,
      'date': trans.date,
      'descricao': trans.descri,
      'valor': trans.valor,
      'categoria': trans.categoryname,
      'formapag': trans.formPag,
      //'icone': trans.icon.toString(),
      'tipo': trans.type
    });
    registersList.add(trans);
    notifyListeners();
  }

  Future<void> transactionsread() async {
    if (authentinc.usuario != null && registersList.isEmpty) {
      QuerySnapshot read = await datb
          .collection('usuarios/${authentinc.usuario!.uid}/transacoes')
          .get();
      read.docs.forEach((element) {
        TotalandCategory lista = TotalandCategory(
          id: element.id,
            date: element.get('date'),
            descri: element.get('descricao'),
            formPag: element.get('formapag'),
            categoryname: element.get('categoria'),
            type: element.get('tipo'),
            valor: element.get('valor'));
        registersList.add(lista);
      });
    }
    notifyListeners();
  }

  void removeByID(String id) async {
    await datb
        .collection("usuarios/${authentinc.usuario!.uid}/transacoes")
        .doc(id)
        .delete();
    registersList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  removePorcentChart(String index) {
    var element = registersList.where((element) => element.id == index).first;
    menosValueCategory(element.valor, element.categoryname ?? '');
  }

  double atualizarLimite(double result) {
    return (valorLimite += result) * 100 / renda;
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

  double porcentSaida(double result) {
    return result = (saida * 100 / renda) / 100;
  }

  double porcentAtualizar(double result) {
    return result = saida * 100 / renda;
  }

  double porcentAtualizardisp(double result) {
    return result = renda * 100 / renda;
  }
}
