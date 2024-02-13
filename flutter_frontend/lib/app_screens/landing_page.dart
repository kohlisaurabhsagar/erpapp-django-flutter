import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/custom_routes/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //---------------------------------------------------------------------------------
  //variable declared to keep track of which bottom-navigation button is clicked
  int current1 = 0;
  //variable declared to keep track of which upper-naviagtion button is clicked
  int current2 = 0;
  //variable declared to keep track of which menu-item is clicked
  int current3 = 0;

  //-----------------------------------------------------------------------------------
  //list containing the name of the upper navigation bar to iterate over
  List<String> items = ["DCR", "Master", "Transaction", "Report"];
  //-----------------------------------------------------------------------------------
  //list containting the directory of menu-items icons
  List imgD = [
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
    'assets/images/image7.png',
    'assets/images/image8.png',
    'assets/images/image9.png',
    'assets/images/image10.png',
    'assets/images/image11.png',
    'assets/images/image12.png'
  ];
  //-------------------------------------------------------------------------------------------
  //list contains the names of all menu-items which can be iterated over inside gridview widget to create a menu
  List nameD = [
    'Day Plan',
    'Dr. Call',
    'Dr. Remainder Call',
    'Dr. Sample',
    'Chemist Call',
    'Chemist Remainder Call',
    'Customer Call',
    'Expense',
    'Summary',
    'Final Submit'
  ];
  //-------------------------------------------------------------------------------------------
  // varaibles declared
  bool _authenticationed = true;
  int id = 0;
  String userId = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String token = '';

  //-------------------------------------------------------------------------------------------
  //getting the data out of the persistence storage
  Future<void> getuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('id') ?? 0;
      userId = prefs.getString('userId') ?? '';
      firstName = prefs.getString('firstName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      phoneNumber = prefs.getString('phoneNumber') ?? '';
      token = prefs.getString('token') ?? '';
    });
  }

  //--------------------------------------------------------------------------------------------
  // method to clear the persistence storage after the logout of the app
  Future<void> clearAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  //--------------------------------------------------------------------------------------------
  // method to get logout of the the app
  Future<void> logout(String token) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/accounts/logout/"),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      // print(response.statusCode);
      if (response.statusCode == 204) {
        setState(() {
          _authenticationed = false;
        });
      }
    } catch (error) {
      // print('Exception: $error');
    }
  }

  //------------------------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    getuserdata();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(253, 253, 253, 253),
        //------------------------------------------------------------------------------------------------------------------------------
        //appbar declared
        appBar: AppBar(
          backgroundColor: const Color(0xFF04649c),
          toolbarHeight: 75.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 1.0,
          title: const Text(
            "ALPHA HEALTH INDIA",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          ],
        ),
        //-----------------------------------------------------------------------------------------------------------------------------
        //sidebar declared
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$firstName $lastName'),
              accountEmail: Text(' $phoneNumber'),
              decoration: const BoxDecoration(color: Color(0xFF04649c)),
              currentAccountPicture: const CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person_3,
                    size: 50,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text("Share"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text("Policiies"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                logout(token);
                // Introduce a delay of 2 seconds after loginUser
                Future.delayed(const Duration(seconds: 2), () {
                  if (_authenticationed == false) {
                    clearAllData();
                    Navigator.pushNamed(context, loginRoute);
                  }
                });
              },
            ),
          ],
        )),
        //------------------------------------------------------------------------------------------------------------------------
        //upper-navigation bar declared
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
                width: double.infinity,
                child: Container(
                    color: Colors.grey,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current2 = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5.0),
                                width: 100,
                                height: 15,
                                decoration: BoxDecoration(
                                    color: current2 == index
                                        ? const Color.fromARGB(255, 43, 175, 96)
                                        : Colors.grey,
                                    borderRadius: current2 == index
                                        ? BorderRadius.circular(20)
                                        : BorderRadius.circular(15),
                                    border: current2 == index
                                        ? Border.all(
                                            color: const Color.fromARGB(
                                                255, 17, 150, 70),
                                            width: 2)
                                        : null),
                                child: Center(
                                    child: Text(
                                  items[index],
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                )),
                              ));
                        })),
              ),
              //-----------------------------------------------------------------------------------------------------------
              //main body where menu-items are present
              Container(
                  margin: const EdgeInsets.only(
                      top: 40, bottom: 5, left: 10, right: 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                        mainAxisSpacing: 30,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Material(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    current3 = index;
                                  });
                                  if (current3 == 1) {
                                    Navigator.pushNamed(context, drCall1Route);
                                  }
                                  if (current3 == 3) {
                                    Navigator.pushNamed(
                                        context, drSample1Route);
                                  }
                                  if (current3 == 4) {
                                    Navigator.pushNamed(
                                        context, chemistCall1Route);
                                  }
                                  if (current3 == 6) {
                                    Navigator.pushNamed(
                                        context, customerCall1Route);
                                  }
                                },
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 3,
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          imgD[index],
                                          width: 60,
                                          height: 60,
                                        ),
                                        Text(
                                          nameD[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ))));
                      })),
            ],
          ),
        ),
        //-----------------------------------------------------------------------------------------------------
        //bottomnaviagation bar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF04649c),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400]!,
          type: BottomNavigationBarType.fixed,
          currentIndex: current1,
          onTap: (int index) {
            setState(() {
              current1 = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.update,
                ),
                label: "Updates"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pending_actions,
                ),
                label: "Pending Tasks"),
          ],
        ),
      ),
    );
  }
}
