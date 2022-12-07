import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/home/pages/homepage.dart';
import 'package:ctrl_real/src/view/login/loginpage.dart';
import 'package:ctrl_real/src/view/perfil/pages/editperfilpage.dart';
import 'package:ctrl_real/src/view/perfil/pages/perfilpage.dart';
import 'package:ctrl_real/src/view/settings/pages/edit_themes_page.dart';
import 'package:ctrl_real/src/view/user/registration/new_register.dart';
import 'package:ctrl_real/src/view/registers/pages/despesas.dart';
import 'package:ctrl_real/src/view/registers/pages/receitas.dart';
import 'package:ctrl_real/src/view/settings/pages/settingspage.dart';
import 'package:ctrl_real/src/view/sobreapp/pages/sobreapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => HistoryController()),
        ),
        ChangeNotifierProvider(
          create: ((context) => LvlSystem()),
        ),
      ],
      child: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("pt", "BR"),
            ],
            debugShowCheckedModeBanner: false,
            title: "Crtl'Real",
            theme: ThemeData(
              brightness: DarkController.instance.darkmod
                  ? Brightness.dark
                  : Brightness.light,
              appBarTheme: AppBarTheme(
                backgroundColor: darkFunctionWidgets(),
              ),
              cardColor: darkFunctionWidgets(),
              floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: darkFunctionFloat()),
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => const LoginUser(),
              "/cadastro": (context) => NewRegister(),
              "/home": (context) => const HomePage(),
              "/config": (context) => const SettingsPage(),
              "/receitas": (context) => const ReceitasPage(),
              "/despesas": (context) => const DespesasPage(),
              "/perfil": (context) => const PerfilPage(),
              "/sobreapp": (context) => const SobreApp(),
              "/editcount": (context) => const EditAccount(),
              "/editthemes":(context) => const EditThemesPage()
            },
          );
        },
      ),
    );
  }
}
