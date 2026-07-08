import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 40.w),
          Expanded(
            child: Center(
              child: Image.asset(
                AppAssets.oriflameLogo,
                height: 32.h,
                width: 117.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 20.sp),
          ),
        ],
      ),
    );
  }
}
