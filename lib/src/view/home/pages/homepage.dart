import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/service/firebase_auth.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/historic/pages/historicpage.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/balances.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/tips.dart';
import 'package:ctrl_real/src/view/home/widgets/bodywidgets/limit.dart';
import 'package:ctrl_real/src/view/home/widgets/drawercustom.dart';
import 'package:ctrl_real/src/view/transactions/widgets/buttonreceitas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    pagesanimated = PageController(initialPage: _selectedIndex);
    context.read<UsersService>().userRead();
    context.read<LvlSystem>().lvlRead();
    context.read<TransactionsController>().chartRead();
    context.read<TransactionsController>().transactionsread();
    context.read<TransactionsController>().renda =
        context.read<UsersService>().renda;
    super.initState();
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
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 14, right: 14),
              child: Consumer<LvlSystem>(
                  builder: (context, value, child) => Column(
                        children: [
                          Text("Nível ${value.lvl.toString()}"),
                          value.lvl < 15
                              ? Text('${value.xp} / ${value.finalxp} Xp')
                              : const Text('Nível max')
                        ],
                      )),
            ),
          ]),
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
                Tips(),
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
