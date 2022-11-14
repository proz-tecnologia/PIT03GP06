import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/providercontrolers/history_page_controller.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HistoryController>(builder: (context, controller, __) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(
                children: controller.transactionList
                    .map((e) => ListTile(
                          title: Text(e.descri),
                          subtitle: Text(e.categoryname),
                          trailing: Text(e.valor.toString()),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
