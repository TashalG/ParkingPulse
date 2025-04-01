import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkingpulse/controllers/database_controller.dart';
import 'package:parkingpulse/functions/payment_func.dart';
import 'package:parkingpulse/widget/google_map_widget.dart';


class PaymentWidget extends StatefulWidget {
  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  final GoogleMapWidget mapWidget = GoogleMapWidget();
  int lotId = 0;
  double lotPrice = 0.0;
  final dynamic database = DatabaseController.instance();
  dynamic parkingLotList;

  getParkingLots() async {
    parkingLotList = await database.getAvailableParkingLots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy a ticket'),
      ),
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 600, width: 370),
              child: mapWidget
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Spot ID: $lotId'),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Price: '),
                Text('\$$lotPrice/hr')
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                ElevatedButton(
                  onPressed: () {
                    lotId = mapWidget.getCurrentMarkerId();
                    getParkingLots();
                    dynamic currentLot = parkingLotList[lotId];
                    lotPrice = currentLot['cost'];
                    setState((){});
                  },
                  child: Text('Select Parking Lot'),
                ),
                ElevatedButton(
                  onPressed: (){
                    initPayment(currency: 'usd', amount: '1000');
                  },
                  child: Text('Purchase Ticket'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Information'),
      ),
      body: Column(
        children: [
          DropdownMenu(
            dropdownMenuEntries: [
              DropdownMenuEntry(label: 'temp', value: 2)
            ],
          ),
        ],
      ),
    );
  }
}
