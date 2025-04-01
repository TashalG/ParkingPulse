import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkingpulse/functions/payment_func.dart';
import 'package:parkingpulse/widget/google_map_widget.dart';


class PaymentWidget extends StatefulWidget {
  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  final GoogleMapWidget mapWidget = GoogleMapWidget();
  int lotId = 0;

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
                Text('placeholder') // TODO
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Cost: '),
                Text('\$/hr') // TODO
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentInfoWidget()));
                lotId = mapWidget.getCurrentMarkerId();
                initPayment(currency: 'usd', amount: '50');
                setState((){});
              },
              child: Text('Purchase Ticket'),
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