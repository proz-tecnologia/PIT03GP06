import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPage();
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Redefinir Senha'),
          backgroundColor: const Color.fromARGB(220, 104, 89, 205),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(220, 104, 89, 205),
          height: double.infinity,
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
            child: ListView(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('asset/img/password_reset.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Esqueceu sua senha?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Insira seu e-mail para prosseguir com a redefinição de senha. Enviaremos um link para seu e-mail.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Entre com um e-mail válido'
                          : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromRadius(20),
                    maximumSize: const Size.fromWidth(40),
                    backgroundColor: const Color.fromRGBO(104, 89, 205, 0.863),
                  ),
                  icon: const Icon(Icons.email_outlined),
                  // ignore: prefer_const_constructors
                  label: Text(
                    "Enviar",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
