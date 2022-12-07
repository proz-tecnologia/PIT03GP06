import 'package:flutter/material.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar conta'),
        centerTitle: true,
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("Renda"),
          subtitle: const Text("5000"),
          trailing: const Icon(Icons.edit),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Nome"),
          subtitle: const Text("Kawaii_Aysha"),
          trailing: const Icon(Icons.edit),
          onTap: () {},
        ),
        ListTile(
          title: const Text("E-mail"),
          subtitle: const Text("user@mail.com"),
          trailing: const Icon(Icons.edit),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Senha"),
          subtitle: const Text("***********"),
          trailing: const Icon(Icons.edit),
          onTap: () {},
        ),
      ]),
    );
  }
}
