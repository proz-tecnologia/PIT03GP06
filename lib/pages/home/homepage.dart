import 'package:ctrl_real/pages/home/appbarcustom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

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
        drawer: const Drawer(),
        appBar: AppbarCustom(
          appBar: AppBar(),
          leading: IconButton(
          icon: const Icon(Icons.person_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          widgets: [
            
          ],
          ),
        body: Container(),
      )
    );
  }
}