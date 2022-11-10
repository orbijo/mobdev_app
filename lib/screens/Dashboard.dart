import 'package:flutter/material.dart';
import 'package:mobdev_app/screens/Settings.dart';
import 'package:mobdev_app/arguments/FormData.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  @override
  Widget build(BuildContext context) {
    var formdata = ModalRoute.of(context)!.settings.arguments as FormData;
    return Scaffold(
      appBar: AppBar(
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Welcome, \n",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                   ),
                   Text(formdata.email)
               ]
               
                ),


            );
       
  }

}
