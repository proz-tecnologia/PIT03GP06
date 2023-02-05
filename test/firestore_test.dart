/*import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/repositories/firestore_repository.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

final user = UsersService();

class FirestoreRepositoryMock extends Mock implements FirestoreRepository {}

void main() {
test('test init transaction', () async {
    final repository = FirestoreRepositoryMock();
    final controller = TransactionsController(authentinc: user);
    final list = [
      TotalandCategory(
      id: const Uuid().v4(),
      date: "",
      type: "",
      formPag: "",
      valor: 2500,
      descri: "")
    ];

    when(
      () => repository.transactionsread(user.usuario),
    ).thenAnswer((invocation) async => list);

    await controller.transactionsread();

    expect(controller.listTransaction, list);
  });
}*/
