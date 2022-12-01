import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/transections_despe_controller.dart';
import 'package:ctrl_real/src/features/login/loginpage.dart';
import 'package:ctrl_real/src/features/registers/pages/despesas.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewRegister extends StatefulWidget {
  NewRegister({super.key});

  @override
  State<NewRegister> createState() => _NewRegisterState();

  final TransactionController controllerReceita = TransactionController();
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
                              helperStyle: TextStyle(
                                color: darkFunctionTextUser(),
                              ),
                              labelText: Strings.userNome,
                              hintText: "Nome e sobrenome",
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                              helperStyle: TextStyle(
                                color: darkFunctionTextUser(),
                              ),
                              labelText: Strings.userEmail,
                              hintText: "abcd@gmail.com",
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              prefix: const Text("R\$"),
                              helperText: "Máximo de 999.999,99 digitos",
                              helperStyle: TextStyle(
                                color: darkFunctionTextUser(),
                              ),
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
                              helperStyle: TextStyle(
                                color: darkFunctionTextUser(),
                              ),
                              labelText: Strings.userSenha,
                              hintText: "*******",
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                              helperStyle: TextStyle(
                                color: darkFunctionTextUser(),
                              ),
                              labelText: "Confirmar Senha",
                              hintText: "*******",
                              hintStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
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
                              child: Consumer<HistoryController>(
                                  builder: (context, historyController, _) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(220, 104, 89, 205)),
                                    child: const Text("Cadastrar"),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              duration: Duration(seconds: 2),
                                              backgroundColor: Color.fromARGB(
                                                  220, 104, 89, 205),
                                              content: Text(
                                                'Cadastro Realizado com sucesso!',
                                                textAlign: TextAlign.center,
                                              )),
                                        );
                                        var trans = TotalandCategory(
                                          type: 'Cadastro',
                                          nome: controller.nome,
                                          email: controller.email,
                                          senha: controller.senha,
                                          valor: controller.valor,
                                          descri: controller.descricao,
                                          categoryname: controller.categoryname,
                                          formPag:
                                              'Forma: ${controller.formpag}',
                                          icon: Icon(
                                            Icons.arrow_downward_outlined,
                                            color: Colors.red,
                                          ),
                                        );
                                        historyController
                                            .nomeUser(controller.nome);
                                        historyController
                                            .emailUser(controller.email);
                                        historyController
                                            .senhaUser(controller.senha);
                                        historyController
                                            .rendaInicial(controller.valor);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginUser(),
                                          ),
                                        );
                                      }
                                    });
                              }),
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
