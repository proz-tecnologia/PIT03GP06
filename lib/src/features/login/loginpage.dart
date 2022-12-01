import 'package:ctrl_real/src/features/home/pages/homepage.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/features/user/registration/new_register.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Container(
          color: Color.fromARGB(220, 104, 89, 205),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                width: 150,
                height: 158,
                child: Image.asset('asset/img/logo.png'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 20,
                                validator: (value) {
                                  if (value!.length < 3 || value.length > 52) {
                                    return "Informe seu email";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  helperText: "Campo obrigatório",
                                  labelText: Strings.userEmail,
                                  hintText: "abcd@gmail.com",
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: darkFunctionTextUser(),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(220, 248, 248, 248),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.nome = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 8,
                                validator: (value) {
                                  if (value!.length < 3 || value.length > 52) {
                                    return "Informe a senha";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  helperText: "Campo obrigatório",
                                  labelText: Strings.userSenha,
                                  hintText: "Senha",
                                  hintStyle: TextStyle(fontSize: 12),
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: darkFunctionTextUser(),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(220, 248, 248, 248),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.descricao = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    },
                                    child: const Text("Cadastrar"),
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
}
