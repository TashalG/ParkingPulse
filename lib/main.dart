import 'package:flutter/material.dart';
import 'package:parkingpulse/master_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpulse/auth/login_widget.dart';
//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ParkingApp());
}

class ParkingApp extends StatelessWidget {
  ParkingApp({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget _handleAuth() {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          print(user?.uid);
          if (user == null) {
            return LoginWidget(super.key);
          }
          return MasterPage();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _handleAuth(),
    );
  }
}


