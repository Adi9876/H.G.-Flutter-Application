import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("H.G.- App"),
        backgroundColor: Colors.pink[400],
        shadowColor: Colors.white,
        elevation: 5,
      ),
      body: PageView(
        controller: pageController,
        children: [
          //EXPECTATION
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "EXPECTATIONS \n",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink[400],
                        fontWeight: FontWeight.w900),
                  )),
                  Text("1. Hostel Life: \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(
                      "\t Staying in hostels would be fun, late night fun with friends overall a joyful life"),
                  Image.asset("assets/images/OIP.jpg"),
                  Text("\n 2. Trips to City: \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(
                      "\t Weekends would be amazing going on trip to the city, movies food etc."),
                  Image.asset("assets/images/trip.jpg"),
                  Text("\n 3. No HomeWork \n ",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("\t Thought that there would be no homework given"),
                  Image.asset("assets/images/hw.jpg"),
                  Text("\n 4. Flexible Schedule\n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(" \t No worries about waking up early like in schools "),
                  Image.asset("assets/images/2exp.jpg"),
                  Text("\n 5. Mess Food \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(
                      " \tThought that it will be non-edible and i'll get ill"),
                  Image.asset("assets/images/R.jpg"),
                ],
              ),
            ),
          ),

          //REALITY
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "REALITY \n",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink[400],
                        fontWeight: FontWeight.w900),
                  )),
                  Text("1. Hostel Life: \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("\t Don't even get time to take rest"),
                  Image.asset("assets/images/1real.jpg"),
                  Text("\n 2. Trips to City: \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("\t  Weekends are busy with paper-work and meetings."),
                  Image.asset("assets/images/paperwork.jpg"),
                  Text("\n 3. No HomeWork \n ",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text("\t -_-* What!  What did i thought back then !!"),
                  Image.asset("assets/images/1real.jpg"),
                  Text("\n 4. Flexible Schedule\n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(
                      " \t Had there been only regular classes could have managed but EXTRA CLASSES Oh Man !! "),
                  Image.asset("assets/images/2real.jpg"),
                  Text("\n 5. Mess Food \n",
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  Text(" \t Food is much more better than expected"),
                  Image.asset("assets/images/food.jpg"),
                ],
              ),
            ),
          ),

          //ABOUT ME
          Container(
            color: Colors.white,
            child: Stack(children: [
              Image.asset(
                "assets/images/background.jpg",
              ),
              Positioned(
                top: 110,
                left: 110,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  backgroundImage: AssetImage("assets/images/me.jpg"),
                  radius: 70,
                ),
              ),
              Positioned(
                  top: 250,
                  left: 110,
                  child: Container(
                    child: Text(
                      "Aditya Yadav",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  )),
              Positioned(
                top: 300,
                left: 135,
                child: Row(children: [
                  InkWell(
                      onTap: () async {
                        String url =
                            "https://www.linkedin.com/in/aditya-yadav-760830250/";
                        launch(url);
                      },
                      child: Image.asset(
                        "assets/images/lkd.jpg",
                        scale: 3.5,
                      )),
                  InkWell(
                      onTap: () async {
                        String url = "https://www.github.com/Adi9876";
                        launch(url);
                      },
                      child: Image.asset(
                        "assets/images/githb.jpg",
                        scale: 5,
                      )),
                ]),
              ),
              Positioned(
                top: 380,
                left: 10,
                child: Container(
                  width: 350,
                  height: 200,
                  child: Text(
                      "About Me:\n \nInterested in CyberSecurity, BlockChain, Software Dev. \nand IoT ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), title: Text("Expectation")),
          BottomNavigationBarItem(
              icon: Icon(Icons.healing), title: Text("Reality")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("About Me")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.white,
        onTap: onTapped,
      ),
    );
  }
}
