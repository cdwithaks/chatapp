// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chats/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  ChatPage({
    super.key,
    required this.recieverEmail,
    required this.recieverID,
  });
  final TextEditingController _messagecontroller = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  void sendMessage() async {
    if (_messagecontroller.text.isNotEmpty) {
      await _chatService.sendMessage(recieverID, _messagecontroller.text);

      _messagecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(recieverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading");
        }
        return ListView(
          children: snapshot.data!.docs
              .map(
                (doc) => _buildUserListItem(doc),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(
            isCurrentUser: isCurrentUser,
            message: data['message'],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messagecontroller,
              hintText: 'type a message ',
              obscureText: false,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          IconButton(
              onPressed: sendMessage,
              icon: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
