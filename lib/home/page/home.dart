import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shop/home/page/favortie.dart';
import 'package:shop/home/page/homepage.dart';
import 'package:shop/home/page/profile.dart';
import 'package:shop/home/page/searchpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int _selectedIndex = 0;

  final List tabItems = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
     selectedIndex: _selectedIndex,
     showElevation: true,
     onItemSelected: (index) => setState(() {
       _selectedIndex = index;
     }),
     items: [
        FlashyTabBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorite'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
),
    );
  }
}