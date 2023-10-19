import 'package:calculadora_imc_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //variaveis de controle

  var usuarioController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");

  bool isObscureText = true;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8, 
                    child: Image.asset("lib/images/Logo.jpg"),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 100,),
              //usuario
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                alignment: Alignment.center,
                child: TextField(
                  controller: usuarioController,
                  onChanged: (value){
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 164, 255, 164))
                      
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 164, 255, 164))
                    ),
                    hintText: "Usuario",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 164, 255, 164),
                  ),
                ),
              )
          ),
          const SizedBox( height: 25),

          //senha
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 30,
              alignment: Alignment.center,
              child: TextField(
                controller: senhaController,
                obscureText: isObscureText,
                onChanged: (value){
                  debugPrint(value);
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 164, 255, 164))),

                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 164, 255, 164))),

                  hintText: "Senha",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 164, 255, 164)),

                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 164, 255, 164),
                    ),
                  )
              ),
            )
          ),

          const SizedBox(height: 45),
          
          //botao
          
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 30,
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (usuarioController.text.trim() == "adm" && 
                    senhaController.text.trim() == "123") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("erro login"))
                    );                          
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
                child: const Text('Entrar', 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16, 
                    fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),               
            height: 30,
            alignment: Alignment.center,
            child: const Text("Esqueci minha senha",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),               
            height: 30,
            alignment: Alignment.center,
            child: const Text("Criar conta",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 50,
          )
          ],
          ),
        ),
        ),
      ),
    );
  }
}