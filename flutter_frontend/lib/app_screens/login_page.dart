import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_frontend/custom_routes/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _companyCodeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var userid = "";
  var company = "";
  var password = "";
  bool _authentication = false;
  bool _exception = false;

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void _handleError(String errorMessage) {
    _showErrorToast(errorMessage);
  }

  Future<void> loginUser(String userid, String password) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/accounts/login/"),
        body: {'userid': userid, 'password': password},
      );
      if (response.statusCode == 200) {
        setState(() {
          _authentication = true;
        });
        Map<String, dynamic> responseData = json.decode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setInt('id', responseData['user']['id']);
        prefs.setString('userId', responseData['user']['userid']);
        prefs.setString('firstName', responseData['user']['first_name']);
        prefs.setString('lastName', responseData['user']['last_name']);
        prefs.setString('phoneNumber', responseData['user']['phone_number']);
        prefs.setString('token', responseData['token']);
      }
    } catch (error) {
      // print('Exception: $error');
      setState(() {
        _exception = true;
      });
    }
  }

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
        backgroundColor: const Color.fromARGB(253, 253, 253, 253),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(0.0),
                    margin: const EdgeInsets.all(0),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/image1.png',
                                width: 200,
                                height: 286,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Expanded(
                                  child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: _companyCodeController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a valid Company Code';
                                        }
                                        // You can add more complex validation logic here if needed
                                        return null; // Return null if the validation is successful
                                      },
                                      decoration: InputDecoration(
                                        labelText: ' Company Code ',
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.work,
                                              color: Color.fromARGB(
                                                  255, 43, 175, 96),
                                            ),
                                            SizedBox(width: 5.0),

                                            Text('|',
                                                style: TextStyle(
                                                    fontSize:
                                                        20.0)), // Separator
                                          ],
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20.0),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a valid User Id';
                                        }
                                        // You can add more complex validation logic here if needed
                                        return null; // Return null if the validation is successful
                                      },
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        labelText: ' User Id ',
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Color.fromARGB(
                                                  255, 43, 175, 96),
                                            ), // Your username icon
                                            SizedBox(width: 5.0),
                                            // Adjust the spacing as needed
                                            Text('|',
                                                style: TextStyle(
                                                    fontSize:
                                                        20.0)), // Separator
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a valid Password';
                                        }
                                        // You can add more complex validation logic here if needed
                                        return null; // Return null if the validation is successful
                                      },
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        labelText: ' Password ',
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        border: const OutlineInputBorder(),
                                        prefixIcon: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.password,
                                              color: Color.fromARGB(
                                                  255, 43, 175, 96),
                                            ),
                                            SizedBox(width: 5.0),
                                            // Adjust the spacing as needed
                                            Text('|',
                                                style: TextStyle(
                                                    fontSize:
                                                        20.0)), // Separator
                                          ],
                                        ),
                                      ),
                                      obscureText: true,
                                    ),

                                    // ElevatedButton

                                    // Image at the bottom
                                  ],
                                ),
                              )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 25.0),
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 52.0,
                                width: 380.0,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        company = _companyCodeController.text;
                                        userid = _usernameController.text;
                                        password = _passwordController.text;

                                        loginUser(userid, password);

                                        // Introduce a delay of 3 seconds after loginUser
                                        Future.delayed(
                                            const Duration(seconds: 3), () {
                                          if (_authentication == true) {
                                            Navigator.pushNamed(
                                                context, landingRoute);
                                          } else {
                                            if (_exception == true) {
                                              setState(() {
                                                _handleError(
                                                    'An unexpected error occurred. Please try again.');
                                              });
                                            } else {
                                              setState(() {
                                                _handleError(
                                                    'Invalid Credentials!!!');
                                              });
                                            }
                                          }
                                        });
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 43, 175, 96),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  child: const Text(
                                    'Next ->',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'assets/images/image2.png',
                                width: double.infinity,
                                height: 300,
                              ),
                            ),
                          ],
                        ))))
          ],
        ));
  }
}
