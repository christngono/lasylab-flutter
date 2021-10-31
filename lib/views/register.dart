import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  late TextEditingController name;
  late TextEditingController surName;
  late TextEditingController phone;
  late TextEditingController school;
  late TextEditingController password;
  late TextEditingController birthdate;

  late List<TextEditingController> fields;
  @override
  void initState() {
    name = TextEditingController();
    surName = TextEditingController();
    phone = TextEditingController();
    school = TextEditingController();
    password = TextEditingController();
    birthdate = TextEditingController();

    fields = [
      name,
      surName,
      phone,
      school,
      password,
      birthdate,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return HexColor("#AFAFAF");
    }

    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FCF6F4"),
        body: ListView(
          primary: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 12,
                          top: 15,
                        ),
                        child: Container(
                          height: 72,
                          width: 141,
                          child: Image.asset(
                            "assets/images/splash.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Crée ton compte",
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
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: screenSize.width * 0.44,
                                  height: 40,
                                  child: TextField(
                                    controller: name,
                                    decoration: InputDecoration(
                                      labelText: "Nom",
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
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: screenSize.width * 0.44,
                                  height: 40,
                                  child: TextField(
                                    controller: surName,
                                    decoration: InputDecoration(
                                      labelText: "Prenom",
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
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: screenSize.width * 0.9,
                              height: 40,
                              child: TextField(
                                controller: phone,
                                decoration: InputDecoration(
                                  labelText: "Téléphone",
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
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: screenSize.width * 0.9,
                              height: 40,
                              child: TextField(
                                controller: school,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Ecole",
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
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: screenSize.width * 0.9,
                              height: 40,
                              child: TextField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Mot de passe",
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
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: screenSize.width * 0.9,
                              height: 40,
                              child: TextField(
                                controller: birthdate,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2010),
                                        lastDate: DateTime(2025),
                                      ).then((value) {
                                        setState(() {
                                          birthdate.text =
                                              "${DateFormat('yyyy-MM-dd').format(value!)}";
                                        });
                                      });
                                    },
                                    child: Icon(
                                      Icons.date_range,
                                      color: HexColor("#58CC02"),
                                    ),
                                  ),
                                  labelText: "Date de Naissance",
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "j’accepte de recevoir des conseils pédagogique et\ndes offres promotionnelles de lasyalab sms.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isFilled() == true
                          ? Container(
                              color: Colors.white,
                              margin: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 15,
                                bottom: 30,
                              ),
                              child: SizedBox(
                                height: 45,
                                width: double.infinity,
                                child: FancyButton(
                                  child: Center(
                                    child: Text(
                                      "Terminer",
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
                                        .pushNamed("/welcome_fees");
                                  },
                                  duration: const Duration(milliseconds: 160),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20,
              ),
              child: Column(
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "En cliquant sur Terminer, vous acceptez les\nconditions générales d’utilisation et la politique de\nconfidentialité de lasylab",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FittedBox(
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
                                text: 'Connecte-toi!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed("/login");
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isFilled() {
    int check = 0;
    for (var field in fields) {
      if (field.text != "") check++;
    }
    return check == 6;
  }
}
