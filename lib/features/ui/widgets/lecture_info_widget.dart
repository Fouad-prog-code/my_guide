import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/features/ui/widgets/icon_text_row_widget.dart';

class LectureInfoWidget extends StatelessWidget {
  const LectureInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          IconTextRowWidget(icon: Icons.access_time, text: '11:30 - 01:00'),
          SizedBox(height: 12.h),
          IconTextRowWidget(icon: Icons.place, text: 'مدرج 1'),
          SizedBox(height: 12.h),
          IconTextRowWidget(icon: Icons.school, text: 'هياكل البيانات'),
        ],
      ),
    );
  }
}
