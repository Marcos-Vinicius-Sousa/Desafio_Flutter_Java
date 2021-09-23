import 'package:desafio_wk/views/Home.dart';
import 'package:flutter/material.dart';

import 'NovaPessoa.dart';


class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {

  void cadastrar() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NovaPessoa()));
  }

  void home() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()));
  }





  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                home();
              },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text("Cadastrando nova pessoa"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Buscar"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {

              },
            ),
          ],
        )
    );
  }
}
