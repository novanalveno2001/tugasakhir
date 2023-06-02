import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tugasakhir/login/loginpage.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.all(16)
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Selamat Datang ,',
          body: 'Cari Buku apapun pasti ada dan jelas lebih murah dari yang lain.',
          image: Image.asset('assets/sosmed/logolauncher.png', width: 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Diva Press Jogja',
          body: 'Merupakan Perusahaan penerbit buku terbesar & terlaris se - Yogyakarta. ',
          image: Image.asset('assets/sosmed/diva_press.png', width: 300),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Penerbit Buku Terbesar di Yogyakarta',
          body: 'Merupakan Perusahaan penerbit buku terbesar & terlaris se - Yogyakarta. ',
          image: Image.asset('assets/sosmed/diva_press.png', width: 300),
          decoration: pageDecoration,
          footer: RaisedButton(
            color: Colors.red.shade900,
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }, 
              child: Text('Get Started', style: GoogleFonts.alike(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
      onDone: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      dotsFlex: 3,
      nextFlex: 1,
      skipOrBackFlex: 1,
      back: Icon(Icons.arrow_back),
      skip: Text('Skip', style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.red.shade900)),
      next: Icon(Icons.arrow_forward, color: Colors.red.shade900),
      done: Text('Done', style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.red.shade900)),
      dotsDecorator: DotsDecorator(
        size: Size(10,10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        )
      ),
    );
  }
}
