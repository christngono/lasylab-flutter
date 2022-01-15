import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/views/menu.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Félicitations\nQuiz terminé !",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: HexColor("#FF6711"),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/excellent.png"),
            ),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/correct.png"),
            ),
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/mark.png"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40,
              top: 8.0,
            ),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Voir les reponses",
                    style: GoogleFonts.openSans(
                      color: HexColor("#1CB0F6"),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: HexColor("#FFFFFF"),
                onPressed: () {},
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40,
              top: 8.0,
              bottom: 20,
            ),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: FancyButton(
                child: Center(
                  child: Text(
                    "Continuer",
                    style: GoogleFonts.openSans(
                      color: HexColor("#FFFFFF"),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                size: 18,
                color: HexColor("#1CB0F6"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/menu");
                },
                duration: const Duration(milliseconds: 160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
