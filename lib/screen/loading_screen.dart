import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/home.dart';
import 'package:cool_alert/cool_alert.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => Home()
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade900,
          width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'assets/sosmed/logolauncher.png',
              width: 50,
                height: 50 ,
            ),
            Text(
                'Loading...',
              style: GoogleFonts.arsenal(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
