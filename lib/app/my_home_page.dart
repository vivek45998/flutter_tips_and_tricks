import 'dart:convert';

import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:braintree/app/home_ctrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay/pay.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = "http://10.10.20.52:5001";
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
var ctrl=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                final request = BraintreeDropInRequest(

                  tokenizationKey: "sandbox_jy69b8fm_5fzr3ghybt5zpz7w",
                  collectDeviceData: true,
                  cardEnabled: false,
                  googlePaymentRequest: BraintreeGooglePaymentRequest(
                    //googleMerchantID: "12345678901234567890", //5fzr3ghybt5zpz7w
                    totalPrice: '5',
                    currencyCode: 'USD',
                    billingAddressRequired: false,
                  ),
                );
                BraintreeDropInResult? result =
                    await BraintreeDropIn.start(request);
                if (result != null) {
                  print('Nonce: ${result.paymentMethodNonce.nonce}');
                 ctrl.onGooglePayResult(result.paymentMethodNonce.nonce,result.deviceData,request.googlePaymentRequest?.totalPrice);


                  // var client = http.Client();
                  // print(
                  //     '$url/checkout?nonce=${result.paymentMethodNonce.nonce}');
                  // client.get(new Uri.http('$url/checkout?nonce=${result.paymentMethodNonce.nonce}&device_data=&${result.deviceData}'));

                  //Uri.https('$url?checkout=${result.paymentMethodNonce.nonce}&device_data=&${result.deviceData}',);
                } else {
                  print('Selection was canceled.');
                }
              },
              child: const Text("payment"),
            ),
      // GooglePayButton(
      //   paymentConfigurationAsset:
      //   'payment_json.json',
      //   //width: 10,
      //  // height: 10,
      //   paymentItems: _paymentItems,
      //   type: GooglePayButtonType.buy,
      //   margin: const EdgeInsets.only(top: 15.0),
      //   onPaymentResult: onGooglePayResult,
      //   loadingIndicator: const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
          ],
        ),
      ),
    );
  }
  onGooglePayResult(result){
    
    print(result.toString());
    //gPayNonce(result, deviceData, price)
  }
}
