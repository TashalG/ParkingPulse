import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class  MasterPage extends StatefulWidget {
  MasterPage();


  @override
  State< MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State< MasterPage> {
  _MasterPageState();
  int _page = 0;
  
  List<StatelessWidget> getScreens(){

    return [];//Different pages will be here
  }
  
  @override
  Widget build(BuildContext context) {

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
      //body: getScreens()[_page]
    );
  }
}