import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  final CollectionReference messagesCollection =
      Firestore.instance.collection('messages');

  DatabaseService() {
    // _getUID();
  }

  Future sendContactForm(
    int uid,
    String name,
    String email,
    String message,
  ) async {
    return await messagesCollection
        .document()
        .collection("$uid")
        .document()
        .setData({
      'name': name,
      'email': email,
      'message': message,
    });
  }
}
