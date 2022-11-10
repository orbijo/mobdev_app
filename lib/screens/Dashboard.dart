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
  @override
  Widget build(BuildContext context) {
    var formdata = ModalRoute.of(context)!.settings.arguments as FormData;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            padding: EdgeInsets.only(left: 50.0),
            child: const Text(
              'Dashboard',
              style: TextStyle(
                fontFamily: 'SoDoSans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: Center(
              child: Text(
                "Hello, ${(formdata.email)}!",
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontFamily: 'SoDoSans',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 234, 199, 132),
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Latte',
                                  style: TextStyle(
                                    fontFamily: 'SoDoSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 48,
                                  ),
                                ),
                              ),
                              width: width * 0.50,
                              height: height * 0.25,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Color.fromARGB(255, 96, 76, 76),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Tea',
                                      style: TextStyle(
                                        fontFamily: 'SoDoSans',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  width: width * 0.45,
                                  height: height * 0.09,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Card(
                                color: Color.fromARGB(255, 54, 36, 21),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Coffee',
                                      style: TextStyle(
                                        fontFamily: 'SoDoSans',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  width: width * 0.45,
                                  height: height * 0.15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 96, 76, 76),
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Caffeine',
                                  style: TextStyle(
                                    fontFamily: 'SoDoSans',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                              width: width * 0.50,
                              height: height * 0.25,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Color.fromARGB(255, 234, 199, 132),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Frappe',
                                      style: TextStyle(
                                        fontFamily: 'SoDoSans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  width: width * 0.45,
                                  height: height * 0.09,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Card(
                                color: Color.fromARGB(255, 54, 36, 21),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Espresso',
                                      style: TextStyle(
                                        fontFamily: 'SoDoSans',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                  width: width * 0.45,
                                  height: height * 0.15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 5),
            child: Row(
              children: [
                Image.asset('images/starbs2.png', height: 45, width: 45),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Starbucks',
                  style: TextStyle(
                    fontFamily: 'SoDoSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
