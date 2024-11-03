import 'package:flutter/material.dart';
import 'Acceuil.dart';
import 'main.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formulaire',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Imcription(title: 'CONNEXION'),
      initialRoute: '/',
      routes: {
        '/acc': (context) => Acceuil(),
        '/con': (context) => MyHomePage(
              title: 'me',
            ),
      },
    );
  }
}

class Imcription extends StatefulWidget {
  const Imcription({super.key, required this.title});

  final String title;

  @override
  State<Imcription> createState() => _ImcriptionState();
}

class _ImcriptionState extends State<Imcription> {
  String name = " ";
  String mail = " ";
  String mdp = " ";
  String error = " ";
  String mdp1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'PHAFA_entrepise',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: 600,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'INSCRIPTION',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              //Image.asset('assets/connexion.jpg'),
              Container(
                width: 300,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'name',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black)),
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
              Container(
                width: 300,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text) {
                    mail = text;
                  },
                ),
              ),
              Container(
                width: 300,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      )),
                  obscureText: true,
                  onChanged: (text) {
                    mdp = text;
                  },
                ),
              ),
              Container(
                width: 300,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'confirm password',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Colors.black,
                      )),
                  obscureText: true,
                  onChanged: (text) {
                    mdp = text;
                  },
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (name.isNotEmpty ||
                            mail.isNotEmpty ||
                            mdp.isNotEmpty ||
                            mdp1.isEmpty) {
                          error = "remplire tous les champs svp!!";
                        } else if (mdp1 != mdp) {
                          error = "mot de passe different!!!";
                        } else {
                          Navigator.pushNamed(context, '/acc');
                        }
                      });
                    },
                    child: Text(
                      's\'inscrire',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      minimumSize: WidgetStatePropertyAll(Size(60, 70)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('vous avez deja un compte?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/con');
                      },
                      child: Text(
                        'se connecter!!',
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
