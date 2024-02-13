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
  //------------------------------------------------------------------------------------------
  // getting all the input values entered by use on login page
  final TextEditingController _companyCodeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
//--------------------------------------------------------------------------------------------
  final _formKey = GlobalKey<
      FormState>(); //defining the form to take user input and  easy form validation
//-------------------------------------------------------------------------------------------
// all the necessary variables are declared and initialized here
  var userid = "";
  var company = "";
  var password = "";
  bool _authentication = false;
  bool _exception = false;
//--------------------------------------------------------------------------------------------
// this method is used to show error message to the user in the form of pop up.
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

//----------------------------------------------------------------------------------------------
  Future<void> loginUser(String userid, String password) async {
    //--------------------------------------------------------------------------
    try {
      //---------------------------------------------------------------------------
      //making the login api call to fetch the use data but as backend api only takes userid and password data to login,so further call would be required to verify the company code provided by user
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/accounts/login/"),
        body: {'userid': userid, 'password': password},
      );
      if (response.statusCode == 200) {
        // Parse the JSON string into a Map
        Map<String, dynamic> jsonData1 = json.decode(response.body);

        // Extract the "company" field
        int compid = jsonData1['user']['company'];
        String token = jsonData1['token'];
        //------------------------------------------------------------------------
        //making the api call again to fetch the company name as company id is fetched in the response variable (as login api only provides the company id)
        var response2 = await http
            .get(Uri.parse("http://10.0.2.2:8000/company/companies/$compid/"));

        Map<String, dynamic> jsonData2 = json.decode(response2.body);

        // Extract the "company" field
        String companyName = jsonData2['company_name'];
        //--------------------------------------------------------------------------------------
        // comparing the fetched company name with the user provided company name, if both are equal then setting the authentication varaibale true so that the user can navigate to next page
        if (company.toLowerCase() == companyName) {
          setState(() {
            _authentication = true;
          });
        } else {
          // logging out from the backend, as we have logged in but company code verification being failed so no navigation to the next page for the user
          await http.post(
            Uri.parse("http://10.0.2.2:8000/accounts/logout/"),
            headers: {
              'Authorization': 'Token $token',
            },
          );
        }
        //---------------------------------------------------------------------------
        //saving all the values got from backend to the persistence storage provided by flutter so that this information can be made available to all other appscreen pages instead of making the api calls again
        Map<String, dynamic> responseData = json.decode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setInt('id', responseData['user']['id']);
        prefs.setString('userId', responseData['user']['userid']);
        prefs.setString('firstName', responseData['user']['first_name']);
        prefs.setString('lastName', responseData['user']['last_name']);
        prefs.setString('phoneNumber', responseData['user']['phone_number']);
        prefs.setString('token', responseData['token']);
      }
      // --------------------------------------------------------------------------
    } catch (error) {
      // print('Exception: $error'); //to debug the code
      setState(() {
        _exception =
            true; //setting the exception variable to true so that the error message  can be shown to the frontend otherwise invalid credentials messgage would be shown
      });
    }
  }

//--------------------------------------------------------------------------------------
// overriding the system UI for the status bar of the app to set its color to desired color
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

//-------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(248, 251, 250, 250),
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
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: const Text(
                                '                  Version 20220309 \n Copyright(c) Designed and Developed',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 8, 8),
                                    fontSize: 15.0),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'assets/images/image2.png',
                                width: double.infinity,
                                height: 240,
                              ),
                            ),
                          ],
                        ))))
          ],
        ));
  }
}
