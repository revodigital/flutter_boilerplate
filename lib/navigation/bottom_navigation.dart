import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final Map _widgetOptions = {
    0: {'label': 'REST', 'widget': Container(), 'icon': Icon(Icons.api)},
    1: {'label': 'GraphQL', 'widget': Container(), 'icon': Icon(Icons.graphic_eq)}
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        items: _widgetOptions.values.map((value) => BottomNavigationBarItem(
          icon: value['icon'],
          label: value['label']
        )).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}