const {onRequest} = require("firebase-functions/v2/https");
const functions = require("firebase-functions");

const Stripe = require("stripe");
const key = "sk_test_51QRRqUCLU1FRGHEzECKjSleYz5DoNzY4nTCZE8k5qV1c2l5oasAMrzbLFQtZi3P3YgVtmA5a8fKZIcjOrNKkboty00c9eOOs6F";
const stripe = Stripe(key);

exports.stripePaymentIntentRequest = functions.https.onRequest(async (req, res) => {
    const {body} = req;
    try {
      const paymentIntent = await stripe.paymentIntents.create({
        amount:body?.amount, 
        currency:body?.currency,
        payment_method_types: ['card']
    });
  
      res.status(200).send({
        paymentIntent: paymentIntent.client_secret,
        success: true,
        id: paymentIntent.id
      });
    } catch (error) {
      res.status(404).send({ success: false, error: error.message });
    }
  });
