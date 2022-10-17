import 'package:ctrl_real/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DarkController.instance,
      builder: (context, child) {
        return BottomNavigationBar(
          backgroundColor: DarkController.instance.darkmod ? const Color.fromARGB(240, 30, 30, 30) : const Color.fromARGB(216, 250, 250, 250),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'FloatingButton',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:const Color.fromARGB(220, 104, 89, 205),
          onTap: _onItemTapped,
        );
      },
    );
  }
}
