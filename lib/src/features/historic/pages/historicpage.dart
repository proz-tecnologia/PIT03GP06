import 'package:ctrl_real/src/features/extension/extension_double.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/providercontrolers/history_page_controller.dart';
import '../../../controllers/providercontrolers/transections_controller.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

String menuName = 'Todos';

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    final TransactionController controller = TransactionController();

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
              items: controller.historicform
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
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView(
                  children: menuName == 'Todos'
                      ? controller.transactionList
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, left: 8, right: 8),
                                child: Card(
                                  color:
                                      const Color.fromARGB(220, 104, 89, 205),
                                  child: ListTile(
                                    title: Text(
                                      e.formPag,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xdfffffff),
                                      ),
                                    ),
                                    subtitle: Text(
                                      e.descricao,
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                    trailing: Text(
                                      '\R\$ ${e.valor.formatBRL}',
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                    leading: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        e.categoryname,
                                        style:
                                            TextStyle(color: Color(0xdfffffff)),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList()
                      : menuName == 'Apenas despesas'
                          ? controller.transactionList
                              .map((e) => ListTile(
                                    title: Text(
                                      e.categoryname,
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                    subtitle: Text(
                                      e.descricao,
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                    trailing: Text(
                                      '${e.valor} R\$',
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                    leading: Text(
                                      e.formPag,
                                      style:
                                          TextStyle(color: Color(0xdfffffff)),
                                    ),
                                  ))
                              .toList()
                          : menuName == 'Apenas receita'
                              ? controller.transactionList
                                  .map((e) => ListTile(
                                        title: Text(
                                          e.categoryname,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        subtitle: Text(
                                          e.descricao,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        trailing: Text(
                                          '${e.valor} R\$',
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        leading: Text(
                                          e.formPag,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                      ))
                                  .toList()
                              : controller.transactionList
                                  .map((e) => ListTile(
                                        title: Text(
                                          e.categoryname,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        subtitle: Text(
                                          e.descricao,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        trailing: Text(
                                          '${e.valor} R\$',
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                        leading: Text(
                                          e.formPag,
                                          style: const TextStyle(
                                              color: Color(0xdfffffff)),
                                        ),
                                      ))
                                  .toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
