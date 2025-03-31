import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpulse/controllers/database_controller.dart';

class LoginWidget extends StatefulWidget {
    const LoginWidget(Key? key): super(key: key);

  @override
    State<LoginWidget> createState() =>_LoginWjdgetState();
}

class _LoginWjdgetState extends State<LoginWidget>  {
  bool isLogin = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextControllers = [TextEditingController(), TextEditingController()];

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showDialog<void>(context: context,barrierDismissible: false,builder: (BuildContext context) {return AlertDialog(
        title: const Text("Error"),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Invalid email or password"),
              Text("Please check your credentials"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
    }
  }
   Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _auth.currentUser?.uid;
    } catch (e) {
      showDialog<void>(context: context,barrierDismissible: false,builder: (BuildContext context) {return AlertDialog(
        title: const Text("Error"),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text("Invalid email or password"),
              Text("Make sure you enter correct email and at least 6 symbol password?"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
    }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin? "Login" : "Sign Up"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "E-mail"),
              controller: TextControllers[0],
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              controller: TextControllers[1],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(isLogin)
                {
                  signIn(TextControllers[0].text, TextControllers[1].text);
                }
                else
                {
                  createUser(TextControllers[0].text, TextControllers[1].text);
                }
              },
              child: Text(isLogin? "Login" : "Sign Up"),
            ),
            Visibility(
              visible: isLogin? true : false,
              child:
                ElevatedButton
                (
                  onPressed: () 
                  {
                    setState((){

                      isLogin = false;
                    });
                  },
              child: const Text("Sign Up"),
            ),
            
            )
          ],
        ),
      ),
    );
  }
}