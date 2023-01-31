import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';

import 'core/data/model/g_pay_response.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{
  var paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '50',
      status: PaymentItemStatus.final_price,
    )
  ].obs;
  Future<void> onGooglePayResult(paymentResult, String? deviceData, String? amount) async {
    print("pay1");
  //  GpayApi  paymentInfo= GpayApi.fromJson(paymentResult) ;

    print("   \n=================result========================\n${paymentResult}\n=====================result end===============   \n");
    http.Response response = await gPayNonce(paymentResult,deviceData,amount);

    print(response.body);
    print("pay2");
  }

}