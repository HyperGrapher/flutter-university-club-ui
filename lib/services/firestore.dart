import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // Firestore collections
  final CollectionReference lectureCollection =
      Firestore.instance.collection('lectures');

  final CollectionReference messagesCollection =
      Firestore.instance.collection('messages');

  Future updateData(
      int uid,
      String host_university,
      String host_department,
      String host_major,
      String host_lecture_id,
      String host_lecture_name,
      String eras_university,
      String eras_department,
      String eras_major,
      String eras_lecture_id,
      String eras_lecture_name) async {
    return await lectureCollection
        .document()
        .collection("$uid")
        .document()
        .setData({
      'host_university': host_university,
      'host_department': host_department,
      'host_major': host_major,
      'host_lecture_id': host_lecture_id,
      'host_lecture_name': host_lecture_name,
      'eras_university': eras_university,
      'eras_department': eras_department,
      'eras_major': eras_major,
      'eras_lecture_id': eras_lecture_id,
      'eras_lecture_name': eras_lecture_name,
    });
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
