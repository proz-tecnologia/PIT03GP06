import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/repositories/firestore_repository.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

final user = UsersService();

class FirestoreRepositoryMock extends Mock implements FirestoreRepository {}

void main() {
  final repositoryfire = FirestoreRepositoryMock();
  test(
    "Add transações",
    () {
      TotalandCategory trans = TotalandCategory(
          id: const Uuid().v4(),
          date: "10/02/2023",
          type: "receita",
          formPag: "",
          valor: 2500,
          descri: "emprego");
      repositoryfire.addTotaltransection(trans, user.usuario);

      expect(repositoryfire.addTotaltransection(trans, user.usuario), true);
    },
  );
}
