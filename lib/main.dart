import 'Acceuil.dart';
import 'package:flutter/material.dart';
import 'Inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formulaire',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CONNEXION'),
      routes: {
        '/acc': (context) => Acceuil(),
        '/ins': (context) => Inscription(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = " ";
  String mail = " ";
  String mdp = " ";
  String error = " ";
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
                    'CONNEXION',
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
                height: 100,
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
                height: 100,
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
                height: 100,
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
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (name.isNotEmpty ||
                          mail.isNotEmpty ||
                          mdp.isNotEmpty) {
                        setState(() {
                          error = "remplire tous les champs svp!!";
                        });
                      } //else if (mail.contains('@')) {
                      //   error = "email incorret!!";
                      // }

                      else {
                        Navigator.pushNamed(context, '/acc');
                      }
                    },
                    child: Text(
                      'connexion',
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
                  Text('vous n\'avez pas de compte?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'inscription!!',
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
