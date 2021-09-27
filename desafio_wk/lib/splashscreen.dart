import 'dart:async';
import 'package:desafio_wk/views/NovaPessoa.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:palitinho/Splash/homepage.dart';


class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NovaPessoa()));
    });
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [

        /*  SizedBox(height: 200.0),
          SpinKitHourGlass(
          color: Colors.greenAccent[700],
          size: 50.0,
        ) */]
      )
    );
  }
}