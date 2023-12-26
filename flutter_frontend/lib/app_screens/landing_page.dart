import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_frontend/app_screens/dr_call_page1.dart';
import 'package:flutter_frontend/app_screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int current1 = 0;
  int current2 = 0;
  int current3 = 0;
  List<String> items = ["DCR", "Master", "Transaction", "Report"];
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
  int check = 0;
  int id = 0;
  String userId = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String token = '';

  Future<void> userdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int id = prefs.getInt('id') ?? 0;
      String userId = prefs.getString('userId') ?? '';
      String firstName = prefs.getString('firstName') ?? '';
      String lastName = prefs.getString('lastName') ?? '';
      String phoneNumber = prefs.getString('phoneNumber') ?? '';
      String token = prefs.getString('token') ?? '';
    });
  }

  Future<void> logout(String token) async {
    try {
      var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/accounts/logout/"),
        body: {'token': token},
      );
      // if (response.statusCode == 200) {
      setState(() {
        check = 1;
      });
      // }
    } catch (error) {
      //
    }
    ;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(253, 253, 253, 253),
        appBar: AppBar(
          backgroundColor: const Color(0xFF04649c),
          toolbarHeight: 75.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleSpacing: 1.0,
          title: const Text(
            "ABACUS PHARMA LIMITED",
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
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '$firstName',
              ),
              accountEmail: Text("Demo"),
              decoration: BoxDecoration(color: Color(0xFF04649c)),
              currentAccountPicture: CircleAvatar(
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
              onTap: () {
                logout(token);
                if (check == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }
              },
            ),
          ],
        )),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DrCall()));
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
