import 'package:flutter/material.dart';

class TotalandCategory {
  final String type;
  final Icon icon;
  final double valor;
  final String descri;
  final String formPag;
  final String? categoryname;
  

  TotalandCategory({
    required this.type,
    required this.icon,
    required this.formPag,
    required this.valor,
    required this.descri,
    this.categoryname,
  });
}