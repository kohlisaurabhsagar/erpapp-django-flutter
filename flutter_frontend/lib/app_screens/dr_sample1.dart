import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/app_screens/dr_sample2.dart';
import 'package:flutter_frontend/app_screens/dr_call_page3.dart';
// import 'package:flutter_frontend/app_screens/landing_page.dart';

class DrSample1 extends StatefulWidget {
  const DrSample1({Key? key}) : super(key: key);

  @override
  State<DrSample1> createState() => _DrSample1State();
}

class _DrSample1State extends State<DrSample1> {
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
            "Doctor Sample ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
                width: 400,
                height: 90,
                margin: const EdgeInsets.only(top: 20, left: 27, right: 27),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 3,
                        blurRadius: 8,
                      )
                    ]),
                child: Material(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DrCall3()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: ' Doctor Name ',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                focusColor: Colors.black54,
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: const OutlineInputBorder(),
                                prefixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: const Icon(
                                          Icons.person_2_outlined,
                                          color: Color(0xFF04649c),
                                        )), // Your username icon
                                    const SizedBox(width: 5.0),
                                    // Adjust the spacing as needed
                                    Text(' | ',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.grey[400])),
                                    const Text(' Select Doctor ',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                        margin:
                                            const EdgeInsets.only(left: 110),
                                        child: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                        )),
                                    // Separator
                                  ],
                                ),
                              )),
                        )))),
            Container(
                width: 400,
                height: 70,
                margin: const EdgeInsets.only(top: 20, left: 27, right: 27),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 3,
                        blurRadius: 8,
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Text(
                      "Detailing/Pob",
                      style: TextStyle(
                        color: Color(0xFF04649c),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 110),
                      color: const Color(0xFF04649c),
                      width: 92,
                      height: 37,
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 35.0,
                        width: 90.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DrSample2()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            '+  Add',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF04649c),
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 400,
                height: 70,
                margin: const EdgeInsets.only(top: 20, left: 27, right: 27),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[100],
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 3,
                        blurRadius: 8,
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Text(
                      "Input",
                      style: TextStyle(
                        color: Color(0xFF04649c),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 80),
                    Container(
                      margin: const EdgeInsets.only(left: 110),
                      color: const Color(0xFF04649c),
                      width: 92,
                      height: 37,
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 35.0,
                        width: 90.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const DrCall()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            '+  Add',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF04649c),
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 420.0, left: 15),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 52.0,
                    width: 185.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 43, 175, 96),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        'Submit Call',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black38,
                  margin: const EdgeInsets.only(top: 420.0, left: 10),
                  width: 188,
                  height: 55,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 52.0,
                    width: 185.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LandingPage(user: user,token: token,)));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'Later',
                        style: TextStyle(color: Colors.black45, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
