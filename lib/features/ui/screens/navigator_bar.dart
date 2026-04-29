import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/screens/manager/manager_screen.dart';

import 'package:my_guide/features/ui/screens/room/room_info_widget.dart';

class NavigatorBar extends StatefulWidget {
  NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: currentIndex == 0 ? ManagerScreen() : RoomInfo()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(label: 'doctors', icon: Icon(Icons.man)),
          BottomNavigationBarItem(label: 'rooms', icon: Icon(Icons.room)),
        ],
      ),
    );
  }
}
