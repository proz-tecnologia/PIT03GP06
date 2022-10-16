import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {

  final Image? title;
  final bool centerTitle = true;
  final Color backgroundColor = Colors.red;
  final AppBar appBar;
  final List<Widget>? widgets;
  final Widget leading;

  const AppbarCustom({super.key, required this.appBar, this.widgets, required this.leading, this.title});



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: widgets,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

