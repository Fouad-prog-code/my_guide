import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/admin/screens/timetable_screen.dart';

class GroupTimetableScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> data;
  final name;

  const GroupTimetableScreen({
    super.key,
    required this.data,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();

    return DefaultTabController(
      length: keys.length,
      child: Scaffold(
        body: TabBarView(
          children: keys.map((group) {
            return TimetableGridScreen(data: data[group]!, name: name);
          }).toList(),
        ),
      ),
    );
  }
}
