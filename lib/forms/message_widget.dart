import 'package:flutter/material.dart';
import 'package:lasylab_mobile_app/models/message.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;
  final String name;

  const MessageWidget({
    required this.message,
    required this.isMe,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 5,
              ),
              constraints: BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                color: isMe ? HexColor("#F4F8FB") : HexColor("#C9F0D8"),
                borderRadius: isMe
                    ? borderRadius
                        .subtract(BorderRadius.only(bottomRight: radius))
                    : borderRadius
                        .subtract(BorderRadius.only(bottomLeft: radius)),
              ),
              child: buildMessage(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                "Envoyé à ${DateFormat('kk:mm').format(message.createdAt)}",
                style: GoogleFonts.poppins(
                  color: HexColor("#AFAFAF"),
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          // if (isMe == false)
          //   Text(
          //     name,
          //     style: GoogleFonts.poppins(
          //       color: Colors.black,
          //       textStyle: TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     textAlign: TextAlign.start,
          //   ),
          Text(
            message.message,
            style: GoogleFonts.poppins(
              color: Colors.black,
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            textAlign: isMe ? TextAlign.start : TextAlign.start,
          ),
        ],
      );
}
