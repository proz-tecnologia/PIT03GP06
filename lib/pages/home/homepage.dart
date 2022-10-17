import 'package:ctrl_real/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/pages/home/appbar.dart';
import 'package:ctrl_real/pages/home/bottomnavigation.dart';
import 'package:ctrl_real/pages/home/homebody.dart';
import 'package:ctrl_real/pages/widgets/drawercustom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerCuston(),
        appBar: AppbarCustom(
          appBar: AppBar(),
          leading: IconButton(
          icon: const Icon(Icons.person_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            widgets: const [
              ButtonDark(),
            ],
          ),
        body: const HomeBody(),
        bottomNavigationBar: const BottomNavigation(),
      )
    );
  }
}