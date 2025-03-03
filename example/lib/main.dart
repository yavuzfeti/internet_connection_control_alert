import 'package:flutter/material.dart';
import 'package:internet_connection_control_alert/internet_connection_control_alert.dart';

void main() =>
    runApp(
      MaterialApp(
        home: Builder(
            builder: (context)
            {
              Internet.delayStart(
                context: context,
                delay: 1000,
                barrier: false,
                alert: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  content: Container(
                    height: 200,
                    padding: const EdgeInsets.all(25),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 20,
                      children:
                      [
                        Icon(Icons.wifi_off_rounded, size: 50),
                        Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          "Internet is not available at the moment. Please check your internet connection and try again.",
                        )
                      ],
                    ),
                  ),
                ),
              );

              return const Scaffold(
                body: Center(child: Text("Internet Connection Control Alert")),
              );
            }
            ),
      ),
    );