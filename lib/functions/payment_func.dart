import 'package:flutter/material.dart';
import 'package:parkingpulse/controllers/database_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> initPayment({
  required String currency,
  required String amount,
}) 
async {
  try{
    final response = await http.post(
      Uri.parse("http://10.0.2.2:5001/parkingpulse-4e8ac/us-central1/stripePaymentIntentRequest"),
      body: {
        'amount': amount,
        'currency': currency,
      },
    );

     final jsonResponse = jsonDecode(response.body);

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: jsonResponse['paymentIntent'],
        merchantDisplayName: 'Parking lot',
      ),

    );

    await Stripe.instance.presentPaymentSheet();
    if(jsonResponse["success"])
    {
      //database controller
    }

  }catch(e)
  {
    print(e);
  }
}