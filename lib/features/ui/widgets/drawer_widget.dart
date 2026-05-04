import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.fullName,
    required this.userName,
  });
  final String fullName;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 80.h,
              bottom: 40.h,
              left: 12.w,
              right: 12.w,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
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

          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              tileColor: Colors.grey.withOpacity(0.05),
              leading: Icon(
                Icons.home_rounded,
                color: AppColors.primaryColor,
                size: 28.r,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),

          const Spacer(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),

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

                padding: EdgeInsets.symmetric(vertical: 16.h),

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
    );
  }
}
