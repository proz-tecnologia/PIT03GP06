import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/repositories/firestore_repository.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/database/firestore_database.dart';
import 'package:flutter/cupertino.dart';

class TransactionsController extends ChangeNotifier {
  List<TotalandCategory> registersList = [];
  late FirebaseFirestore datb;
  final FirestoreRepository firestore = FirestoreRepository();
  late UsersService authentinc;

  TransactionsController({required this.authentinc}) {
    _initdataFire();
  }

  _initdataFire() async {
    await _firebaserepository();
  }

  _firebaserepository() {
    datb = FireStoreDb.get();
  }

  final List<TotalandCategory> registerUser = [];

  double valorLimite = 0;
  double renda = 0;
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

  Future<void> addTotaltransection(TotalandCategory trans) async {
    await firestore.addTotaltransection(trans, authentinc.usuario);
    registersList.add(trans);
    notifyListeners();
  }

  Future<void> addValueCategory(double result, String categorynames) async {
    if (categorynames == 'Supermercado') {
      await firestore.supermercado(
          result, categorynames, authentinc.usuario, supermerc);
      supermerc += result;
    } else if (categorynames == 'Lazer') {
      await firestore.lazer(result, categorynames, authentinc.usuario, lazer);
      lazer += result;
    } else if (categorynames == 'Transporte') {
      await firestore.transporte(
          result, categorynames, authentinc.usuario, transpor);
      transpor += result;
    } else if (categorynames == 'Farmacia') {
      await firestore.farmacia(
          result, categorynames, authentinc.usuario, farmac);
      farmac += result;
    } else if (categorynames == 'Pagamentos') {
      await firestore.pagamentos(
          result, categorynames, authentinc.usuario, pagament);
      pagament += result;
    } else {
      await firestore.gastosex(
          result, categorynames, authentinc.usuario, gastosex);
      gastosex += result;
    }
    notifyListeners();
  }

  Future<void> chartRead() async {
    if (authentinc.usuario != null) {
      QuerySnapshot? read = await firestore.chartRead(authentinc.usuario);
      for (var element in read!.docs) {
        supermerc = element.get('supermercado');
        lazer = element.get('lazer');
        transpor = element.get('transporte');
        farmac = element.get('farmacia');
        pagament = element.get('pagamentos');
        gastosex = element.get('gastosex');
      }
      notifyListeners();
    }
  }

  Future<void> transactionsread() async {
    registersList = [];
    if (authentinc.usuario != null && registersList.isEmpty) {
      QuerySnapshot? read =
          await firestore.transactionsread(authentinc.usuario);
      for (var element in read!.docs) {
        TotalandCategory lista = TotalandCategory.fromFirestore(
            element.data() as Map<String, dynamic>);
        registersList.add(lista);
      }

      saida = 0;
      for (var element in registersList) {
        if (element.type == "Receita") {
          renda += element.valor;
        } else if (element.type == "Despesa") {
          saida += element.valor;
        }
      }
      //notifyListeners();

    }
    notifyListeners();
  }

  Future<void> removeByID(String id) async {
    registersList.removeWhere((e) => e.id == id);
    await datb
        .collection("usuarios/${authentinc.usuario!.uid}/transacoes")
        .doc(id)
        .delete();
    notifyListeners();
  }

  removePorcentChart(String index) {
    var element = registersList.where((element) => element.id == index).first;
    menosValueCategory(element.valor, element.categoryname ?? '');
    notifyListeners();
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

  addsaidafire(double result) {
    saida += result;
    notifyListeners();
  }

  Future<void> menosValueCategory(double result, String categorynames) async {
    if (categorynames == 'Supermercado') {
      await firestore.menossupermercado(
          result, categorynames, authentinc.usuario, supermerc);
      supermerc -= result;
      saida -= result;
    } else if (categorynames == 'Lazer') {
      await firestore.menoslazer(
          result, categorynames, authentinc.usuario, lazer);
      lazer -= result;
      saida -= result;
    } else if (categorynames == 'Transporte') {
      await firestore.menostransporte(
          result, categorynames, authentinc.usuario, transpor);
      transpor -= result;
      saida -= result;
    } else if (categorynames == 'Farmacia') {
      await firestore.menosfarmacia(
          result, categorynames, authentinc.usuario, farmac);
      farmac -= result;
      saida -= result;
    } else if (categorynames == 'Pagamentos') {
      await firestore.menospagamentos(
          result, categorynames, authentinc.usuario, pagament);
      pagament -= result;
      saida -= result;
    } else {
      await firestore.menosgastosex(
          result, categorynames, authentinc.usuario, gastosex);
      gastosex -= result;
      saida -= result;
    }
    notifyListeners();
  }

  double porcentSupermerc(double result) {
    return result = supermerc * 100 / saida;
  }

  double porcentLazer(double result) {
    return result = lazer * 100 / saida;
  }

  double porcentTranspor(double result) {
    return result = transpor * 100 / saida;
  }

  double porcentGastosex(double result) {
    return result = gastosex * 100 / saida;
  }

  double porcentPagament(double result) {
    return result = pagament * 100 / saida;
  }

  double porcentFarmac(double result) {
    return result = farmac * 100 / saida;
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
