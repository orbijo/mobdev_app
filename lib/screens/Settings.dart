import 'package:flutter/material.dart';
import 'package:mobdev_app/screens/LoginScreen.dart';
import 'package:mobdev_app/widgets/PrimaryButton.dart';


class Settings extends StatefulWidget {
  static String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        
      
      ),
      body:  Center(
        
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.circle_notifications_rounded,
                size: 24.0,
              ),
              label: const Text('Notifications')  
              ),

              ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.privacy_tip_rounded,
                size: 24.0,
              ),
              label: const Text('Security')
              ),

              ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.lock_rounded,
                size: 24.0,
              ),
              label: const Text('Privacy')
              ), 

              ElevatedButton.icon(
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.build_circle_rounded,
                size: 24.0,
              ),
              label: const Text('About')  
              ),

              ElevatedButton.icon(
              onPressed: () {Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (Route<dynamic> route) => false);
                  },
              icon: const Icon(
                Icons.logout_rounded,
                size: 24.0,
              ),
              label: const Text('Logout')
              ) 
            ],
            
              
          )
        
      ),
    );
  }
}
