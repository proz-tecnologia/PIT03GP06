import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/view/historic/widgets/totaltransection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/transactions_controller.dart';
import '../../../controllers/transactions_form_controller.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

String menuName = 'Todos';

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    final TransactionController drop = TransactionController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 40,
            centerTitle: true,
            title: DropdownButtonFormField(
              dropdownColor: darkFunctionWidgets(),
              iconEnabledColor: const Color.fromARGB(207, 255, 255, 255),
              elevation: 16,
              style: const TextStyle(
                color: Color.fromARGB(207, 255, 255, 255),
              ),
              hint: const Text(
                'Listar por',
                style: TextStyle(color: Color.fromARGB(207, 255, 255, 255)),
              ),
              items: drop.historicform
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (a) {
                menuName = a ?? '';
                setState(() {});
              },
            )),
        body:
            Consumer<TransactionsController>(builder: (context, controller, _) {
          return controller.registersList.isEmpty
              ? Center(
                  child: Text('Não há transações',
                      style: TextStyle(color: darkFunctionTexts())))
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      itemCount: controller.registersList
                          .where((element) =>
                              element.type ==
                              (menuName == 'Todos' ? element.type : menuName))
                          .length,
                      itemBuilder: (context, index) => Dismissible(
                            key: ValueKey(controller.registersList
                                .where((element) =>
                                    element.type ==
                                    (menuName == 'Todos'
                                        ? element.type
                                        : menuName))
                                .toList()[index]
                                .id),
                            direction: DismissDirection.endToStart,
                            background: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                  color:
                                      const Color.fromARGB(162, 244, 67, 54)),
                            ),
                            onDismissed: (direction) {
                              var id = controller.registersList
                                  .where((element) =>
                                      element.type ==
                                      (menuName == 'Todos'
                                          ? element.type
                                          : menuName))
                                  .toList()[index]
                                  .id;
                              controller.removeByID(id!);
                              controller.removePorcentChart(id);
                            },
                            child: ItemTransec(
                              controller.registersList
                                  .where((element) =>
                                      element.type ==
                                      (menuName == 'Todos'
                                          ? element.type
                                          : menuName))
                                  .toList()[index],
                              key: ValueKey<int>(index),
                            ),
                          )));
        }),
      ),
    );
  }
}
