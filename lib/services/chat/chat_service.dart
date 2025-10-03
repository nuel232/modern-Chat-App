import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //get and instance of the fireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get stream user
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    //return firestore collection
    return _firestore.collection('Users').snapshots().map((snapshot) {
      //go to the snapshot
      return snapshot.docs.map((doc) {
        //go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send message
}
