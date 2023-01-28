import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/view/transactions/pages/receitas.dart';
import 'package:ctrl_real/src/view/userregister/pages/new_register.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/userregister/pages/resetpassword.dart';
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
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(220, 104, 89, 205),
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: const Color.fromARGB(220, 104, 89, 205),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
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
                                decoration: InputDecoration(
                                  labelText: "Senha",
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
                                obscureText:
                                    _showPassword == false ? true : false,
                                onChanged: (value) {
                                  controllerEntradas.senha = value;
                                },
                                controller: _password,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: const Text("Esqueci a senha",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ResetPasswordPage()));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              height: 60,
                              child: Consumer<TransactionsController>(
                                builder: (context, historyController, _) =>
                                    Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<
                                              Color>(
                                          Color.fromRGBO(104, 89, 205, 0.863)),
                                    ),
                                    child: const Text(
                                      "Entrar",
                                      style: TextStyle(fontSize: 18),
                                    ),
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
                                      historyController
                                          .emailUser(controllerEntradas.email);
                                      historyController
                                          .senhaUser(controllerEntradas.senha);
                                      login();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  child: const Text(
                                      "Sua primeira vez? Cadastre-se",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewRegister()));
                                  },
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
