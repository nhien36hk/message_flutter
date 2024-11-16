import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message, required this.uid});

  final String uid;
  final String message;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (uid == _firebaseAuth.currentUser!.uid) ? Colors.grey : Colors.green[400],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(message, style: TextStyle(color: Colors.white),),
    );
  }
}