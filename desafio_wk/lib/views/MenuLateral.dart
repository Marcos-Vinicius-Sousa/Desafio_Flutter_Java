import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:x_change/views/Avaliacao.dart';
import 'package:x_change/views/Buscar.dart';
import 'package:x_change/views/MeusAnuncios.dart';
import 'package:x_change/views/PedidosTrocas.dart';
import 'package:x_change/views/Perfil.dart';
import 'package:x_change/views/Planos.dart';
import 'package:x_change/views/Sobre.dart';

import 'Anuncios.dart';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {

  void cadastrar() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Cadastrar()));
  }

  void home() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Pessoas()));
  }





  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              subtitle: Text("Pagina Inicial"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                home();
              },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text("Meus Anuncios"),
              subtitle: Text("Crie seu Anuncio"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                meusAnuncios();
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Buscar"),
              subtitle: Text("produtos ou serviços"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                buscar();
              },
            ),

            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Avaliações"),
              subtitle: Text("suas avaliações"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                avaliar();
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text("Sobre"),
              subtitle: Text("Conheça xChange"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                sobre();
              },
            ),
            ListTile(
              leading: Icon(Icons.transit_enterexit),
              title: Text("Sair"),
              subtitle: Text("Deslogar"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _deslogarUsuario();
              },
            ),
          ],
        )
    );
  }
}
