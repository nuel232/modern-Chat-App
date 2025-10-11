import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modern_chat_app/models/message.dart';

class ChatService {
  //get and instance of the fireStore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<void> sendMessage(String receiverID, message) async {
    //get current info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
      message: message,
      senderEmail: currentUserEmail,
      senderID: currentUserID,
      timestamp: timestamp,
      receiverID: receiverID,
    );

    //construct chat room ID for the two user(stored for uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //sort the ids ensure that the chatroomID is the same for two people
    String chatRoomID = ids.join('_');
    //add new message to database

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection("message")
        .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('message')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
