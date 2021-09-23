import 'dart:html';

import 'package:flutter/material.dart';

class NovaPessoa extends StatefulWidget {
  const NovaPessoa({Key? key}) : super(key: key);

  @override
  _NovaPessoaState createState() => _NovaPessoaState();
}

class _NovaPessoaState extends State<NovaPessoa> {

  final _formKey = GlobalKey<FormState>();
  List<File> _listaImagens = List();
  BuildContext _dialogContext;

  _selecionarImagemGaleria() async {
    File imagemSelecionada = await ImagePicker.pickImage(
        source: ImageSource.gallery);

    if (imagemSelecionada != null) {
      setState(() {
        _listaImagens.add(imagemSelecionada);
      });
    }
  }

  _abriDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Salvando Anúncio...")
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
