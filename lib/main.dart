import 'package:ctrl_real/firebase_options.dart';
import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/repositories/auth_repository.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/controllers/notification_page_controller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/home/pages/homepage.dart';
import 'package:ctrl_real/src/view/tutorial/onboarding.dart';
import 'package:ctrl_real/src/view/userregister/pages/check_page.dart';
import 'package:ctrl_real/src/view/userregister/pages/loginpage.dart';
import 'package:ctrl_real/src/view/settings/pages/editperfilpage.dart';
import 'package:ctrl_real/src/view/perfil/pages/perfilpage.dart';
import 'package:ctrl_real/src/view/settings/pages/edit_themes_page.dart';
import 'package:ctrl_real/src/view/userregister/pages/new_register.dart';
import 'package:ctrl_real/src/view/transactions/pages/despesas.dart';
import 'package:ctrl_real/src/view/transactions/pages/receitas.dart';
import 'package:ctrl_real/src/view/settings/pages/edit_notifications_page.dart';
import 'package:ctrl_real/src/view/settings/pages/delete_account_page.dart';
import 'package:ctrl_real/src/view/settings/pages/settingspage.dart';
import 'package:ctrl_real/src/view/sobreapp/pages/sobreapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _ativo = false;
  final String _ativoVar = 'ativo';

  @override
  void initState() {
    _initAppVerificaSeEstaAtivo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => UsersService()),
        ),
        ChangeNotifierProvider(
          create: ((context) =>
              LvlSystem(authentinc: context.read<UsersService>())),
        ),
        ChangeNotifierProvider(
          create: ((context) =>
              TransactionsController(authentinc: context.read<UsersService>())),
        ),
        ChangeNotifierProvider(
          create: ((context) => NotificationPageController()),
        ),
      ],
      child: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
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
              "/": (context) =>
                  _ativo ? const CheckPage() : const OnBoardingApp(),
              "/login": (context) => const LoginUser(),
              "/cadastro": (context) => NewRegister(),
              "/home": (context) => const HomePage(),
              "/config": (context) => const SettingsPage(),
              "/receitas": (context) => const ReceitasPage(),
              "/despesas": (context) => const DespesasPage(),
              "/perfil": (context) => const PerfilPage(),
              "/sobreapp": (context) => const SobreApp(),
              "/editcount": (context) => EditAccount(),
              "/editnotifications": (context) => const EditNotificationsPage(),
              "/editthemes": (context) => const EditThemesPage(),
              "/deleteaccount": (context) => const DeleteAccountPage()
            },
          );
        },
      ),
    );
  }

  _initAppVerificaSeEstaAtivo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ativo = prefs.getBool(_ativoVar) ?? false;

    setState(() {
      _ativo = ativo;
    });
  }
}
