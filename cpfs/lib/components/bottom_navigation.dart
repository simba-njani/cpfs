import 'package:cpfs/screens/home_page.dart';
import 'package:cpfs/screens/loans_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appScreens = [
    const  Home(),
    const LoanPage(),
    const Center(child: Text("settings")),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
      //  print("the selected index is $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_selectedIndex],
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        items: [
          Icon(Icons.home),
          Icon(Icons.pending_actions),
          Icon(Icons.settings)
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
