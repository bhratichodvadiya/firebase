import 'package:demo/widget.dart/listview.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    home(),
    about(),
    search(),
  ];
  void demo(int Index) {
    setState(
      () {
        currentIndex = Index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Instagram',
          style: TextStyle(
              color: Colors.black, fontSize: 24,
               fontWeight: FontWeight.w700),
        ),
      ),
      bottomNavigationBar: Container(
color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10.0),
          child: GNav(
            onTabChange: demo,
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade600,
            selectedIndex:currentIndex ,
            curve: Curves.easeInCubic,
            tabActiveBorder: Border.all(color: Colors.black),
            padding: EdgeInsets.all(16),
            tabs: [
            GButton(icon:Icons.home,text: 'Home', ),
             GButton(icon:Icons.ads_click_rounded,text: 'Click', ),
              GButton(icon:Icons.person,text: 'profile', )
          ]),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     onTap: demo,
      //     showUnselectedLabels: true,
      //     selectedLabelStyle: TextStyle(
      //         color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
      //     selectedItemColor: Colors.black,
      //     currentIndex: currentIndex,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.ads_click_rounded),
      //         label: 'Click',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person_2_sharp),
      //         label: 'Profile',
      //       ),
      //     ]),
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
    );
  }
}
