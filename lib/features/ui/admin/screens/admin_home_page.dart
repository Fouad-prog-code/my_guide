import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/admin/screens/dashboard_screen/dashboard_screen.dart';
import 'package:my_guide/features/ui/admin/screens/department_screen/department_screen.dart';
import 'package:my_guide/features/ui/admin/screens/doctor_screen/doctors_screen.dart';
import 'package:my_guide/features/ui/admin/screens/generate_tables/generate_time_tables.dart';
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
  String fullName = 'User Name';
  String userName = '@username';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final fName = await SharedPreferencesUtils.getData(key: 'fullName');
    final uName = await SharedPreferencesUtils.getData(key: 'userName');
    if (mounted) {
      setState(() {
        fullName = fName ?? 'User Name';
        userName = uName ?? '@username';
      });
    }
  }

  final screens = [
    DashboardScreen(),
    StudentScreen(),
    SubjectsScreen(),
    DoctorsScreen(),
    ManagerScreen(),
    DepartmentScreen(),
    RoomsScreen(),
    GenerateTimeTabelsScreen(),
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard},
    {'title': 'Students', 'icon': Icons.people},
    {'title': 'Subjects', 'icon': Icons.book},
    {'title': 'Doctors', 'icon': Icons.local_hospital},
    {'title': 'Managers', 'icon': Icons.manage_accounts},
    {'title': 'Departments', 'icon': Icons.account_tree},
    {'title': 'Rooms', 'icon': Icons.room},
    {'title': 'Generate', 'icon': Icons.schedule},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        title: Text(menuItems[index]['title'], style: AppStyles.blod24White),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
      ),

      drawer: _buildDrawer(),

      body: Row(
        children: [Expanded(child: SafeArea(child: screens[index]))],
      ),

      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80.h, bottom: 28.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 2.w,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.r,
                        child: Icon(
                          Icons.person,
                          size: 40.r,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        fullName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      userName,
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                  ],
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
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
                child: ElevatedButton(
                  onPressed: () {
                    SharedPreferencesUtils.removeData(key: 'token');
                    SharedPreferencesUtils.removeData(key: 'fullName');
                    SharedPreferencesUtils.removeData(key: 'userName');
                    SharedPreferencesUtils.removeData(key: 'userId');
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginRoute,
                      (_) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redColor,

                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 24, color: AppColors.whiteColor),
                      SizedBox(width: 8.w),
                      Text("Logout", style: AppStyles.blod24White),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
