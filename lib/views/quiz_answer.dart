import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/views/congratulation.dart';

class QuizAnswer extends StatefulWidget {
  const QuizAnswer({Key? key}) : super(key: key);

  @override
  _QuizAnswerState createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: HexColor("#AFAFAF"),
            ),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width * 0.9,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: 0.33,
                valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor("#58CC02"),
                ),
                backgroundColor: HexColor("#E5E5E5"),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "c’est quoi une équation de second degré ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 50,
                  bottom: 8.0,
                ),
                child: SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    child: Text(
                      "Reponse A",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    child: Text(
                      "Reponse B",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    child: Text(
                      "Reponse C",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    child: Text(
                      "Reponse D",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 45,
                ),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Text(
                        "Continuer",
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    size: 18,
                    color: HexColor("#58CC02"),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        barrierColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                            height: screenSize.height * 0.30,
                            color: HexColor("#FFDFE0"),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      top: 10,
                                      bottom: 20,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Mauvais !",
                                        style: GoogleFonts.openSans(
                                          color: HexColor("#FF4B4B"),
                                          textStyle: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30,
                                      top: 10,
                                      bottom: 5,
                                    ),
                                    child: SizedBox(
                                      height: 45,
                                      width: double.infinity,
                                      child: FancyButton(
                                        child: Center(
                                          child: Text(
                                            "Continuer",
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              textStyle: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        size: 18,
                                        color: HexColor("#FF4B4B"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("/congratulations");
                                        },
                                        duration:
                                            const Duration(milliseconds: 160),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
