import 'dart:html';

import 'package:flutter/material.dart';

import 'BotaoCustomizado.dart';
import 'Inputcustomizado.dart';
import 'MenuLateral.dart';

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
                Text("Salvando Pessoa...")
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrando Pessoa"),
        centerTitle: true,
      ),
      drawer: MenuLateral(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //area de imagens
                FormField<List>(
                  initialValue: _listaImagens,
                  validator: (imagens) {
                    if (imagens!.length == 0) {
                      return "Necessário selecionar uma imagem.";
                    }
                    return null;
                  },
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
                                                        _listaImagens![indice]),
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
                ),
                // Menus Dropdown

                ],),
                //Caixas de Textos e Botoes
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  child: Inputcustomizado(
                    hint: "Título",
                    onSaved: (titulo) {

                    }
                    validator: (valor) {
                      return Validador().add(
                          Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                          .valido(valor);
                    }, controller: null,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Inputcustomizado(
                    hint: "Sexo",
                    onSaved: (_) {

                    },
                    type: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true)
                    ],
                    validator: (valor) {
                      return Validador().add(
                          Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                          .valido(valor);
                    }, controller: ,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Inputcustomizado(
                    hint: "Enderenço",
                    onSaved: (_) {

                    },

                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    validator: (valor) {
                      return Validador().add(
                          Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                          .valido(valor);
                    },
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Inputcustomizado(
                    hint: "",
                    maxLines: null,
                    onSaved: () {

                    },
                    validator: (valor) {
                      return Validador().add(Validar.OBRIGATORIO,
                          msg: "Campo Obrigatório")
                          .maxLength(500, msg: "Máximo de 300 caracteres")
                          .valido(valor);
                    }, controller: null,
                  ),
                ),
                children: [
                  BotaoCustomizado(
                      texto: "Cadastrar Anúncio",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //salvar campos
                          _formKey.currentState!.save();

                          //Configurando dialog context
                          _dialogContext = context;


                        }
                      }
                  ),
                ]
              ],
            ),
          ),
        );


  }
}


