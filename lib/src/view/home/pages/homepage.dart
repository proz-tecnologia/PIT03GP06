import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/historic/pages/historicpage.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/balances.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/dicas.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/limit.dart';
import 'package:ctrl_real/src/view/home/widgets/drawercustom.dart';
import 'package:ctrl_real/src/view/registers/widgets/buttonreceitas.dart';
import 'package:flutter/material.dart';
import '../widgets/bodywidgets/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController pagesanimated;

  @override
  void initState() {
    super.initState();
    pagesanimated = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const DrawerCuston(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'asset/img/logo.png',
          height: 110,
          width: 98,
        ),
      ),
      body: PageView(
        onPageChanged: _onItemTapped,
        controller: pagesanimated,
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const Balances(),
                Speding(),
                const Categories(),
                const Dicaswidget()
              ],
            ),
          )),
          const HistoricPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ButtomReceitas(),
      bottomNavigationBar: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (context, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 26,
                ),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_edu,
                  size: 26,
                ),
                label: 'Histórico',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: darkFunctionSelected(),
            onTap: (value) {
              pagesanimated.animateToPage(value,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            },
          );
        },
      ),
    ));
  }
}
