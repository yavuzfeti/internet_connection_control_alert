import 'package:flutter/material.dart';
import 'package:internet_connection_control_alert/internet_connection_control_alert.dart';

void main() {

  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Internet.delayStart(navKey, delay: 1000,barrier: false,alert: AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    content: Container(
      height: 200,
      padding: const EdgeInsets.all(25),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.wifi_off_rounded,size: 50),
          SizedBox(
            height: 20,
          ),
          Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 15),
              "Internet is not available at the moment. Please check your internet connection and try again."
          )
        ],
      ),
    ),
  ));

  runApp(
      MaterialApp(
        navigatorKey: navKey, // Kütüphanede kullanılan navKey'i tanımla
        home: const Scaffold(
          body: Center(child: Text("Internet Connection Control Alert")),
        ),
      ),
  );
}