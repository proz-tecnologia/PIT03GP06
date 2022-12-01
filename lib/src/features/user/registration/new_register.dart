import 'package:ctrl_real/src/features/home/pages/homepage.dart';
import 'package:ctrl_real/src/features/login/loginpage.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class NewRegister extends StatefulWidget {
  const NewRegister({super.key});

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          centerTitle: true,
        ),
        body: Container(
          color: Color.fromARGB(220, 104, 89, 205),
          child: Container(
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
                            maxLength: 25,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 52) {
                                return "Informe seu nome";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              helperText: "Campo obrigatório",
                              labelText: Strings.userNome,
                              hintText: "Nome e sobrenome",
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              CurrencyTextInputFormatter(
                                  locale: 'pt-BR', decimalDigits: 2, symbol: '')
                            ],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: Strings.userRenda,
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: darkFunctionTextUser(),
                              ),
                              hintText: "0,00",
                              hintStyle: TextStyle(fontSize: 12),
                              prefix: const Text("R\$"),
                              helperText: "Máximo de 999.999,99 digitos",
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(220, 248, 248, 248),
                                ),
                              ),
                            ),
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Informe um valor";
                              }
                              final valueDouble = double.parse(value
                                  .replaceAll(".", "")
                                  .replaceAll(",", "."));
                              if (valueDouble == 0) {
                                return "Informe um valor diferente de 0";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.valor = double.parse(value
                                  .replaceAll(".", "")
                                  .replaceAll(",", "."));
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
                                return "Informe sua Senha";
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
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 8,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 52) {
                                return "As senhas precisam ser idênticas";
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
                                      builder: (context) => LoginUser(),
                                    ),
                                  );
                                },
                                child: const Text("Cadastrar"),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
