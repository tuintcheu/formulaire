import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Accueil'),
        actions: [],
      ),
      backgroundColor: Colors.white,
      body: Column(
        //
        children: [
          SizedBox(
            width: 150,
            height: 150,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'BIENVENUE MONSIEUR \n\n\t\t\t\t\t\t\t\t\t\t\t PHAFA!!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/acc.jpg',
            width: 200,
            height: 150,
          ),
          SizedBox(
            width: 200,
            height: 173,
          ),
          // MenuBar(children: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, "/acc");
          //     },
          //     icon: Icon(Icons.home),
          //     tooltip: 'ACCUEIL',
          //   ),
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pushNamed(context, "/pro");
          //       },
          //       icon: Icon(Icons.info)),
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pushNamed(context, "/con");
          //       },
          //       icon: Icon(Icons.contact_page)),
          // ]),
        ],
      ),
    );
  }
}
