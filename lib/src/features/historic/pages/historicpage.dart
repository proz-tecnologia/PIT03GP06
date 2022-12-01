import 'package:ctrl_real/src/features/historic/widgets/totaltransection.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/providercontrolers/registers_transections_controller.dart';
import '../../../controllers/providercontrolers/transections_despe_controller.dart';

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
            toolbarHeight: 40,
            centerTitle: true,
            title: DropdownButtonFormField(
              iconEnabledColor: Color(0xdfffffff),
              dropdownColor: const Color.fromARGB(220, 104, 89, 205),
              elevation: 16,
              style: TextStyle(
                color: Color(0xdfffffff),
              ),
              hint: Text(
                'Listar por',
                style: TextStyle(color: Color(0xdfffffff)),
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
        body: Consumer<HistoryController>(builder: (context, controller, __) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: controller.registersList
                      .where((element) =>
                          element.type ==
                          (menuName == 'Todos' ? element.type : menuName))
                      .length,
                  itemBuilder: (context, index) => Dismissible(
                        key: ValueKey<TotalandCategory>(
                            controller.registersList[index]),
                        direction: DismissDirection.endToStart,
                        background: Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Container(
                              color: Color.fromARGB(162, 244, 67, 54)),
                        ),
                        onDismissed: (direction) {
                          var id = controller.registersList
                            .where((element) =>
                            element.type ==
                            (menuName == 'Todos' ? element.type : menuName)).toList()[index].id;
                          controller.removePorcentChart(id);
                          controller.removeByID(id);
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
