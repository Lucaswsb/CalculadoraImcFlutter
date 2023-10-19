import 'package:flutter/material.dart';


class TabelaPage extends StatefulWidget {
  const TabelaPage({super.key});

  @override
  State<TabelaPage> createState() => _TabelaPageState();
}

class _TabelaPageState extends State<TabelaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        const SizedBox(height: 100,),

        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Image.asset("lib/images/TabelaImc.jpg"),
        )
      ],
    ); 
  
  }
}