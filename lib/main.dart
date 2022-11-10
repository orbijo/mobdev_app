import 'package:flutter/material.dart';
import 'package:mobdev_app/routes.dart';
import 'package:mobdev_app/screens/Dashboard.dart';
import 'package:mobdev_app/screens/LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.brown,
      scaffoldBackgroundColor: Color.fromARGB(255, 66, 133, 91),
      textTheme: 
        TextTheme (
          displaySmall: TextStyle(color: Colors.white),    
        ),
        inputDecorationTheme: const InputDecorationTheme(
        filled: true, 
        fillColor: Colors.white,  
        ), 
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}
