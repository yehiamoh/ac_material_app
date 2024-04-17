import 'package:ac_material_app/screens/home_screen.dart';
import 'package:ac_material_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffECE6E6),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 32.sp,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 32.sp,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}