import 'package:flutter/material.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy a ticket'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Make payment'),
          onPressed: () async 
          {
            
          },
        ),
      ),
    );
  }
}