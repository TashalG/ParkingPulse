import 'package:flutter/material.dart';
import 'package:parkingpulse/master_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpulse/auth/login_widget.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
//Supabase
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = "pk_test_51QRRqUCLU1FRGHEz8bUWNyXcEwFFfIixclMmw6iOv5wRXu2n9eGFx5FMPCLM13hBFiFDDqobRDE3Sc73sNxnTnXT00PkahKQ21";
  //await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_ANON_KEY,);
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


