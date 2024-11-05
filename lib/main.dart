import 'Acceuil.dart';
import 'package:flutter/material.dart';
import 'Inscription.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formulaire',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CONNEXION'),
      initialRoute: '/',
      routes: {
        '/acc': (context) => Acceuil(),
        '/ins': (context) => Inscription(),
        '/con': (context) => MyHomePage(
              title: 'me',
            ),
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
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String mail = '';
  String mdp = '';
  String error1 = '';
  String errorName = '';
  String errorEmail = '';
  String errorPassword = '';
  String errorDate = '';
  DateTime? _selectedDate;

  void _submitForm() {
    setState(() {
      errorName = '';
      errorEmail = '';
      errorPassword = '';
      errorDate = '';
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(context, '/acc');
    } else {
      setState(() {
        error1 = "Veuillez corriger les erreurs ci-dessous";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'PHAFA_entreprise',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: 650,
          width: 350,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CONNEXION',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  error1,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (text) {
                      name = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre nom';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Veuillez entrer un email valide';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      mail = text;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    obscureText: true,
                    onChanged: (text) {
                      mdp = text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le mot de passe';
                      }
                      return null;
                    },
                    //minLines: 8,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Date de naissance',
                          hintText: 'yyyy-mm-dd',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        validator: (value) {
                          if (_selectedDate == null) {
                            return 'Veuillez sélectionner une date de naissance';
                          }
                          final age = DateTime.now().year - _selectedDate!.year;
                          if (age < 18) {
                            return 'Vous devez avoir au moins 18 ans';
                          }
                          return null;
                        },
                        controller: TextEditingController(
                          text: _selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                              : '',
                        ),
                      ),
                      if (errorDate.isNotEmpty)
                        Text(
                          errorDate,
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Connexion',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(60, 40),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous n\'avez pas de compte?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ins');
                      },
                      child: Text(
                        'Inscription!!',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
