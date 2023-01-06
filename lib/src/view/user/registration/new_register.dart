import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/transections_despe_controller.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/view/registers/pages/receitas.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class NewRegister extends StatefulWidget {
  NewRegister({super.key});

  @override
  State<NewRegister> createState() => _NewRegisterState();

  final TransactionController controllerEntradas = TransactionController();
}

class _NewRegisterState extends State<NewRegister> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _income = TextEditingController();
  final _password = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
          backgroundColor: const Color.fromARGB(220, 104, 89, 205),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(220, 104, 89, 205),
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
                        TextFormField(
                          controller: _name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required("Informe seu nome"),
                            Validatorless.onlyCharacters("Apenas letras"),
                          ]),
                          decoration: InputDecoration(
                            labelText: Strings.userNome,
                            hintText: "Nome e sobrenome",
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
                            controllerEntradas.nome = value;
                          },
                        ),
                        TextFormField(
                          controller: _email,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          validator: Validatorless.multiple([
                            Validatorless.required("Informe seu e-mail"),
                            Validatorless.email("E-mail inválido"),
                          ]),
                          decoration: InputDecoration(
                            labelText: Strings.userEmail,
                            hintText: "abcd@abcd.com",
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
                        ),
                        TextFormField(
                          controller: _income,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                                locale: 'pt-BR', decimalDigits: 2, symbol: '')
                          ],
                          decoration: InputDecoration(
                            labelText: Strings.userRenda,
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: textUser(),
                            ),
                            prefix: const Text("R\$"),
                            hintText: "0,00",
                            hintStyle: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            helperText: "Máximo de 10 dígitos",
                            helperStyle: TextStyle(
                              color: textUser(),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(220, 248, 248, 248),
                              ),
                            ),
                          ),
                          maxLength: 10,
                          onChanged: ((newValue) => controllerEntradas.valor =
                              double.parse(newValue
                                  .replaceAll(".", "")
                                  .replaceAll(",", "."))),
                        ),
                        TextFormField(
                          controller: _password,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLength: 10,
                          validator: Validatorless.multiple([
                            Validatorless.required("Defina sua senha"),
                            Validatorless.regex(
                              RegExp(
                                  r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])([0-9a-zA-Z$*&@#]){6,}$'),
                              "A senha precisa ter:\nMínimo de 6 dígitos\nUm número\nUma letra maiúscula\nUma letra minúscula\nUm caracter especial \$*&@#\n",
                            ),
                          ]),
                          decoration: InputDecoration(
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
                        ),
                        Center(
                          child: SizedBox(
                            width: 130,
                            height: 40,
                            child: Consumer<HistoryController>(
                                builder: (context, historyController, _) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          220, 104, 89, 205)),
                                  child: (loading)
                                      ? const CircularProgressIndicator()
                                      : const Text("Cadastrar"),
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
                                        id: '',
                                        date: '',
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
                                        /*icon: const Icon(
                                          Icons.arrow_downward_outlined,
                                          color: Colors.red,
                                        ),*/
                                      );
                                      historyController.addNewUser(user);
                                      historyController
                                          .nomeUser(controllerEntradas.nome);
                                      historyController
                                          .emailUser(controllerEntradas.email);
                                      historyController
                                          .senhaUser(controllerEntradas.senha);
                                      historyController.rendaInicial(
                                          controllerEntradas.valor);

                                      registerUser();
                                    }
                                  });
                            }),
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

  registerUser() async {
    try {
      setState(() {
        loading = true;
      });
      await context
          .read<UsersService>()
          .registerUser(_email.text, _password.text);
      setState(() {
        loading = false;
      });
      navigatorKey.currentState!.pushNamed('/');
    } on ExceptionUsers catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
