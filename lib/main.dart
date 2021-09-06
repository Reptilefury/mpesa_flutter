import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey("MYt8fucUMX7rnFWSOP1HMASssTOAOhl3");
  MpesaFlutterPlugin.setConsumerSecret("CuOGhPlpQYEpZOQD");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
//create the lipaNaMpesa method here.Please note, the method can have any name, I chose lipaNaMpesa
  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation = await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: 10.0,
          partyA: "254740870184",
          partyB: "174379",
          //Lipa na Mpesa Online ShortCode
          callBackURL: Uri(
              scheme: "https",
              host: "mpesa-requestbin.herokuapp.com",
              path: "/1hhy6391"),
          //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes    
          accountReference: "Baraton Supermarket App",
          phoneNumber: "254740870184",
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "purchase",
          passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
          //This passkey has been generated from Test Credentials from Safaricom Portal
  
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
       //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF481E4D)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mpesa Payment Demo'),
        ),
        body: Center(
            child: RaisedButton(
                color: Color(0xFF481E4D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                onPressed: () {
                  lipaNaMpesa();
                },
                child: Text(
                  "Lipa na Mpesa",
                  style: TextStyle(color: Colors.white),
                ))),
      ),
    );
  }
}
