import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/components/fancy_button.dart';
import 'package:lasylab_mobile_app/components/quizdialog.dart';
import 'package:lasylab_mobile_app/models/question.dart';
import 'package:lasylab_mobile_app/models/quiz.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';
import 'package:lasylab_mobile_app/views/congratulation.dart';
import 'package:logger/logger.dart' as TheLogger;

class QuizAnswer extends StatefulWidget {
  const QuizAnswer({Key? key}) : super(key: key);

  @override
  _QuizAnswerState createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> with TickerProviderStateMixin {
  AnimationController? animationcontroller;
  List<Question>? quest = [];
  String selectedUserResponse = "";
  PageController? pageController;
  int indexpage = 0;
  int nbretrouves = 0;
  double ratio = 0;

  //pour l'audio
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioCache? audioCache;
  String path1 = "audio/duolingo_correct.mp3";
  String path2 = "audio/duolingo_false.mp3";
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    pageController = PageController(initialPage: 0);
    var result = DBService().getQuiz().then((value) {
      if (value != null) {
        //affectation du contenu
        setState(() {
          quest = value.questions;
        });
      } else {
        //erreur
        Fluttertoast.showToast(
            msg: "Erreur",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: HexColor("#58CC02"),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (mounted) {
        setState(() {
          audioPlayerState = s;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontroller!.dispose();
    pageController!.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache!.clearAll();
    super.dispose();
  }

  playMusic(String path) async {
    await audioCache!.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  int i = 0;
  void nextPage() {
    setState(() {
      i++;
      selectedUserResponse = "";
      ratio = i / quest!.length;
      TheLogger.Logger().d(ratio);
    });

    pageController!.animateToPage(pageController!.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
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
            width: screenSize.width,
            height: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: LinearProgressIndicator(
                value: ratio,
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
            child: quest != null && quest!.length != 0
                ? PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: quest!.length,
                    allowImplicitScrolling: false,
                    pageSnapping: false,
                    controller: pageController,
                    onPageChanged: (page) {
                      setState(() {
                        indexpage = page + 1;
                      });
                    },
                    itemBuilder: (context, index) {
                      var q = quest![index];
                      return new ListView(
                        children: [
                          Text(
                            "${q.texte}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          ...q.reponses!
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 30,
                                    child: OutlinedButton(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "${e.etiquette} ) ",
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                textStyle: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${e.texte}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                textStyle: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        primary: Colors.teal,
                                        backgroundColor:
                                            selectedUserResponse == e.id
                                                ? HexColor("#58CC02")
                                                    .withOpacity(.5)
                                                : null,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedUserResponse = e.id!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          SizedBox(height: 50),
                          //bouton Continuer
                          SizedBox(
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
                              onPressed: () async {
                                if (selectedUserResponse.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Veuillez choisir une réponse",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 4,
                                      backgroundColor: HexColor("#58CC02"),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  if (selectedUserResponse == q.correct!.id) {
                                    setState(() {
                                      nbretrouves = nbretrouves + 1;
                                    });
                                    await playMusic(path1);
                                    showModalBottomSheet<void>(
                                        context: context,
                                        isDismissible: false,
                                        builder: (BuildContext context) {
                                          return QuizDialog(
                                            height: screenSize.height * .2,
                                            backgroundcolor: HexColor("#58CC02")
                                                .withOpacity(.1),
                                            foregroundcolor: HexColor("#58CC02")
                                                .withOpacity(.8),
                                            texte: "Bonne réponse",
                                            onpress: () {
                                              if (indexpage == quest!.length) {
                                                TheLogger.Logger().d(
                                                    "nbretrouves $nbretrouves : nbretotal $indexpage");

                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Congratulations(
                                                            nbretrouves:
                                                                nbretrouves,
                                                            nbretotal:
                                                                indexpage,
                                                            questions: quest,
                                                          )),
                                                  (route) => false,
                                                );
                                              } else {
                                                Navigator.pop(context);
                                                nextPage();
                                              }
                                            },
                                          );
                                        });
                                  } else {
                                    await playMusic(path2);
                                    showModalBottomSheet<void>(
                                        context: context,
                                        isDismissible: false,
                                        builder: (BuildContext context) {
                                          return QuizDialog(
                                            height: screenSize.height * .2,
                                            backgroundcolor:
                                                HexColor("#FFDFE0"),
                                            foregroundcolor:
                                                HexColor("#FF4B4B"),
                                            texte: "Mauvais réponse",
                                            onpress: () {
                                              if (indexpage == quest!.length) {
                                                TheLogger.Logger().d(
                                                    "nbretrouves $nbretrouves : nbretotal $indexpage");
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Congratulations(
                                                              nbretrouves:
                                                                  nbretrouves,
                                                              nbretotal:
                                                                  indexpage,
                                                              questions: quest,
                                                            )));
                                              } else {
                                                Navigator.pop(context);
                                                nextPage();
                                              }
                                            },
                                          );
                                        });
                                  }
                                }
                              },
                              duration: const Duration(milliseconds: 160),
                            ),
                          ),
                        ],
                      );
                    })
                : Center(
                    child: SpinKitWave(
                      color: HexColor("#58CC02"), // HexColor("#235390"),
                      size: 25,
                      controller: animationcontroller,
                    ),
                  )),
      ),
    );
  }
}
