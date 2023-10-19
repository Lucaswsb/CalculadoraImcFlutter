
import 'package:calculadora_imc_flutter/pages/calculadora_page.dart';
import 'package:calculadora_imc_flutter/pages/tabela_page.dart';
import 'package:calculadora_imc_flutter/utils/utils.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  var oi = ControleDaPagina();

  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), 
            bottomRight: Radius.circular(10),
          ),
          ),
        title: Center(
          child: SizedBox(
            height: 50,
            child: Image.asset("lib/images/Logo.jpg")
          ),
        ),       
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(           
            child: PageView(
              controller: oi.controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: [
                CalculadoraPage(),
                TabelaPage()
              ],
            ) 
          ),
          BottomNavigationBar(
            onTap: (value) {
              oi.controller.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const [
            BottomNavigationBarItem(label: "Calculadora",icon: Icon(Icons.calculate)),
            BottomNavigationBarItem(label: "Tabela",icon: Icon(Icons.info)),
          ],),
        ],       
      ),
    )
  );
  }
}