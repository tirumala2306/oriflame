import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroLoadingContent extends StatelessWidget {
  const IntroLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -40.w,
          top: 0,
          bottom: 0,
          width: 180.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.centerLeft,
                radius: 1.2,
                colors: [
                  const Color(0xFFB8A4E8).withValues(alpha: 0.35),
                  Colors.white.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              'Almost ready.\nGet ready to',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A1A1A),
                height: 1.35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
