import 'package:ctrl_real/src/model/registers_model.dart';
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
            color: const Color.fromARGB(220, 104, 89, 205),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.itens.formPag,
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
                        style: const TextStyle(color: Color(0xdfffffff)),
                      ),
                      widget.itens.icon,
                      SizedBox(
                        width: 220,
                        child: Text(
                          widget.itens.descri,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xdfffffff)),
                        ),
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
