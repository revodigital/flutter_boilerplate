import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/view/listchar_view.dart';

import '../view/listpicture_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const Map _widgetOptions = {
    0: {"label": "REST", "widget": ListPicture(), "icon": Icon(Icons.api)},
    1: {"label": "GraphQL", "widget": ListChar(), "icon": Icon(Icons.graphic_eq)}
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex]["widget"],
      bottomNavigationBar: BottomNavigationBar(
        items: _widgetOptions.values.map((value) => BottomNavigationBarItem(
          icon: value["icon"],
          label: value["label"]
        )).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}