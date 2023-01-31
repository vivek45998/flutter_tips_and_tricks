import 'package:braintree/app/core/data/remote/remote_repo.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:http/http.dart' as http;
import '../../../../core/data/model/g_pay_response.dart';

class GpayController extends GetxController{
  var paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '50',
      status: PaymentItemStatus.final_price,
    )
  ].obs;
  Future<void> onGooglePayResult(paymentResult) async {
    print("pay1");
    GpayApi  paymentInfo= GpayApi.fromJson(paymentResult) ;
    print("pay2");
    print("   \n=================result========================\n${paymentResult}\n=====================result end===============   \n");
    http.Response response = await gPayPostApiToSuccessResponse(paymentResult);

    print(response.body);
    print("pay2");
  }

}