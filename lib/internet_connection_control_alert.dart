library internet_connection_control_alert;

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class Internet
{
  static late StreamSubscription<List<ConnectivityResult>> _listener;

  static bool _service = false;

  static bool internet = true;

  static bool _dialogStatus = false;

  static AlertDialog alertDialog = AlertDialog(
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
  );

  static void _control(bool barrier) async
  {
    internet = await InternetConnectionChecker().hasConnection;
    _dialog(internet,barrier);
  }

  static void delayStart({required int delay, bool? barrier, AlertDialog? alert})
  {
    Future.delayed(Duration(milliseconds: delay),() {start(alert: alert, barrier: barrier);});
  }

  static void start({bool? barrier, AlertDialog? alert}) async
  {
    alertDialog = alert ?? alertDialog;
    _control(barrier ?? true);
    if(!_service)
    {
      _listener = Connectivity().onConnectivityChanged.listen((out)
      {
        internet = (out.contains(ConnectivityResult.mobile) || out.contains(ConnectivityResult.wifi));
        _dialog(internet,barrier ?? true);
      });
      _service = true;
    }
  }

  static void stop()
  {
    if(_service)
    {
      _listener.cancel();
      _service = false;
      _dialogStatus = false;
    }
  }

  static void _dialog(bool internet, bool barrier) async
  {
    if(!internet && !_dialogStatus)
    {
      _dialogStatus = true;
      await showDialog(
        context: navKey.currentState!.context,
        barrierDismissible: barrier,
        builder: (aContext) => PopScope(
          canPop: barrier,
          child: alertDialog
        ),
      );
    }
    else
    {
      if(_dialogStatus && internet)
      {
        Navigator.pop(navKey.currentState!.context);
        _dialogStatus = false;
      }
    }
  }
}
