import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:lasylab_mobile_app/services/database_service.dart';

class MessageField {
  static final String createdAt = 'createdAt';
}
// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

//Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.uid,
    this.content,
    this.type,
    this.senderUid,
    this.receiverUid,
    this.createdAt,
  });

  String? uid;
  String? content;
  String? type;
  String? senderUid;
  String? receiverUid;
  DateTime? createdAt;

  /* factory Message.fromJson(Map<String, dynamic> json, String id) => Message(
        // uid: json["uid"] == null ? null : json["uid"],
        uid: id,
        content: json["content"] == null ? null : json["content"],
        senderUid: json["senderUID"] == null ? null : json["senderUID"],
        receiverUid: json["receiverUID"] == null ? null : json["receiverUID"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );*/

  Message.fromJson(Map<String, dynamic> json, String id) {
    // uid: json["uid"] == null ? null : json["uid"],
    uid = id;
    content = json["content"] == null ? null : json["content"];
    type = json["type"] == null ? null : json["type"];
    senderUid = json["senderUID"] == null ? null : json["senderUID"];
    receiverUid = json["receiverUID"] == null ? null : json["receiverUID"];
    createdAt =
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
  }

  Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "content": content == null ? null : content,
        "type": type == null ? null : type,
        "senderUID": senderUid == null ? null : senderUid,
        "receiverUID": receiverUid == null ? null : receiverUid,
        "createdAt": createdAt == null
            ? null
            : "$createdAt", // "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
      };
  Usermodel? user = DBService().getLocalUser();
  bool get isMe => AuthService().user != null
      ? AuthService().user!.uid == senderUid
      : user!.id == senderUid;
}
