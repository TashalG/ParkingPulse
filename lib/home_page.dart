import 'package:flutter/material.dart';
import 'package:parkingpulse/widget/google_map_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMapWidget(),
    );
  }
}