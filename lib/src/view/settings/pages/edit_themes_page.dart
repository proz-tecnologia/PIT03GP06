import 'package:ctrl_real/src/controllers/themes/themes_buttom.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';

class EditThemesPage extends StatelessWidget {
  const EditThemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar tema'),
        centerTitle: true,
      ),
      body: ListView(children: const [
        ListTile(
          title: Text(Strings.nameThemesDarkDrawer),
          trailing: ButtonDark(),
        ),
        ListTile(
          title: Text('Céu'),
          trailing: ButtonBlue(),
        ),
        ListTile(
          title: Text('Money'),
          trailing: ButtonGreen(),
        ),
        ListTile(
          title: Text('Natal'),
          trailing: ButtonRed(),
        ),
      ]),
    );
  }
}