
import 'package:mentorow/constants/color.dart';
import 'package:mentorow/screens/featuerd_screen.dart';
import 'package:flutter/material.dart';
import 'package:mentorow/screens/mentordetails.dart';
import 'package:mentorow/screens/profilepage.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
 
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    const FeaturedScreen(),
    MentorDetailScreen(),
    ProfilePage(),
  ];

  static const List<IconData> _bottomNavIcons = [
    Icons.home,
    Icons.co_present_rounded,
    Icons.account_circle,
  ];
   static const List<String> _bottomNavLabels = [
    'Home',
    'Mentor', 
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor:kPrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: List.generate(_bottomNavIcons.length, 
        (index)=>BottomNavigationBarItem(
                icon: Icon(_bottomNavIcons[index], size: 30),
                label: _bottomNavLabels[index],
              ),
            )
            .toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}