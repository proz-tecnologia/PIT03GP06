import 'package:ctrl_real/firebase_options.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/services/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/home/pages/homepage.dart';
import 'package:ctrl_real/src/view/login/check_page.dart';
import 'package:ctrl_real/src/view/login/loginpage.dart';
import 'package:ctrl_real/src/view/perfil/pages/editperfilpage.dart';
import 'package:ctrl_real/src/view/perfil/pages/perfilpage.dart';
import 'package:ctrl_real/src/view/registers/widgets/buttonreceitas.dart';
import 'package:ctrl_real/src/view/settings/pages/edit_themes_page.dart';
import 'package:ctrl_real/src/view/user/registration/new_register.dart';
import 'package:ctrl_real/src/view/registers/pages/despesas.dart';
import 'package:ctrl_real/src/view/registers/pages/receitas.dart';
import 'package:ctrl_real/src/view/settings/pages/settingspage.dart';
import 'package:ctrl_real/src/view/sobreapp/pages/sobreapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          create: ((context) => UsersService()),
        ),
        ChangeNotifierProvider(
          create: ((context) => LvlSystem(authentinc: context.read<UsersService>())),
        ),
        ChangeNotifierProvider(
          create: ((context) =>
              HistoryController(authentinc: context.read<UsersService>())),
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
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: darkFunctionFloat()),
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => const CheckPage(),
              "/login": (context) => const LoginUser(),
              "/cadastro": (context) => NewRegister(),
              "/home": (context) => const HomePage(),
              "/config": (context) => const SettingsPage(),
              "/receitas": (context) => const ReceitasPage(),
              "/despesas": (context) => const DespesasPage(),
              "/perfil": (context) => const PerfilPage(),
              "/sobreapp": (context) => const SobreApp(),
              "/editcount": (context) => const EditAccount(),
              "/editthemes": (context) => const EditThemesPage(),
            },
          );
        },
      ),
    );
  }
}
