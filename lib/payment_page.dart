import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkingpulse/widget/google_map_widget.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

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
              child: GoogleMapWidget()
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Spot Availability: '),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentInfoWidget()));
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
    );
  }
}