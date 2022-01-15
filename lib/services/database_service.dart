import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lasylab_mobile_app/models/message.dart';
import 'package:lasylab_mobile_app/models/user.dart';
import 'package:lasylab_mobile_app/services/auth_service.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBService {
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference messagecollection =
      FirebaseFirestore.instance.collection("messages");
  final box = GetStorage();
  Future saveUser(Usermodel user) async {
    try {
      box.write("user", user.toJson());
      await usercollection.doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      Logger().d(e);
      return false;
    }
  }

  Future<Usermodel?> getUser(String id) async {
    try {
      final data = await usercollection.doc(id).get();
      final user = Usermodel.fromJson(data.data() as Map<String, dynamic>);
      return user;
    } catch (e) {
      return null;
    }
  }

  Usermodel? getLocalUser() {
    final box = GetStorage();
    try {
      return Usermodel.fromJson(box.read("user"));
    } catch (e) {
      return box.read("user");
    }
  }

  Future<bool> verifyIfPhoneExist(String phone) async {
    bool exist = false;
    try {
      /* await usercollection.get().then((value) {
        value.docs.forEach((element) {
          Logger().d(element.get("telephone"));
          if (element.get("telephone") == phone) {
            exist = true;
            //return;
          }
        });
      });*/

      //deuxieme méthode
      final result = await usercollection.get();
      for (var i = 0; i < result.docs.length; i++) {
        Logger().d(result.docs[i].get("telephone") + "--" + phone);
        if (result.docs[i].get("telephone") == phone) {
          exist = true;
          break;
        }
      }
      Logger().d("Existe " + exist.toString());
      return exist;
    } catch (e) {
      return exist;
    }
  }

  Future<Usermodel?> loginWithFirestore(String phone, String password) async {
    Usermodel? user;
    try {
      if (await verifyIfPhoneExist(phone)) {
        await usercollection.get().then((value) {
          value.docs.forEach((element) {
            if (element.get("telephone") == phone &&
                element.get("password") == password) {
              user = Usermodel.fromJson(element.data() as Map<String, dynamic>);
              Logger().d(user);
              if (user != null) {
                saveUser(user!);
              }
              return;
            }
          });
        });
        Logger().d(user!.toJson());
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Stream<List<Usermodel>> get getDiscussionUser {
    Usermodel? user = getLocalUser();

    return usercollection
        .where('id',
            isNotEqualTo:
                AuthService().user != null ? AuthService().user!.uid : user!.id)
        .snapshots()
        .map((event) => event.docs
            .map((e) => Usermodel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<Message>> getMessage(String receiverUID,
      [bool myMessage = true]) {
    Usermodel? user = getLocalUser();
    return messagecollection
        .where("senderUID",
            isEqualTo: myMessage
                ? (AuthService().user != null
                    ? AuthService().user!.uid
                    : user!.id)
                : receiverUID)
        .where("receiverUID",
            isEqualTo: myMessage
                ? receiverUID
                : (AuthService().user != null
                    ? AuthService().user!.uid
                    : user!.id))
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => Message.fromJson(e.data() as Map<String, dynamic>, e.id))
            .toList());
  }

  Future<bool> sendMessage(Message message) async {
    try {
      await messagecollection.doc().set(message.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}