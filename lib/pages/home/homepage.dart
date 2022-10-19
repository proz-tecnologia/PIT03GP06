import 'package:ctrl_real/controllers/themes/darmodcontroller.dart';
import 'package:ctrl_real/pages/addcategories/addcategorias.dart';
import 'package:ctrl_real/pages/historic/historicpage.dart';
import 'package:ctrl_real/pages/home/appbar.dart';
import 'package:ctrl_real/pages/home/homebody.dart';
import 'package:ctrl_real/pages/settings/settingspage.dart';
import 'package:ctrl_real/pages/widgets/drawercustom.dart';
import 'package:flutter/material.dart';
import '../categories/categoriespage.dart';

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
          body: PageView(
          onPageChanged: _onItemTapped,
          controller: pagesanimated,
          children: const [
          HomeBody(),
          CategoriesPage(),
          AddCategories(),
          HistoricPage(),
          SettingsPage(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
      animation: DarkController.instance,
      builder: (context, child) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(220, 104, 89, 205),),
              label: 'Início',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.category, color: Color.fromARGB(220, 104, 89, 205),),
              label: 'Categorias',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, color: Color.fromARGB(220, 104, 89, 205), size: 40,),
              label: 'Add Categorias',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Color.fromARGB(220, 104, 89, 205),),
              label: 'Histórico',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color.fromARGB(220, 104, 89, 205),),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:const Color.fromARGB(220, 104, 89, 205),
          onTap: (value) {
            pagesanimated.animateToPage(value, duration: const Duration(milliseconds: 400), curve: Curves.ease);
          },
        );
      },
    ),
      )
    );
  }
}