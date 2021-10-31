import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/views/account_choice.dart';
import 'package:lasylab_mobile_app/views/menu.dart';
import 'package:lasylab_mobile_app/views/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.88,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: HexColor("#D2E4E8"),
                    ),
                  ),
                  child: Center(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 8.0,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: BackButton(
                              color: HexColor("#AFAFAF"),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: Container(
                              height: screenSize.height * 0.036,
                              width: screenSize.width * 0.26,
                              child: Image.asset(
                                "assets/images/splash.png",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Connecte-toi",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: SizedBox(
                                width: screenSize.width * 0.9,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Nom d'utilisateur",
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                                bottom: 10,
                              ),
                              child: SizedBox(
                                width: screenSize.width * 0.9,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.grey,
                                    ),
                                    labelText: "Mot de passe utilisateur",
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Mot de passe oublié ? 😥",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                            top: 50,
                          ),
                          child: SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: FancyButton(
                              child: Center(
                                child: Text(
                                  "je me connecte",
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              size: 18,
                              color: HexColor("#58CC02"),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed("/account_choice");
                              },
                              duration: const Duration(milliseconds: 160),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    text: 'Tu as déjà un compte ? ',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'inscris-toi ici !',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed("/register");
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
