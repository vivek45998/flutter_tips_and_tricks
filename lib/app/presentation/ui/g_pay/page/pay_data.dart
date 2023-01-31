import 'package:braintree/app/core/data/model/g_pay_response.dart';
import 'package:braintree/app/presentation/ui/g_pay/ctrl/gpay_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pay/pay.dart';




class GPayApp extends StatefulWidget {
  GPayApp({Key? key}) : super(key: key);

  @override
  _GPayState createState() => _GPayState();
}

class _GPayState extends State<GPayApp> {

var ctrl=Get.put(GpayController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-shirt Shop'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Image(
              image: AssetImage('assets/images/ts_10_11019a.jpeg'),
              height: 350,
            ),
          ),
          const Text(
            'Amanda\'s Polo Shirt',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$50.20',
            style: TextStyle(
              color: Color(0xff777777),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),


          GooglePayButton(
            paymentConfigurationAsset:
            'payment_json.json',
            paymentItems: ctrl.paymentItems,
            type: GooglePayButtonType.buy,
            margin: const EdgeInsets.only(top: 15.0),
            onPaymentResult: ctrl.onGooglePayResult,
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

          const SizedBox(height: 15)
        ],
      ),
    );
  }
}