import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/theme/app_colors.dart';

class ReelsPageIndicator extends StatelessWidget {
  const ReelsPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  final int count;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 58.h,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: const Color(0x8F464646),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(count, (index) {
          final isActive = index == currentIndex;
          return Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.tabSelected
                  : Colors.white,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}
