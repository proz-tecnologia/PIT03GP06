import 'package:ctrl_real/src/view/settings/widgets/themes/themes_buttom.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DrawerCuston extends StatefulWidget {
  const DrawerCuston({super.key});

  @override
  State<DrawerCuston> createState() => _DrawerCustonState();
}

class _DrawerCustonState extends State<DrawerCuston>
    with TickerProviderStateMixin {
  final _firebaseAuth = FirebaseAuth.instance;
  late final AnimationController _controllerTheme;
  late final AnimationController _controllerSettings;
  late final AnimationController _controllerInfo;
  late final AnimationController _controllerExit;

  @override
  void initState() {
    super.initState();
    _controllerTheme = AnimationController(vsync: this);
    _controllerTheme.duration = const Duration(seconds: 8);
    _controllerSettings = AnimationController(vsync: this);
    _controllerSettings.duration = const Duration(seconds: 5);
    _controllerInfo = AnimationController(vsync: this);
    _controllerInfo.duration = const Duration(seconds: 2);
    _controllerExit = AnimationController(vsync: this);
    _controllerExit.duration = const Duration(seconds: 10);
    _controllerTheme.repeat();
    _controllerSettings.repeat();
    _controllerInfo.repeat();
    _controllerExit.repeat();
  }

  @override
  void dispose() {
    _controllerTheme.dispose();
    _controllerSettings.dispose();
    _controllerInfo.dispose();
    _controllerExit.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 268,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: darkFunctionWidgets(),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/perfil');
                      },
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Consumer<UsersService>(
                              builder: (context, value, child) => Container(
                                color: const Color.fromARGB(140, 255, 255, 255),
                                height: 100,
                                width: 100,
                                child: value.usuario!.photoURL == null &&
                                        value.perfilImage == null
                                    ? const Icon(
                                        Icons.person_outline,
                                        size: 60,
                                        color: Color.fromARGB(129, 0, 0, 0),
                                      )
                                    : value.usuario!.photoURL == null &&
                                                value.perfilImage != null ||
                                            value.usuario!.photoURL != null &&
                                                value.perfilImage != null
                                        ? Image.file(value.perfilImage!)
                                        : Image.network(
                                            value.usuario!.photoURL!),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Consumer<UsersService>(
                    builder: (context, value, child) => Center(
                      child: Text(
                        value.name ?? "",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          ExpansionTile(
            textColor: darkFunctionSelected(),
            iconColor: darkFunctionSelected(),
            leading: Lottie.network(
              'lottie/87422-color-wheel.json',
              controller: _controllerTheme,
              height: 40,
              width: 40,
            ),
            title: const Text(Strings.nameThemesDrawer),
            children: <Widget>[
              const ListTile(
                title: Text(Strings.nameThemesDarkDrawer),
                trailing: ButtonDark(),
              ),
              const ListTile(
                title: Text('Céu'),
                trailing: ButtonBlue(),
              ),
              const ListTile(
                title: Text('Dinheiro'),
                trailing: ButtonGreen(),
              ),
              const ListTile(
                title: Text('Natal'),
                trailing: ButtonRed(),
              ),
              ListTile(
                  title: const Text(
                    'Mais temas',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/editthemes")),
            ],
          ),
          ListTile(
            leading: Lottie.network(
              'lottie/55492-setting.json',
              controller: _controllerSettings,
              height: 40,
              width: 40,
            ),
            title: const Text(Strings.nameConfigDrawer),
            onTap: () {
              Navigator.of(context).pushNamed('/config');
            },
          ),
          ListTile(
            leading: Lottie.network(
              'lottie/127407-info.json',
              controller: _controllerInfo,
              height: 40,
              width: 40,
            ),
            title: const Text(Strings.nameSobreAppDrawer),
            onTap: () {
              Navigator.of(context).pushNamed('/sobreapp');
              debugPrint(_firebaseAuth.currentUser!.displayName);
            },
          ),
          ListTile(
            leading: Lottie.network(
              'lottie/81249-quit-close-exit.json',
              controller: _controllerExit,
            ),
            title: const Text(Strings.nameExitDrawer),
            onTap: () {
              context.read<UsersService>().logout();
            },
          ),
        ],
      ),
    );
  }
}
