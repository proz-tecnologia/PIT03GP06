import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/src/features/addcategories/pages/addcategorias.dart';
import 'package:ctrl_real/src/features/historic/pages/historicpage.dart';
import 'package:ctrl_real/src/features/home/widgets/bodywidgets/balances.dart';
import 'package:ctrl_real/src/features/home/widgets/bodywidgets/dicas.dart';
import 'package:ctrl_real/src/features/home/widgets/bodywidgets/spending.dart';
import 'package:ctrl_real/src/features/home/widgets/drawercustom.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerCuston(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'asset/img/logo.png',
          height: 110,
          width: 98,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.person_outline),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      body: PageView(
        onPageChanged: _onItemTapped,
        controller: pagesanimated,
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: const [
                Balances(),
                Speding(),
                Categories(),
                Dicaswidget()
              ],
            ),
          )),
          const AddCategories(),
          const HistoricPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: DarkController.instance,
        builder: (context, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Color.fromARGB(220, 104, 89, 205),
                ),
                label: 'Início',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Color.fromARGB(220, 104, 89, 205),
                  size: 40,
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_edu,
                  color: Color.fromARGB(220, 104, 89, 205),
                ),
                label: 'Histórico',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(220, 104, 89, 205),
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
