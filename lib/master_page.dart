import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:parkingpulse/home_page.dart';
import 'package:parkingpulse/payment_page.dart';
import 'package:parkingpulse/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpulse/controllers/database_controller.dart';

class MasterPage extends StatefulWidget {

  @override
  State< MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State< MasterPage> {
  _MasterPageState();
  final User user = FirebaseAuth.instance.currentUser as User;
  List<StatelessWidget> screens = [HomeWidget(),PaymentWidget(),HomeWidget(),HomeWidget(),ProfileWidget()];
  int _page = 0;
  
  void getScreens()async
  {
    final temp = await DatabaseController.instance().getUserEntry(user.uid);
    if(temp['is_supervisor']==true)
    {
      screens =[ProfileWidget(),ProfileWidget(),ProfileWidget(),ProfileWidget(),ProfileWidget()];//supervisor pages
    }
    screens =[HomeWidget(),PaymentWidget(),HomeWidget(),HomeWidget(),ProfileWidget()];
  }
  
  @override
  Widget build(BuildContext context) {
    getScreens();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        color: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.paid, size: 26, color: Colors.white),
          Icon(Icons.qr_code_2, size: 26, color: Colors.white),
          Icon(Icons.notifications, size: 26, color: Colors.white),
          Icon(Icons.person, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            
          });
        },
      ),
      body: screens[_page]
    );
  }
}