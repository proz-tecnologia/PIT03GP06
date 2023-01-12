import 'package:flutter/material.dart';

class CustomPaginator extends StatelessWidget {
  const CustomPaginator({super.key, required this.page});

  final int page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.all(4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  color: index == page
                      ? const Color.fromARGB(255, 20, 195, 26)
                      : Colors.white,
                  shape: BoxShape.circle),
            );
          }),
        ),
      ],
    );
  }
}
