import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dataManager = DataManager();

  @override
  Widget build(BuildContext context) {
    // تحديد عدد الأعمد بناءً على عرض الشاشة
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600 ? 2 : (width < 900 ? 3 : 4);

    return Scaffold(
      backgroundColor:
          Colors.transparent, // لأن الخلفية محددة في الـ Scaffold الرئيسي
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard Overview",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // استخدام GridView.builder بدلاً من Wrap لتحكم أفضل في التوزيع
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1, // لضبط تناسق الطول مع العرض
              children: [
                StatCard(
                  title: "Users",
                  value: dataManager.getTotalUsers().toString(),
                  icon: Icons.people,
                  color: Colors.blueGrey,
                ),
                StatCard(
                  title: "Subjects",
                  value: dataManager.getTotalSubjects().toString(),
                  icon: Icons.book,
                  color: Colors.blue,
                ),
                StatCard(
                  title: "Doctors",
                  value: dataManager.getTotalDoctors().toString(),
                  icon: Icons.person_pin_rounded,
                  color: Colors.teal,
                ),
                StatCard(
                  title: "Rooms",
                  value: dataManager.getTotalRooms().toString(),
                  icon: Icons.meeting_room,
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // قسم الحالة (Status Section) بتصميم موبيل
            const Text(
              "System Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildStatusItem("Database connection", true),
            _buildStatusItem("AI Engine", true),
            _buildStatusItem("Last Update: 2 mins ago", null),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String label, bool? isOk) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontSize: 14)),
        trailing: isOk == null
            ? null
            : Icon(
                isOk ? Icons.check_circle : Icons.error,
                color: isOk ? Colors.green : Colors.red,
              ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // شلنا الـ width الثابت عشان الـ GridView هو اللي يتحكم
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ],
      ),
    );
  }
}
