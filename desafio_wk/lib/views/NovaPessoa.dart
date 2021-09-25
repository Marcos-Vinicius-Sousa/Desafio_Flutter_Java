

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NovaPessoa extends StatefulWidget {
  const NovaPessoa({Key? key}) : super(key: key);

  @override
  _NovaPessoaState createState() => _NovaPessoaState();
}

class _NovaPessoaState extends State<NovaPessoa> {

  final _formKey = GlobalKey<FormState>();
  //List<File> _listaImagens = List();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();


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
                  controller: _nomeController,
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
                  controller: _nomeController,
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
              child: TextField(
                  controller: _dataController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data de Nascimento'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    DataInputFormatter()

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

class DataInputFormatter {
}
