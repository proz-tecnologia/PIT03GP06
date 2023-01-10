import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';

class Dicaswidget extends StatelessWidget {
  const Dicaswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 16, right: 16),
      child: AnimatedBuilder(
          animation: DarkController.instance,
          builder: (BuildContext context, Widget? child) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[0.8],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 32,
                  child: const Center(
                      child: Text(
                    Strings.nameDicasContainer,
                    style: TextStyle(fontSize: 24, color: Color(0xdfffffff)),
                  )),
                ),
                const SizedBox(height: 2),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      child: ExpansionTile(
                        collapsedBackgroundColor: darkFunctionWidgets(),
                        backgroundColor: darkFunctionWidgets(),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        leading: const Icon(
                          Icons.lightbulb,
                          color: Colors.yellow,
                        ),
                        title: const Text(
                          'Controle Financeiro',
                          style: TextStyle(
                              color: Color.fromARGB(207, 255, 255, 255)),
                        ),
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Crie um controle financeiro: seja por aplicativo ou por planilha, a recomendação é anotar, o máximo que conseguir, o que entrou e saiu da sua conta.',
                              style: TextStyle(
                                  color: Color.fromARGB(207, 255, 255, 255)),
                            ),
                          )
                        ],
                      ),
                    ),
                    ExpansionTile(
                      collapsedBackgroundColor: darkFunctionWidgets(),
                      backgroundColor: darkFunctionWidgets(),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      leading: const Icon(
                        Icons.lightbulb,
                        color: Colors.yellow,
                      ),
                      title: const Text(
                        'Despesas Fixas',
                        style: TextStyle(
                            color: Color.fromARGB(207, 255, 255, 255)),
                      ),
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Saiba suas despesas fixas e variáveis: conta de água, luz, internet e até aquele dinheiro emprestado com um amigo. Com isso, você saberá cortar o que não tem necessidade e até encontrar soluções mais em conta',
                            style: TextStyle(
                                color: Color.fromARGB(207, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                      child: ExpansionTile(
                        collapsedBackgroundColor: darkFunctionWidgets(),
                        backgroundColor: darkFunctionWidgets(),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        leading: const Icon(
                          Icons.lightbulb,
                          color: Colors.yellow,
                        ),
                        title: const Text(
                          'Meta Realista',
                          style: TextStyle(
                              color: Color.fromARGB(207, 255, 255, 255)),
                        ),
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Defina uma meta realista: por fim, mas não menos importante, saiba quanto é preciso ter para chegar na meta que definiu. Considere todas as suas anotações e tente ser realista para não se frustrar, combinado?',
                              style: TextStyle(
                                  color: Color.fromARGB(207, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
