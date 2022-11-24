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
              child: menuName == 'Todos'
                  ? ListView.builder(
                      itemCount: controller.registersList.length,
                      itemBuilder: (_, index) => Dismissible(
                            key: ValueKey<TotalandCategory>(
                                controller.registersList[index]),
                            direction: DismissDirection.endToStart,
                            background: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Container(
                                  color: Color.fromARGB(162, 244, 67, 54)),
                            ),
                            onDismissed: (direction) =>
                                controller.removePosition(index),
                            child: ItemTransec(
                              controller.registersList[index],
                              key: ValueKey<int>(index),
                            ),
                          ))
                  : menuName == 'Apenas despesas'
                      ? ListView(
                          children: controller.registersList
                              .where((element) => element.type == 'Despesa')
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 8, right: 8),
                                    child: Card(
                                      color: const Color.fromARGB(
                                          220, 104, 89, 205),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  e.formPag,
                                                  style: TextStyle(
                                                    color: Color(0xdfffffff),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 12),
                                                  child: Text(
                                                    e.categoryname ?? '',
                                                    style: TextStyle(
                                                        color: Color(0xdfffffff)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Divider(
                                                height: 4,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${e.valor} R\$',
                                                  style: TextStyle(
                                                      color: Color(0xdfffffff)),
                                                ),
                                                e.icon,
                                                SizedBox(
                                                  width: 220,
                                                  child: Text(
                                                    e.descri,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xdfffffff)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      : ListView(
                          children: controller.registersList
                              .where((element) => element.type == 'Receita')
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 8, right: 8),
                                    child: Card(
                                      color: const Color.fromARGB(
                                          220, 104, 89, 205),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  e.formPag,
                                                  style: TextStyle(
                                                    color: Color(0xdfffffff),
                                                  ),
                                                ),
                                                Text(
                                                  e.categoryname ?? '',
                                                  style: TextStyle(
                                                      color: Color(0xdfffffff)),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Divider(
                                                height: 4,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${e.valor} R\$',
                                                  style: TextStyle(
                                                      color: Color(0xdfffffff)),
                                                ),
                                                e.icon,
                                                SizedBox(
                                                  width: 220,
                                                  child: Text(
                                                    e.descri,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xdfffffff)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ));
        }),
      ),
    );
  }
}
