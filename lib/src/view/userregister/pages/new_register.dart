import 'package:ctrl_real/main.dart';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/controllers/transactions_form_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/text_styles.dart';
import 'package:ctrl_real/src/view/transactions/pages/receitas.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
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
  final _password = TextEditingController();
  bool _showPassword = false;
  double renda = 0;

  bool loading = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
                            hintText: "Apenas o primeiro nome",
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
                            //valuee.name = value;
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
                            //valuee.email = value;
                          },
                        ),
                        TextFormField(
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
                          onChanged: ((newValue) {
                            controllerEntradas.valor = double.parse(newValue
                                .replaceAll(".", "")
                                .replaceAll(",", "."));
                            renda = double.parse(newValue
                                .replaceAll(".", "")
                                .replaceAll(",", "."));
                          }),
                        ),
                        TextFormField(
                          controller: _password,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
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
                            suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                }),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(220, 248, 248, 248),
                              ),
                            ),
                          ),
                          obscureText: _showPassword == false ? true : false,
                          onChanged: (value) {
                            controllerEntradas.senha = value;
                          },
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLength: 10,
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                "Confirmar a senha é obrigatório"),
                            Validatorless.compare(
                                _password, "As senhas estão diferentes"),
                          ]),
                          decoration: InputDecoration(
                            helperStyle: TextStyle(
                              color: textUser(),
                            ),
                            labelText: Strings.userConfirmarSenha,
                            hintText: "*******",
                            hintStyle: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: textUser(),
                            ),
                            suffixIcon: GestureDetector(
                                child: Icon(
                                  _showPassword == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                }),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(220, 248, 248, 248),
                              ),
                            ),
                          ),
                          obscureText: _showPassword == false ? true : false,
                          onChanged: (value) {
                            controllerEntradas.senha = value;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: SizedBox(
                            width: 150,
                            height: 26,
                            child:
                                Consumer2<TransactionsController, UsersService>(
                                    builder:
                                        (context, historyController, value, _) {
                              return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0XFF382D79)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: Color(0XFF382D79)))),
                                  ),
                                  onPressed: (loading)
                                      ? () {}
                                      : () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  duration:
                                                      Duration(seconds: 2),
                                                  backgroundColor:
                                                      Color.fromARGB(
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
                                              descri:
                                                  controllerEntradas.descricao,
                                              categoryname: controllerEntradas
                                                  .categoryname,
                                              formPag:
                                                  'Forma: ${controllerEntradas.formpag}',
                                              /*icon: const Icon(
                                          Icons.arrow_downward_outlined,
                                          color: Colors.red,
                                        ),*/
                                            );
                                            historyController.addNewUser(user);
                                            historyController.nomeUser(
                                                controllerEntradas.nome);
                                            historyController.emailUser(
                                                controllerEntradas.email);
                                            historyController.senhaUser(
                                                controllerEntradas.senha);
                                            historyController.rendaInicial(
                                                controllerEntradas.valor);
                                            registerUser();
                                          }
                                        },
                                  child: (loading)
                                      ? const CircularProgressIndicator(
                                          strokeWidth: 1.0,
                                        )
                                      : Text(
                                          "Cadastrar",
                                          style: context.textStyles.textRegular
                                              .copyWith(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ));
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
          .registerUser(_email.text, _password.text, _name.text, renda);
      setState(() {
        loading = false;
      });
      navigatorKey.currentState!.pop();
    } on ExceptionUsers catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
