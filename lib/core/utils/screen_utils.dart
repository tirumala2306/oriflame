import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  ScreenUtils._();

  static const Size designSize = Size(390, 844);

  static Widget init({
    required Widget Function(BuildContext context) builder,
  }) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => builder(context),
    );
  }
}
