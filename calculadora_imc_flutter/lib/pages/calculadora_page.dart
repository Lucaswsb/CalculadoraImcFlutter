
import 'package:calculadora_imc_flutter/repositories/imc_repositories.dart';
import 'package:flutter/material.dart';

import '../classes/imc.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {

  var classificacao = 'Resultado: ';

  var imcRepository = ImcRepository();

  var _imc = const <Imc> []; 
  
  var pesoController = TextEditingController();

  var alturaController = TextEditingController();


  void _calculate() {
    double peso = double.parse(pesoController.text);
    double altura =double.parse(alturaController.text) /100;

    double imc = peso / (altura*altura);

    setState(() {
     if (imc < 16) {
       classificacao = 'Magreza grave (${imc.toStringAsPrecision(3)})';
    } else if (imc >= 16 && imc < 17) {
       classificacao = 'Magreza moderada (${imc.toStringAsPrecision(3)})';
      
    } else if(imc >= 17 && imc < 18.5){
       classificacao = 'Magreza leve (${imc.toStringAsPrecision(3)}) ';
      
    } else if (imc >= 18.5 && imc < 25) {
       classificacao = 'Saudavel (${imc.toStringAsPrecision(3)})';
       imcRepository.adicionar(Imc(imc));
     
    } else if (imc >= 25 && imc < 30) {
       classificacao = 'Sobrepeso (${imc.toStringAsPrecision(3)})';
      
    } else if (imc >= 30 && imc < 35) {
       classificacao = 'Obesidade grau I (${imc.toStringAsPrecision(3)})';
     
    } else if (imc >= 35 && imc < 40) {
       classificacao = 'Obesidade grau II(severa) (${imc.toStringAsPrecision(3)})';
    } else {
       classificacao = 'Obesidade grau III(mórbida) (${imc.toStringAsPrecision(3)})';
    } 
    });
  }


  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    obterImc();
  }

  void obterImc() async {
    _imc = await imcRepository.listar();
    setState(() {    
    });
  }

  


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(     
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 140),
          
            Container(
              width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: alturaController,
                  onChanged: (value){
                    debugPrint(value);
                  },
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    hintText: "Altura:", 
                    prefixIcon: Icon(Icons.height),
                    suffix: Text('cm'),
                  ),
                ),
            ),
          
            const SizedBox(height: 30),
          
            Container(
              width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: pesoController,
                  onChanged: (value){
                    pesoController.value;
                  },
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    hintText: "peso:", 
                    prefixIcon: Icon(Icons.monitor_weight),
                    suffix: Text('Kg'),
                  ),
                ),
            ),
          
            const SizedBox(height: 45),
          
            Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    if (pesoController.text.trim() == "0" || alturaController.text.trim() == "0") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Numero invalido'))
                      );
                    } else {
                        _calculate();
                        print(_imc.length);
                        setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 164, 255, 164)),
                  ),
                  child: const Text('Calcular IMC',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),     
                ),
              ),
            ),
            
            const SizedBox(height: 35),

            Container(
              width: 200,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(    
                border: Border.all(            
                  color: const Color.fromARGB(255, 164, 255, 164),
                  width: 1.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),            
              child: SizedBox(      
                child: Center(
                  child: Text(
                    '$classificacao',
                   style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),)
                )
              ),
            ),           
          ],
        ),
      ),
    );    
  }
}