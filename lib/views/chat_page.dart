import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:lasylab_mobile_app/components/discussion_tile.dart';
import 'package:lasylab_mobile_app/views/discussion_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarColor: HexColor("#235390"),
        statusBarIconBrightness: Brightness.light, // status bar color
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(110.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              elevation: 0,
              backgroundColor: HexColor("#235390"),
              title: Text(
                "DISCUSSION",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: CircleAvatar(
                      backgroundColor: HexColor("#235390"),
                      child: Image.asset(
                        "assets/images/clarity_notification-line.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    top: 5.0,
                    right: 20.0,
                    bottom: 5.0,
                  ),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                padding: EdgeInsets.all(15),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.77),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Text(
                    "Discussions",
                    maxLines: 1,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Privee",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Groupe",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Fichiers",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#FF760D",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#ADB6D7",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#77B8A0",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#1CB1FB",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#58CC02",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#ADB6D7",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                  DiscussionTile(
                    teacherName: "Prof VANESSA",
                    backgroundColor: "#77B8A0",
                    illustration: "assets/images/Female_Memojis.png",
                    teacherCourse: "MATHS",
                    lastMessage: "Equation est un polynomes de second...",
                    sendHour: "10:22",
                  ),
                ],
              ),
              Container(),
              Container(),
              ListView(
                shrinkWrap: true,
                children: List.generate(10, (index) => ProfileShimmer()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/discussions");
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/images/Edit.png",
                ),
              ),
            ),
            backgroundColor: HexColor("#235390"),
          ),
        ),
      ),
    );
  }
}
