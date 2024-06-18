import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String recieverID, message) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message newmessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        message: message,
        recieverID: recieverID,
        timestamp: timestamp);
    List<String> ids = [currentUserID, recieverID];
    ids.sort();
    String chatRoomID = ids.join('_');
    await _firestore
        .collection("chatrooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chatrooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
