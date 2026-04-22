import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/admin/screens/timetable_screen.dart';

class GroupTimetableScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> data;

  const GroupTimetableScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();

    return DefaultTabController(
      length: keys.length,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Timetables"),
        //   bottom: TabBar(
        //     isScrollable: true,
        //     tabs: keys.map((e) => Tab(text: e)).toList(),
        //   ),
        // ),
        body: TabBarView(
          children: keys.map((group) {
            return TimetableGridScreen(data: data[group]!);
          }).toList(),
        ),
      ),
    );
  }
}
