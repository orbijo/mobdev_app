import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobdev_app/screens/Settings.dart';
import 'package:mobdev_app/arguments/FormData.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const MethodChannel _methodChannel =
      MethodChannel('dev.flutter.sample/platform_view_swift');

  int _counter = 0;

  Future<void> _launchPlatformCount() async {
    final platformCounter =
        await _methodChannel.invokeMethod<int>('switchView', _counter);
    setState(() => _counter = platformCounter ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    var formdata = ModalRoute.of(context)!.settings.arguments as FormData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formdata.email,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: _launchPlatformCount,
                    child: const Text('Continue in iOS view'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 5),
            child: Row(
              children: [
                Image.asset('images/starbs2.png', height: 50, width: 50),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Starbucks',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     actions: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, Settings.routeName);
    //         },
    //         child: const Padding(
    //           padding: EdgeInsets.only(right: 15.0),
    //           child: Icon(
    //             Icons.settings,
    //             size: 30,
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    //   // body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //   //   Text(
    //   //     "Welcome",
    //   //     style: Theme.of(context).textTheme.displaySmall,
    //   //     textAlign: TextAlign.center,
    //   //   ),
    //   //   Text(
    //   //     formdata.email,
    //   //     style: Theme.of(context).textTheme.displaySmall,
    //   //     textAlign: TextAlign.center,
    //   //   )
    //   // ]),
    //   body: Center(
    //     child: Row(
    //       children: [
    //         Center()
    //       ],
    //     ),
    //   ),
    // );
  }
}
