import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/custom_routes/constant.dart';

class CustomerCall extends StatefulWidget {
  const CustomerCall({Key? key}) : super(key: key);

  @override
  State<CustomerCall> createState() => _CustomerCallState();
}

class _CustomerCallState extends State<CustomerCall> {
  @override
  void initState() {
    super.initState();
    // Set the status bar color to blue
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 3, 5, 91), // Set the status bar color
      statusBarBrightness:
          Brightness.light, // Set the text color of the status bar
      statusBarIconBrightness:
          Brightness.light, // Set the icon color of the status bar
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: const Color(0xFF04649c),
          toolbarHeight: 75.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 1.0,
          title: const Text(
            "Customer Call Summary",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 300.0),
              child: Column(children: [
                Image.asset(
                  "assets/images/image13.png",
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Yet to make the Chemist Call",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 284.0),
              alignment: Alignment.center,
              child: SizedBox(
                height: 52.0,
                width: 380.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, drCall2Route);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 43, 175, 96),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Text(
                    '+ New Call',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
