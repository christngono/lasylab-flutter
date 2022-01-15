import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/views/biographie.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _value = 1;

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
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: HexColor("#AFAFAF"),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor(
                          "#1CB0F6",
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/Female_Memojis.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Vanessa",
                  maxLines: 1,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Informations personnelles",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Numéro de téléphone",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ma classe",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ma biographie",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BiographiePage(),
                        ),
                      );
                    },
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Mot de passe",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Mon Parent",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Ecole",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Aide",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FancyButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "À propos de nous",
                              style: GoogleFonts.openSans(
                                color: HexColor("#4B4B4B"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ">",
                              style: GoogleFonts.openSans(
                                color: HexColor("#1CB0F6"),
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    size: 18,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {},
                    duration: const Duration(milliseconds: 160),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "6 77 51 88 62",
                    style: GoogleFonts.openSans(
                      color: HexColor("#1CB0F6"),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
