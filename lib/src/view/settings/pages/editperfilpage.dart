import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:ctrl_real/src/util/strings.dart';

class EditAccount extends StatelessWidget {
  EditAccount({super.key});

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.editAccount),
        centerTitle: true,
      ),
      body: Consumer2<UsersService, TransactionsController>(
        builder: (context, value, value2, child) => ListView(
          children: [
            ListTile(
              title: const Text(Strings.income),
              subtitle: Text(value2.renda.toString()),
              trailing: const Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              title: const Text(Strings.name),
              subtitle: Text(value.name.toString()),
              trailing: const Icon(Icons.edit),
              onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Form(
                          key: _formKey,
                          child: AlertDialog(
                            title: Text(Strings.newName,
                                style: TextStyle(color: darkFunctionTexts())),
                            content: TextFormField(
                              style: TextStyle(
                                color: darkFunctionTexts(),
                              ),
                              validator: Validatorless.multiple([
                                Validatorless.required(Strings.enterName),
                                Validatorless.onlyCharacters(
                                    Strings.onlyLetters),
                              ]),
                              decoration: InputDecoration(
                                labelText: Strings.userNome,
                                hintText: Strings.newName,
                                hintStyle: TextStyle(
                                    fontSize: 12, color: darkFunctionTexts()),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: darkFunctionTexts(),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkFunctionSelected(),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                name = value;
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(Strings.cancel,
                                    style:
                                        TextStyle(color: darkFunctionTexts())),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      value.updateNameUser(name);
                                    } catch (e) {
                                      Navigator.pop(context);
                                    }
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  Strings.approve,
                                  style: TextStyle(color: darkFunctionTexts()),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
            ),
            ListTile(
              title: const Text(Strings.email),
              subtitle: Text(value.email.toString()),
              trailing: const Icon(Icons.edit),
              onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Form(
                          key: _formKey,
                          child: AlertDialog(
                            title: Text(Strings.newEmail,
                                style: TextStyle(color: darkFunctionTexts())),
                            content: TextFormField(
                              controller: _email,
                              style: TextStyle(
                                color: darkFunctionTexts(),
                              ),
                              validator: Validatorless.multiple([
                                Validatorless.required(Strings.enterEmail),
                                Validatorless.email(Strings.invalidEmail),
                              ]),
                              decoration: InputDecoration(
                                labelText: Strings.userEmail,
                                hintText: "abcd@abcd.com",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: darkFunctionTexts()),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: darkFunctionTexts(),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: darkFunctionSelected(),
                                  ),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(Strings.cancel,
                                    style:
                                        TextStyle(color: darkFunctionTexts())),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      value.updateEmailUser(_email.text);
                                    } catch (e) {
                                      Navigator.pop(context);
                                    }
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  Strings.approve,
                                  style: TextStyle(color: darkFunctionTexts()),
                                ),
                              ),
                            ],
                          ),
                        ));
              },
            ),
            ListTile(
              title: const Text(Strings.enterPassword),
              subtitle: const Text("***********"),
              trailing: const Icon(Icons.edit),
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Form(
                    key: _formKey,
                    child: AlertDialog(
                      title: Text(Strings.newPassword,
                          style: TextStyle(color: darkFunctionTexts())),
                      content: TextFormField(
                        controller: _senha,
                        style: TextStyle(
                          color: darkFunctionTexts(),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required(Strings.setYourPassword),
                          Validatorless.regex(
                            RegExp(
                                r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])([0-9a-zA-Z$*&@#]){6,}$'),
                            "A senha precisa ter:\nMínimo de 6 dígitos\nUm número\nUma letra maiúscula\nUma letra minúscula\nUm caracter especial \$*&@#\n",
                          ),
                        ]),
                        decoration: InputDecoration(
                          labelText: Strings.userSenha,
                          hintText: "#######",
                          hintStyle: TextStyle(
                              fontSize: 12, color: darkFunctionTexts()),
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: darkFunctionTexts(),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: darkFunctionSelected(),
                            ),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(Strings.cancel,
                              style: TextStyle(color: darkFunctionTexts())),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              try {
                                value.updateSenhaUser(_senha.text);
                              } catch (e) {
                                Navigator.pop(context);
                              }
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            Strings.approve,
                            style: TextStyle(color: darkFunctionTexts()),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
