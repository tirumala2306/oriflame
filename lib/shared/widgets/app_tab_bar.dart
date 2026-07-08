import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_enums.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key, required this.selectedTab, this.onTabSelected});

  final SmartPostTab selectedTab;
  final ValueChanged<SmartPostTab>? onTabSelected;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Row(
        children: SmartPostTab.values.map((tab) {
          final isSelected = tab == selectedTab;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected?.call(tab),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      _labelFor(tab),
                      style: AppTypography.tabLabel.copyWith(
                        color: isSelected
                            ? AppColors.tabSelected
                            : AppColors.tabInactive,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _labelFor(SmartPostTab tab) {
    return switch (tab) {
      SmartPostTab.smartPost => 'Smart Post',
      SmartPostTab.library => 'Library',
      SmartPostTab.communities => 'Communities',
      SmartPostTab.shareAndWin => 'Share&Win',
    };
  }
}
