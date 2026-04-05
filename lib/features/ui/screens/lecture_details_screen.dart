import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> detailsList =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // تحسين الـ AppBar
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          title: Text('تفاصيل المحاضرة', style: AppStyles.blod24White),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.dg),
          child: Column(
            children: [
              SizedBox(height: 10.h),

              Card(
                elevation: 5,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        icon: Icons.school,
                        label: 'اسم المادة',
                        value: detailsList[2],
                      ),

                      _buildDivider(),

                      _buildDetailRow(
                        icon: Icons.person_outline,
                        label: 'المحاضر',
                        value: 'د. احمد محمد',
                      ),

                      _buildDivider(),

                      _buildDetailRow(
                        icon: Icons.location_on_outlined,
                        label: 'المكان',
                        value: detailsList[1],
                      ),

                      _buildDivider(),

                      _buildDetailRow(
                        icon: Icons.access_time_outlined,
                        label: 'الموعد',

                        value: '${detailsList[3]}  ⬅️  ${detailsList[0]}',
                      ),
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

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.dg),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryColor, size: 24.dg),
        ),
        SizedBox(width: 16.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppStyles.bold20primary.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: AppStyles.bold20primary.copyWith(
                  fontSize: 17.sp,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Divider(
        color: Colors.grey[200],
        thickness: 1,
        indent: 50.w, // يبدأ الفاصل بعد مسافة الأيقونة
      ),
    );
  }
}
