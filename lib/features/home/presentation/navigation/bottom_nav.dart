import 'package:cooks_corner/features/home/presentation/navigation/bottom_nav_item.dart';
import 'package:cooks_corner/features/home/presentation/pages/home.dart';
import 'package:cooks_corner/features/profile/presentation/pages/profile.dart';
import 'package:cooks_corner/features/search/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final _children = const [Home(), Search(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: BottomNavItem.values.map(_buildBottomNavigationBarItem).toList(),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(BottomNavItem item) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        item.selectedIcons,
      ),
      icon: SvgPicture.asset(
        item.unselectedIcons,
      ),
      label: item.name,
    );
  }
}
