import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/features/home/pages/homepage.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/features/user/registration/new_register.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 20),
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
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 20,
                                validator: (value) {
                                  if (value!.length < 10 || value.length > 20) {
                                    return "Informe o email cadastrado";
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
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
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
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                style: TextStyle(
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
                                    color: darkFunctionTextUser(),
                                  ),
                                  labelText: Strings.userSenha,
                                  hintText: "*******",
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
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
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: Consumer<HistoryController>(
                                    builder: (context, historyController, _) =>
                                        ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Color.fromARGB(
                                                    220, 104, 89, 205)),
                                      ),
                                      child: const Text("Login"),
                                      onPressed: () {
                                        var user = TotalandCategory(
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
                                          icon: Icon(
                                            Icons.arrow_downward_outlined,
                                            color: Colors.red,
                                          ),
                                        );
                                        historyController.addNewUser(user);
                                        historyController.emailUser(
                                            controllerEntradas.email);
                                        historyController.senhaUser(
                                            controllerEntradas.senha);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                        );
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
                                    style: ButtonStyle(
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
}
