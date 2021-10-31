import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/course_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          centerTitle: false,
          elevation: 2,
          backgroundColor: Colors.white,
          leadingWidth: 140,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/ruby.png"),
                  ),
                  Text(
                    "2",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/profil");
                },
                child: CircleAvatar(
                  child: Image.asset("assets/images/avatar.png"),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Center(
                child: DropdownButton(
                  underline: SizedBox(),
                  onChanged: (value) {},
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Seconde",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Première",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Terminale",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      value: 3,
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: screenSize.width * 0.7,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        HexColor("#FFD900"),
                      ),
                      backgroundColor: HexColor("#E1E1E1"),
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  CourseItem(
                    courseName: "Mathématiques",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/maths_icon.png",
                    progression: 0.8,
                  ),
                  CourseItem(
                    courseName: "Français",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/Book.png",
                    progression: 0.8,
                  ),
                  CourseItem(
                    courseName: "SVT",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/Bocal.png",
                    progression: 0.8,
                  ),
                  CourseItem(
                    courseName: "Philosophie",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/Edit.png",
                    progression: 0.8,
                  ),
                  CourseItem(
                    courseName: "Informatique",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/computer.png",
                    progression: 0.8,
                  ),
                  CourseItem(
                    courseName: "Anglais",
                    backgroundColor: HexColor("#1CB1FB"),
                    image: "assets/images/English.png",
                    progression: 0.8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
