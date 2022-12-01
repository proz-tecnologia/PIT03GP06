import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/features/home/pages/homepage.dart';
import 'package:ctrl_real/src/features/login/loginpage.dart';
import 'package:ctrl_real/src/features/perfil/pages/perfilpage.dart';
import 'package:ctrl_real/src/features/user/registration/new_register.dart';
import 'package:ctrl_real/src/features/registers/pages/despesas.dart';
import 'package:ctrl_real/src/features/registers/pages/receitas.dart';
import 'package:ctrl_real/src/features/settings/pages/settingspage.dart';
import 'package:ctrl_real/src/features/sobreapp/pages/sobreapp.dart';
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
              canvasColor: DarkController.instance.darkmod
                  ? const Color.fromARGB(255, 41, 41, 41)
                  : const Color.fromARGB(216, 250, 250, 250),
              brightness: DarkController.instance.darkmod
                  ? Brightness.dark
                  : Brightness.light,
              appBarTheme: AppBarTheme(
                backgroundColor: DarkController.instance.darkmod
                    ? const Color.fromARGB(255, 34, 34, 34)
                    : const Color(0xff6959CD),
              ),
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => const LoginUser(),
              "/cadastro": (context) => const NewRegister(),
              "/home": (context) => const HomePage(),
              "/config": (context) => const SettingsPage(),
              "/receitas": (context) => ReceitasPage(),
              "/despesas": (context) => const DespesasPage(),
              "/perfil": (context) => const PerfilPage(),
              "/sobreapp": (context) => const SobreApp()
            },
          );
        },
      ),
    );
  }
}
