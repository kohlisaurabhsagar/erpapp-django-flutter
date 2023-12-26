import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/app_screens/dr_call_page2.dart';

class DrCall3 extends StatefulWidget {
  const DrCall3({Key? key}) : super(key: key);

  @override
  State<DrCall3> createState() => _DrCall3State();
}

class _DrCall3State extends State<DrCall3> {
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF04649c),
        toolbarHeight: 75.0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 1.0,
        title: const Column(
          children: [
            Text(
              "Dr. Name ",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Total: 2 ",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Material(
                    child: InkWell(
                  onTap: () {},
                  onHover: (index) {},
                  child: Container(
                    width: 500,
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
                        SizedBox(width: 20),
                        Icon(Icons.person_3_rounded),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text(
                              "WORK-WITH",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "WORK-WITH",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 5),
            alignment: Alignment.center,
            child: SizedBox(
              height: 52.0,
              width: 185.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DrCall2()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF04649c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Select Doctor',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
