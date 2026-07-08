import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/constants/app_enums.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavIcon(
            assetPath: AppAssets.explore,
            selected: currentIndex == BottomNavItem.explore.index,
            onTap: () => onTap?.call(BottomNavItem.explore.index),
          ),
          _NavIcon(
            assetPath: AppAssets.search,
            selected: currentIndex == BottomNavItem.search.index,
            onTap: () => onTap?.call(BottomNavItem.search.index),
          ),
          _NavIcon(
            assetPath: AppAssets.home,
            selected: currentIndex == BottomNavItem.home.index,
            onTap: () => onTap?.call(BottomNavItem.home.index),
          ),
          _NavIcon(
            assetPath: AppAssets.chat,
            selected: currentIndex == BottomNavItem.chat.index,
            onTap: () => onTap?.call(BottomNavItem.chat.index),
          ),
          _NavIcon(
            assetPath: AppAssets.profile,
            selected: currentIndex == BottomNavItem.profile.index,
            onTap: () => onTap?.call(BottomNavItem.profile.index),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.assetPath,
    required this.selected,
    this.onTap,
  });

  final String assetPath;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      assetPath,
      width: 32.w,
      height: 32.w,
      fit: BoxFit.contain,
      color: Colors.white,
    );

    return GestureDetector(
      onTap: onTap,
      child: image,
    );
  }
}
