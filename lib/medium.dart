import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phone_pe_pg/phone_pe_pg.dart';

class DemoClass extends StatefulWidget {
  const DemoClass({super.key});

  @override
  State<DemoClass> createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {






  @override
  Widget build(BuildContext context) {
    PhonePePg phonePePg = PhonePePg(prodUrl: 'https://www.xyx.com',
      isUAT: true, // true for UAT environment, false for production
      saltKey: '7311a215-d674-4523-8db4-22559dc2eb3e',
      saltIndex: '1',
    );


    void UPITrans()async{
      // List<UpiAppInfo>? upiApps = await PhonePePg.getUpiApps();
      PaymentRequest paymentRequest = PaymentRequest(
        amount: 1000,
        callbackUrl: "https://www.xyx.com",
        deviceContext: DeviceContext.getDefaultDeviceContext(
          merchantCallBackScheme: 'merchantCallBackScheme',
        ),
        merchantId: 'M1SXCJLSKZN8', //Provided by phonepe
        merchantTransactionId: DateTime.now().toString(),
        merchantUserId: DateTime.now().toString(),
        mobileNumber: '6386506352',
        // paymentInstrument: UpiIntentPaymentInstrument(
        //   // targetApp: Platform.isAndroid
        //   //     ? selectedUPIApp.packageName!
        //   //     : selectedUPIApp.iOSAppName!,
        //   //TargetApp is the package name of the UPI App you want to use for  payment from for Android and iOS App Name of the app you want to use for payment for iOS
        // ),
      );
      final result = await phonePePg.startUpiTransaction( paymentRequest: paymentRequest);
    }


    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        UPITrans();
      },child: const Icon(Icons.add)),
    );
  }
}
