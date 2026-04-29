import 'package:flutter/material.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/admin/screens/dashboard_screen.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/doctors_screen.dart';
import 'package:my_guide/features/ui/admin/screens/generate_time_tables.dart';
import 'package:my_guide/features/ui/admin/screens/manager_screen/manager_screen.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/rooms_screen.dart';
import 'package:my_guide/features/ui/admin/screens/subject_screen/subjects_screen.dart';
import 'package:my_guide/features/ui/admin/screens/student_screen/Student_screen.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int index = 0;

  final screens = [
    DashboardScreen(),
    StudentScreen(),
    SubjectsScreen(),
    DoctorsScreen(),
    ManagerScreen(),
    RoomsScreen(),
    GenerateTimeTabelsScreen(),
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard},
    {'title': 'Students', 'icon': Icons.people},
    {'title': 'Subjects', 'icon': Icons.book},
    {'title': 'Doctors', 'icon': Icons.local_hospital},
    {'title': 'Manager', 'icon': Icons.manage_accounts},
    {'title': 'Rooms', 'icon': Icons.room},
    {'title': 'Generate', 'icon': Icons.schedule},
  ];

  @override
  Widget build(BuildContext context) {
    // تحديد هل الشاشة موبيل بناءً على العرض
    bool isMobile = MediaQuery.of(context).size.width < 850;

    return Scaffold(
      // في الموبيل بنضيف AppBar و Drawer
      appBar: isMobile
          ? AppBar(
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.whiteColor),
              title: Text(
                menuItems[index]['title'],
                style: AppStyles.blod24White,
              ),
              backgroundColor: Colors.blueGrey[900],
              elevation: 0,
            )
          : null,
      drawer: isMobile ? _buildDrawer() : null,

      body: Row(
        children: [
          /// Sidebar يظهر فقط في حالة الويب/تابلت
          if (!isMobile) _buildSidebar(),

          /// المحتوى الرئيسي
          Expanded(
            child: SafeArea(
              // لضمان عدم التداخل مع النوتش في الموبيل
              child: screens[index],
            ),
          ),
        ],
      ),

      // إضافة Bottom Navigation في حالة الموبيل فقط لسهولة الوصول بالإبهام
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              currentIndex: index,
              onTap: (i) => setState(() => index = i),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blueGrey[900],
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              iconSize: 24,
              items: menuItems
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: Icon(item['icon']),
                      label: item['title'],
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "ADMIN PANEL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, i) =>
                  sidebarItem(menuItems[i]['title'], menuItems[i]['icon'], i),
            ),
          ),
          const Divider(color: Colors.white24),
          sidebarItem("Logout", Icons.logout, -1),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              accountName: Text("Admin User"),
              accountEmail: Text("admin@system.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ...List.generate(
              menuItems.length,
              (i) => ListTile(
                leading: Icon(menuItems[i]['icon'], color: Colors.white),
                title: Text(
                  menuItems[i]['title'],
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() => index = i);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sidebarItem(String title, IconData icon, int i) {
    bool isSelected = index == i;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.white : Colors.grey[400]),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[300],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {
        if (i == -1) {
          showLogoutDialog(context);
        } else {
          setState(() => index = i);
        }
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
