import 'package:ctrl_real/src/view/tutorial/widgets/custom_button.dart';
import 'package:ctrl_real/src/view/tutorial/widgets/custom_jump.dart';
import 'package:ctrl_real/src/view/tutorial/widgets/custom_paginator.dart';
import 'package:ctrl_real/src/view/tutorial/widgets/custom_slide.dart';
import 'package:ctrl_real/src/view/userregister/pages/check_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingApp extends StatefulWidget {
  const OnBoardingApp({super.key});

  @override
  State<OnBoardingApp> createState() => _OnBoardingAppState();
}

class _OnBoardingAppState extends State<OnBoardingApp> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(220, 104, 89, 205),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              physics: const ClampingScrollPhysics(),
              children: const [
                CustomSlide(
                  imagem: 'asset/img/controle.png',
                  titulo: "Controle real de suas finanças",
                  texto:
                      "Acesse seu saldo atual, histórico do mês atual e anteriores. Saiba em qual categoria você mais gasta mensalmente.",
                ),
                CustomSlide(
                  imagem: 'asset/img/lugar.png',
                  titulo: "Onde estiver",
                  texto:
                      "Registre suas compras, pagamentos e rendas extras diariamente.\nDe forma simples e rápida!",
                ),
                CustomSlide(
                  imagem: 'asset/img/temas.png',
                  titulo: "Ganhe XP e libere temas",
                  texto:
                      "Vida financeira saudável = Conquistas!\nNos primeiros 5 registros diários você ganhará XP para subir de nível e desbloquear novos temas. Deixe o app com sua cara!",
                ),
                CustomSlide(
                  imagem: 'asset/img/dicas.png',
                  titulo: "A gente te ajuda",
                  texto:
                      "Na aba Dicas, vamos te apresentar conteúdos gratuitos de especialistas em finanças pessoais!\nClique nas imagens para abrir cada conteúdo e aproveite =D",
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaginator(page: _currentPage),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    titulo: _currentPage == 3 ? 'Finalizar' : 'Continuar',
                    irParaPaginaInicial:
                        _currentPage == 3 ? irParaPaginaInicial : proximoCard,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomJump(
                      titulo: _currentPage == 3 ? '' : "Pular introdução",
                      irParaPaginaInicial: irParaPaginaInicial),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void irParaPaginaInicial() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const CheckPage()));

    _setEstado();
  }

  void proximoCard() {
    _pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  _setEstado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool ativo = prefs.getBool('ativo') ?? false;

    if (!ativo) {
      await prefs.setBool('ativo', true);
    }
  }
}
