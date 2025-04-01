import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpulse/controllers/database_controller.dart';

class ProfileWidget extends StatelessWidget {

  final User user = FirebaseAuth.instance.currentUser as User;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _auth.signOut();
            },
            child: Text('Log Out'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (user != null) {
                await DatabaseController.controller.upgradeToSupervisor(user!.uid);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile upgraded to supervisor!')),
                );
              }
            },
            child: Text('Upgrade to Supervisor'),
          ),
        ],
      ),
    );
  }
}