import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tips extends StatelessWidget {
  Tips({super.key});

  final Uri _urlPodcast = Uri.parse(
      'https://plataforma.meubolsoemdia.com.br/?gclid=CjwKCAiArY2fBhB9EiwAWqHK6oWQCBu656VahBn8rKX2XeoFWmKND-hAmPSToo51OK8D28c-CqNFnRoC25gQAvD_BwE');
  final Uri _urlEbook = Uri.parse(
      'https://www.amazon.com.br/Guia-financeiro-para-quem-sozinho-ebook/dp/B01M1OGZKO/ref=sr_1_1?qid=1674125483&refinements=p_lbr_books_series_browse-bin%3AFinan%C3%A7as+pessoais&s=digital-text&sr=1-1');
  final Uri _urlVideo =
      Uri.parse('https://www.youtube.com/watch?v=hTV34V2ljRk');

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
                Container(
                  decoration: BoxDecoration(
                    color: darkFunctionWidgets(),
                    boxShadow: kElevationToShadow[0.8],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('asset/img/dicas.png'),
                          ),
                          GestureDetector(
                              onTap: () {
                                launchUrl(_urlPodcast);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('asset/img/curso.png'),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('asset/img/dicas.png'),
                          ),
                          GestureDetector(
                              onTap: () {
                                launchUrl(_urlEbook);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('asset/img/ebook.jpg'),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('asset/img/dicas.png'),
                          ),
                          GestureDetector(
                              onTap: () {
                                launchUrl(_urlVideo);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('asset/img/video.PNG'),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('asset/img/dicas.png'),
                          ),
                        ]),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
