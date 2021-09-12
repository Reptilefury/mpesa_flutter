import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() {
  //final String consumerKey = "MYt8fucUMX7rnFWSOP1HMASssTOAOhl3";
  //final String consumerSecret = "CuOGhPlpQYEpZOQD";
//  MpesaFlutterPlugin.setConsumerKey(consumerKey);
  //MpesaFlutterPlugin.setConsumerSecret(consumerSecret);
  MpesaFlutterPlugin.setConsumerKey("MYt8fucUMX7rnFWSOP1HMASssTOAOhl3");
  MpesaFlutterPlugin.setConsumerSecret("CuOGhPlpQYEpZOQD");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String businessShortCode = "174379";
  final String consumerKey = "MYt8fucUMX7rnFWSOP1HMASssTOAOhl3";
  final String consumerSecret = "CuOGhPlpQYEpZOQD";

  //final String transactionType = "C";
  final double amount = 10.0;
  final String PartyA = "254740870184";
  final String PartyB = "174379";
  final String host1 = "mpesa-requestbin.herokuapp.com";
  final String host2 = "sandbox.safaricom.co.ke";
  final String scheme = "https";
  final String path = "/1hhy6391";
  final String AccountReference = "Baraton Supermarket App";
  final String phoneNumber = "254740870184";
  final String passCode =
      "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";
  final String transactionDescription =
      "Payment for Goods and services bought in Baraton Supermarket App";
  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: businessShortCode,
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: amount,
          partyA: PartyA,
          partyB: PartyB,
          //Lipa na Mpesa Online ShortCode
          callBackURL: Uri(
              scheme: scheme,
              host: host1,
              path: path),
          //This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
          accountReference: AccountReference,
          phoneNumber: phoneNumber,
          baseUri: Uri(scheme: scheme, host: host2),
          transactionDesc: "purchase",
          passKey:
          passCode);
      //This passkey has been generated from Test Credentials from Safaricom Portal

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }


  /*Future lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: businessShortCode,
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: amount,
              partyA: PartyA,
              partyB: PartyB,
              callBackURL: Uri(scheme: scheme, host: host1, path: path),
              accountReference: AccountReference,
              phoneNumber: phoneNumber,
              baseUri: Uri(scheme: scheme, host: host2),
              passKey: passCode,
              transactionDesc: transactionDescription);
      print("TRANSACTION RESULT: "
      //    "${transactionInitialisation().toString()}"
          +transactionInitialisation().toString()
      );
      return transactionInitialisation;
    } catch (e) {
      print("CAUGHT:"
          //"${e.toString()}"
          + e.toString());
    }
  }
 */
  /* Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
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
          passKey:
          "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      //This passkey has been generated from Test Credentials from Safaricom Portal

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: Text("Lipa Na Mpesa Demo")),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                lipaNaMpesa();
              },
              child: Text(
                "Lipa Na Mpesa",
                style: TextStyle(
                  color: Colors.white,
                  //fontSize: 12,
                  //    fontWeight: FontWeight.bold
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ),
    );
  }
}

/*class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
//create the lipaNaMpesa method here.Please note, the method can have any name, I chose lipaNaMpesa
 /* Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
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
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      //This passkey has been generated from Test Credentials from Safaricom Portal

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      //lets print the error to console for this sample demo
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green
          //Color(0xFF481E4D),
          ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mpesa Payment Demo'),
        //  actions: <Widget>[ImageIcon(AssetImage(Res.lipanaMpesa))],
        ),
        body: Center(
          child: RaisedButton(
              color: Colors.green,
              // color: Color(0xFF481E4D),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {
                //lipaNaMpesa();
              },
               child: Text("Lipa na Mpesa"),
          //    child: ImageIcon(AssetImage(Res.lipanaMpesa))
          ),
        ),
      ),
    );
  }
}
*/
