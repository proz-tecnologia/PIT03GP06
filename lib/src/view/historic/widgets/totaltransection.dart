import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

class ItemTransec extends StatefulWidget {
  const ItemTransec(this.itens, {super.key});

  final TotalandCategory itens;

  @override
  State<ItemTransec> createState() => _ItemTransecState();
}

class _ItemTransecState extends State<ItemTransec> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itens.formPag!,
                    style: const TextStyle(
                      color: Color(0xdfffffff),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      widget.itens.categoryname ?? '',
                      style: const TextStyle(color: Color(0xdfffffff)),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Divider(
                  height: 4,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itens.valor.obterReal(),
                    style: TextStyle(
                        color: textCardColors(widget.itens.categoryname)),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.itens.date!,
                        style: const TextStyle(color: Color(0xdfffffff)),
                      ),
                      SizedBox(
                        width: 220,
                        child: Text(
                          widget.itens.descri!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xdfffffff)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
