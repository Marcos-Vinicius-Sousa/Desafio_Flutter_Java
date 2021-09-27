

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:validadores/Validador.dart';


class NovaPessoa extends StatefulWidget {
  const NovaPessoa({Key? key}) : super(key: key);

  @override
  _NovaPessoaState createState() => _NovaPessoaState();
}

class _NovaPessoaState extends State<NovaPessoa> {

  final _formKey = GlobalKey<FormState>();
  List<File> _listaImagens = [];
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();

  _selecionarImagemGaleria() async {
    File imagemSelecionada = (await ImagePicker.pickImage(
        source: ImageSource.gallery)) as File;

    if (imagemSelecionada != null) {
      setState(() {
        _listaImagens.add(imagemSelecionada);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio Técnico WK"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              //initialValue: _listaImagens,
              /*validator: (imagens) {
                if (imagens.length == 0) {
                  return "Necessário selecionar uma imagem.";
                }
                return null;
              }, */
              builder: (state) {
                return Column(children: <Widget>[
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listaImagens.length + 1,
                        itemBuilder: (context, indice) {
                          if (indice == _listaImagens.length) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  _selecionarImagemGaleria();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[400],
                                  radius: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.add_a_photo,
                                        size: 40,
                                        color: Colors.grey[100],
                                      ),
                                      Text(
                                        "Adicionar",
                                        style: TextStyle(
                                            color: Colors.grey[100]
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          if (_listaImagens.length > 0) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          Dialog(
                                            child: Column(
                                              mainAxisSize: MainAxisSize
                                                  .min,
                                              children: <Widget>[
                                                Image.file(
                                                    _listaImagens[indice]),
                                                FlatButton(
                                                  child: Text("Excluir"),
                                                  textColor: Colors.red,
                                                  onPressed: () {
                                                    setState(() {
                                                      _listaImagens
                                                          .removeAt(indice);
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          )
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(
                                      _listaImagens[indice]),
                                  child: Container(
                                    color: Color.fromRGBO(
                                        255, 255, 255, 0.4),
                                    alignment: Alignment.center,
                                    child: Icon(
                                        Icons.delete, color: Colors.red),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        }),
                  ),
                  if(state.hasError)
                    Container(
                      child: Text("[${state.errorText}]",
                        style: TextStyle(
                            color: Colors.red, fontSize: 14
                        ),
                      ),

                    )
                ],
                );
              },
              child: TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome'
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Informe o nome da pessoa';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                  controller: _enderecoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Endereço'
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Informe o endereço da pessoa';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                  controller: _sexoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Sexo'
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Informe o sexo da pessoa.';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                  controller: _dataController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data de Nascimento'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,

                  ],
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Informe a data de nascimento';
                    }
                    return null;
                  }
              ),
            ),
            Expanded(child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24.0),
              child:ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){

                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(padding: EdgeInsets.all(15.0)),
                      Text("Salvar",style: TextStyle(
                          fontSize: 30
                      ),)
                    ],
                  )
              ),
            ),flex:1)
          ],
        ),
      )


    );
  }

}
