import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_frontend/app_screens/landing_page.dart';

class DrSample2 extends StatefulWidget {
  const DrSample2({Key? key}) : super(key: key);

  @override
  State<DrSample2> createState() => _DrSample2State();
}

class _DrSample2State extends State<DrSample2> {
  @override
  void initState() {
    super.initState();
    // Set the status bar color to blue
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 3, 5, 91),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: const Color(0xFF04649c),
          toolbarHeight: 75.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 1.0,
          title: const Text(
            " Detailing/Pob",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity, // Take the available width
                height: 70,
                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                padding: const EdgeInsets.only(
                    top: 10, left: 5, right: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[100],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 3,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Item",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 200),
                    Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Sample'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 630.0, bottom: 5),
                alignment: Alignment.center,
                child: SizedBox(
                    height: 52.0,
                    width: 400.0,
                    child: AnimatedButton(
                        text: 'Submit',
                        color: const Color(0xFF04649c),
                        pressEvent: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            showCloseIcon: true,
                            title: 'Success',
                            desc: 'Yupp...',
                          ).show();
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
