import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/custom_routes/constant.dart';

class DrCall2 extends StatefulWidget {
  const DrCall2({Key? key}) : super(key: key);

  @override
  State<DrCall2> createState() => _DrCall2State();
}

class _DrCall2State extends State<DrCall2> {
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
            "Doctor Call ",
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
                          Navigator.pushNamed(context, drCall3Route);
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
                child: const Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "WORK-WITH",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                    SizedBox(width: 200),
                    Icon(Icons.add_circle_rounded)
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
                child: const Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Remark",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                  ),
                  SizedBox(width: 225),
                  Icon(Icons.arrow_drop_down)
                ])),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 420.0, left: 15),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 52.0,
                    width: 185.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, drSample1Route);
                      },
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
                  margin: const EdgeInsets.only(top: 420.0, left: 10),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 52.0,
                    width: 185.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, drCall1Route);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'Back',
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
