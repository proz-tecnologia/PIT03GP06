import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ctrl_real/src/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';


//class login extends Mock implements loginuser{} (exemplo)

/*class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() async {
  final repository = AuthRepositoryMock();

  when(
    () => repository.userRead(),
  ).thenAnswer((invocation) async => QuerySnapshot<Object?>());
}
