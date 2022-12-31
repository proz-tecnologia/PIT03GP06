import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/view/registers/pages/receitas.dart';
import 'package:ctrl_real/src/view/user/registration/new_register.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _fireAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: const Color.fromARGB(220, 104, 89, 205),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(220, 104, 89, 205),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: 180,
                height: 240,
                child: Image.asset('asset/img/iconelogin.png'),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 30,
                                validator: (value) {
                                  if (value!.length < 10 || value.length > 30) {
                                    return "Informe o email cadastrado";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  helperText: "Campo obrigatório",
                                  helperStyle: TextStyle(
                                    color: textUser(),
                                  ),
                                  labelText: Strings.userEmail,
                                  hintText: "abcd@gmail.com",
                                  hintStyle: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: textUser(),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(220, 248, 248, 248),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controllerEntradas.email = value;
                                },
                                controller: _email,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 8,
                                validator: (value) {
                                  if (value!.length < 3 || value.length > 8) {
                                    return "Informe a senha";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  helperText: "Campo obrigatório",
                                  helperStyle: TextStyle(
                                    color: textUser(),
                                  ),
                                  labelText: Strings.userSenha,
                                  hintText: "*******",
                                  hintStyle: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: textUser(),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(220, 248, 248, 248),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controllerEntradas.senha = value;
                                },
                                controller: _password,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: Consumer<HistoryController>(
                                    builder: (context, historyController, _) =>
                                        ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Color.fromARGB(
                                                    220, 104, 89, 205)),
                                      ),
                                      child: const Text("Login"),
                                      onPressed: () {
                                        var user = TotalandCategory(
                                          id: '',
                                          date: '',
                                          type: 'Login',
                                          nome: controllerEntradas.nome,
                                          email: controllerEntradas.email,
                                          valor: controllerEntradas.valor,
                                          senha: controllerEntradas.senha,
                                          descri: controllerEntradas.descricao,
                                          categoryname:
                                              controllerEntradas.categoryname,
                                          formPag:
                                              'Forma: ${controllerEntradas.formpag}',
                                          /*icon: const Icon(
                                            Icons.arrow_downward_outlined,
                                            color: Colors.red,
                                          ),*/
                                        );
                                        historyController.addNewUser(user);
                                        historyController.emailUser(
                                            controllerEntradas.email);
                                        historyController.senhaUser(
                                            controllerEntradas.senha);
                                        login();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<
                                              Color>(
                                          Color.fromARGB(220, 104, 89, 205)),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewRegister(),
                                        ),
                                      );
                                    },
                                    child: const Text("Novo cadastro"),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      await context.read<UsersService>().login(_email.text, _password.text);
    } on ExceptionUsers catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
