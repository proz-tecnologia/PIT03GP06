import 'package:ctrl_real/src/view/settings/widgets/themes/themes_buttom.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';

class EditThemesPage extends StatelessWidget {
  const EditThemesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
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
          title: Text('Dinheiro'),
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
