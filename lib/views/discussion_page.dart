import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lasylab_mobile_app/forms/message_widget.dart';
import 'package:lasylab_mobile_app/models/message.dart';


class DiscussionPage extends StatefulWidget {
  const DiscussionPage({Key? key}) : super(key: key);

  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  final _controller = TextEditingController();
  String message = '';

  List<Message> messages = [
    Message(
      idUser: 10,
      senderType: 1,
      message:
          "Bonjour monsieur , jaimerai voir  savoir comment on resoud une équation de scond dégrè et je narrive pas aussi à determiner le domaine de définition d’une fonction 😀",
      createdAt: DateTime.now(),
      name: "M.Tierno",
    ),
    Message(
      idUser: 1,
      senderType: 1,
      message: "as tu lu ton cours ?",
      createdAt: DateTime.now(),
      name: "M.Tierno",
    ),
    Message(
      idUser: 10,
      senderType: 1,
      message: "Oui monsieur,",
      createdAt: DateTime.now(),
      name: "M.Tierno",
    ),
  ];

  void sendMessage() {
    FocusScope.of(context).unfocus();
    setState(() {
      messages.add(
        Message(
          idUser: 10,
          senderType: 1,
          message: message,
          createdAt: DateTime.now(),
          name: "Gilles",
        ),
      );
    });

    _controller.clear();
  }

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
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
            leading: BackButton(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor(
                          "#FF760D",
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vanessa",
                      maxLines: 1,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "MATHS",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: HexColor("#1CB1FB"),
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                      "assets/images/phone.png",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  right: 20.0,
                  bottom: 5.0,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.70),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "MESSAGE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            //body
            Expanded(
              child: messages.isEmpty
                  ? buildText('Say Something..')
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      //reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) => MessageWidget(
                        name: messages[index].name,
                        message: messages[index],
                        isMe: messages[index].idUser == 10,
                      ),
                    ),
            ),
            //body end
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _controller,
                        autocorrect: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70,
                          suffixIcon: Icon(
                            Icons.image,
                            color: HexColor("#AFAFAF"),
                          ),
                        ),
                        onChanged: (value) => setState(() {
                          message = value;
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: message.trim().isEmpty ? null : sendMessage,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: message.trim().isEmpty
                                ? Colors.white
                                : HexColor("#235390"),
                            border: Border.all(
                              color: message.trim().isEmpty
                                  ? HexColor("#AFAFAF")
                                  : HexColor("#235390"),
                            )),
                        child: Icon(
                          message.trim().isEmpty ? Icons.mic_none : Icons.send,
                          color: message.trim().isEmpty
                              ? HexColor("#AFAFAF")
                              : Colors.white,
                          size: 26,
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

  Widget buildText(String text) => Center(
        child: Text(
          "Say Something...",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: HexColor("#AFAFAF"),
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
