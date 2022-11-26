import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TotalandCategory {
  final String id = const Uuid().v4();
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