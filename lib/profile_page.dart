import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Center(
      child:  ElevatedButton(
        //TODO
              onPressed: () {
                _auth.signOut();
              },
              child: Text('Log Out'),
        )
    );
  }
}