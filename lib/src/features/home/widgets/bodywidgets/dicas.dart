import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';

class Dicaswidget extends StatelessWidget {
  const Dicaswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 2, right: 2),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: DarkController.instance.darkmod
                        ? const Color.fromARGB(213, 19, 19, 19)
                        : const Color.fromARGB(220, 104, 89, 205),
                    boxShadow: kElevationToShadow[0.8],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 32,
                  child: const Center(
                      child: Text(
                    "Dicas",
                    style: TextStyle(fontSize: 24, color: Color(0xdfffffff)),
                  )),
                ),
                const SizedBox(height: 2),
                Container(
                    decoration: BoxDecoration(
                      color: DarkController.instance.darkmod
                          ? const Color.fromARGB(213, 19, 19, 19)
                          : const Color.fromARGB(220, 104, 89, 205),
                      boxShadow: kElevationToShadow[4],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    height: 148,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          ExpansionTile(
                            iconColor: Colors.white,
                            collapsedIconColor: Colors.white,
                            leading: Icon(
                              Icons.lightbulb,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              'Dica 1',
                              style: TextStyle(
                                  color: Color.fromARGB(207, 255, 255, 255)),
                            ),
                            children: <Widget>[
                              Text(
                                  'Blaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
                            ],
                          ),
                          ExpansionTile(
                            iconColor: Colors.white,
                            collapsedIconColor: Colors.white,
                            leading: Icon(
                              Icons.lightbulb,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              'Dica 2',
                              style: TextStyle(
                                  color: Color.fromARGB(207, 255, 255, 255)),
                            ),
                            children: <Widget>[
                              Text(
                                  'Blaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
                            ],
                          ),
                          ExpansionTile(
                            iconColor: Colors.white,
                            collapsedIconColor: Colors.white,
                            leading: Icon(
                              Icons.lightbulb,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              'Dica 3',
                              style: TextStyle(
                                  color: Color.fromARGB(207, 255, 255, 255)),
                            ),
                            children: <Widget>[
                              Text(
                                'Blaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
