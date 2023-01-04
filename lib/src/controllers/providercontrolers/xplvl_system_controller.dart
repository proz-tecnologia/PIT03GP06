import 'package:flutter/cupertino.dart';

class LvlSystem extends ChangeNotifier {
  int xp = 0;
  int finalxp = 100;
  int lvl = 15;

  despXpAdd() {
    if (lvl == 15) {
      lvl = 15;
    } else {
      xp += 25;
    }
    if (xp >= finalxp) {
      lvl++;
      xp = xp - finalxp;
    }
  }

    recXpAdd() {
    if (lvl >= 15) {
      lvl = 15;
    } else {
      xp += 40;
    }
    if (xp >= finalxp) {
      lvl++;
      xp = xp - finalxp;
    }
  }

  xpFinal() {
    if (lvl < 5) {
      finalxp = finalxp;
    } else if (lvl >= 5 && lvl <= 10) {
      finalxp = 150;
    } else {
      finalxp = 200;
    }
  }
}
