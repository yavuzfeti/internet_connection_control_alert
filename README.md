The `internet_connection_control_alert` package is a tool for monitoring internet connectivity in your Flutter applications and notifying users when the connection is lost. This package checks the status of the internet connection and displays a customizable alert dialog.

## Features

- **Internet Connection Monitoring**: Monitors the internet connection of your application in real-time.
- **Customizable Alert Dialog**: Allows you to customize the alert dialog that is shown when the internet connection is lost.
- **Delayed Start**: You can delay the start of the connection check by a specified time.
- **Dismiss Options**: Configure whether the alert dialog can be dismissed by the user.
- **Internet Status Visibility**: Check the current status of the internet connection with the `internet` variable.

## Installation

To add the package to your project, include the following line in your `pubspec.yaml` file:

```yaml
dependencies:
  internet_connection_control_alert: ^1.0.0
```

Then run flutter pub get in your terminal to install the package.
Usage
Importing the Package

In your main Dart file, import the package:

```dart
import 'package:internet_connection_control_alert/internet_connection_control_alert.dart';
```

Initialization and Configuration

Use the delayStart() method to check the internet connection and show a customized alert dialog when starting your application:

```dart
void main() {
  // Delayed start and customized AlertDialog
  Internet.delayStart(
    delay: 1000, // Delay time (milliseconds)
    barrier: false, // Determines if the alert dialog can be dismissed
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
          children: [
            Icon(Icons.wifi_off_rounded, size: 50),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
              "Internet is not available at the moment. Please check your internet connection and try again.",
            ),
          ],
        ),
      ),
    ),
  );

  runApp(
    MaterialApp(
      navigatorKey: navKey, // Define the navKey used in the library
      home: const Scaffold(
        body: Center(child: Text("Internet Connection Control Alert")),
      ),
    ),
  );
}
```

## Methods

```dart
    Internet.delayStart({required int delay, bool? barrier, AlertDialog? alert})
```
This method waits for the specified delay before starting to check the internet connection. The barrier parameter determines whether the alert dialog can be dismissed by the user. The alert parameter provides a customized AlertDialog.
        delay: Delay time (milliseconds).
        barrier: If true, allows the alert dialog to be dismissed; if false, prevents it from being dismissed.
        alert: The AlertDialog to be shown if there is no internet connection.

```dart
    Internet.start({bool? barrier, AlertDialog? alert})
```
This method starts monitoring the internet connection. It listens for connection changes and shows the alert dialog if the internet connection is lost or restored.
        barrier: If true, allows the alert dialog to be dismissed; if false, prevents it from being dismissed.
        alert: The AlertDialog to be shown if there is no internet connection.

```dart
    Internet.stop()
```
This method stops monitoring the internet connection and closes any shown alert dialogs.

Checking Internet Status

You can check the current status of the internet connection using the Internet.internet variable. If this variable is true, the internet connection is available; if false, it is not.

## Example Usage

```dart
void main() {
  Internet.delayStart(
    delay: 1000,
    barrier: true,
    alert: AlertDialog(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.signal_wifi_off, size: 50, color: Colors.white),
            SizedBox(height: 15),
            Text(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
              "No internet connection. Please check your connection and try again.",
            ),
          ],
        ),
      ),
    ),
  );

  runApp(
    MaterialApp(
      navigatorKey: navKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Internet Connection Control Example"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              if (Internet.internet) {
                print("Internet is available");
              } else {
                print("Internet is not available");
              }
            },
            child: const Text("Check Internet Status"),
          ),
        ),
      ),
    ),
  );
}
```

## License

This project is licensed under the MIT License.

This README provides detailed information about the internet_connection_control_alert package and how to use it. Let me know if you need any additions or corrections!