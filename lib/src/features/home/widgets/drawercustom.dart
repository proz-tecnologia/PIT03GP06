import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerCuston extends StatelessWidget {
  const DrawerCuston({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 268,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const<Widget>[
          UserAccountsDrawerHeader(
           decoration:BoxDecoration(
            color:Color.fromARGB(220, 104, 89, 205),
           ),
           accountEmail: Text("user@mail.com"),
           accountName: Text("Aysha"),
           currentAccountPicture: CircleAvatar(
            child: Text("AY"),
           ), 
          ),
        ],
      ),
    );
  }
}