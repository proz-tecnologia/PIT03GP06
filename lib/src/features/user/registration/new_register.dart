import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/transections_despe_controller.dart';
import 'package:ctrl_real/src/features/login/loginpage.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:provider/provider.dart';

class NewRegister extends StatefulWidget {
  NewRegister({super.key});

  @override
  State<NewRegister> createState() => _NewRegisterState();

  final TransactionController controllerEntradas = TransactionController();
}

class _NewRegisterState extends State<NewRegister> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          centerTitle: true,
        ),
        body: Container(
          color: darkFunctionWidgets(),
          height: double.infinity,
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
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 25,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 25) {
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
                              controllerEntradas.nome = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 20,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 20) {
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
                              controllerEntradas.email = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
                            onChanged: (value) {
                              controllerEntradas.valor = double.parse(value
                                  .replaceAll(".", "")
                                  .replaceAll(",", "."));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "A senha deve conter:\n ° Até 8 caracteres\n ° Uma letra maiúscula\n ° Uma letra minúscula\n ° Um caractere especial\n ° Um número",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 25,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 25) {
                                return "Defina sua senha";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
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
                              controllerEntradas.senha = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLength: 25,
                            validator: (value) {
                              if (value!.length < 3 || value.length > 25) {
                                return "Confirme sua senha";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Confirmar Senha*",
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
                              controllerEntradas.senha = value;
                              passNotifier.value =
                                  PasswordStrength.calculate(text: value);
                            },
                          ),
                        ),
                        PasswordStrengthChecker(
                          strength: passNotifier,
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
                                        var user = TotalandCategory(
                                          type: 'Cadastro',
                                          nome: controllerEntradas.nome,
                                          email: controllerEntradas.email,
                                          valor: controllerEntradas.valor,
                                          senha: controllerEntradas.senha,
                                          descri: controllerEntradas.descricao,
                                          categoryname:
                                              controllerEntradas.categoryname,
                                          formPag:
                                              'Forma: ${controllerEntradas.formpag}',
                                          icon: Icon(
                                            Icons.arrow_downward_outlined,
                                            color: Colors.red,
                                          ),
                                        );
                                        historyController.addNewUser(user);
                                        historyController
                                            .nomeUser(controllerEntradas.nome);
                                        historyController.emailUser(
                                            controllerEntradas.email);
                                        historyController.senhaUser(
                                            controllerEntradas.senha);
                                        historyController.rendaInicial(
                                            controllerEntradas.valor);

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
