import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/app_routes.dart';
import 'package:my_guide/core/utils/app_styles.dart';
import 'package:my_guide/features/ui/widgets/build_detail_row.dart';
import 'package:my_guide/features/ui/widgets/build_divider.dart';

class LectureDetailsScreen extends StatelessWidget {
  const LectureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> detailsList =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          toolbarHeight: 80.h,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          title: Text('تفاصيل المحاضرة', style: AppStyles.blod24White),
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
                      BuildDetailRow(
                        icon: Icons.school,
                        label: 'اسم المادة',
                        value: detailsList[2],
                      ),

                      BuildDivider(),
                      detailsList[4]
                          ? GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.doctorRoute,
                                );
                              },
                              child: BuildDetailRow(
                                icon: Icons.person_outline,
                                label: 'المحاضر',
                                value: 'د. احمد محمد',
                              ),
                            )
                          : BuildDetailRow(
                              icon: Icons.bar_chart_rounded,
                              label: 'الفرقه',
                              value: 'الثانيه',
                            ),

                      BuildDivider(),

                      BuildDetailRow(
                        icon: Icons.location_on_outlined,
                        label: 'المكان',
                        value: detailsList[1],
                      ),

                      BuildDivider(),

                      BuildDetailRow(
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
}
