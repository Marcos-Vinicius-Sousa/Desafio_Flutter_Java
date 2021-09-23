import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Inputcustomizado extends StatelessWidget {

  final TextEditingController controller;
  final String hint;

  //final bool obscure;
  final bool autofocus;
  final TextInputType type;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final Function(String) validator;
  final Function(String) onSaved;

  Inputcustomizado({
    required this.controller,
    required this.hint,
    //this.obscure = false,
    this.autofocus = false,
    this.type = TextInputType.text, required this.maxLines, required this.inputFormatters, required this.validator, required this.onSaved,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //obscureText: this.obscure,
      controller: this.controller,
      autofocus: this.autofocus,
      keyboardType: this.type,
      inputFormatters: this.inputFormatters,
      maxLines: this.maxLines,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
