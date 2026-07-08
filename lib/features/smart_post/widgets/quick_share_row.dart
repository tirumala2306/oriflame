import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';
import 'package:oriflame/features/smart_post/models/share_platform_info.dart';
import 'package:oriflame/features/smart_post/utils/caption_text_builder.dart';

class QuickShareRow extends StatelessWidget {
  const QuickShareRow({super.key, this.onPlatformTap});

  final ValueChanged<SharePlatformInfo>? onPlatformTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          Text('Quick share to:', style: AppTypography.quickShareLabel),
          SizedBox(width: 8.w),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: SharePlatformInfo.all.length,
              separatorBuilder: (_, index) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final platform = SharePlatformInfo.all[index];
                return GestureDetector(
                  onTap: () => onPlatformTap?.call(platform),
                  child: _ShareIcon(platform: platform),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareIcon extends StatelessWidget {
  const _ShareIcon({required this.platform});

  final SharePlatformInfo platform;

  @override
  Widget build(BuildContext context) {
    final icon = Container(
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(254, 254, 254, 0.25),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        platform.assetPath,
        width: 20.92.w,
        height: 20.92.w,
        fit: BoxFit.contain,
      ),
    );

    if (!platform.showSelectionRing) return icon;

    return Container(
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(platform.ringColor), width: 1.5.w),
      ),
      child: Container(
        width: 28.w,
        height: 28.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 254, 254, 0.25),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          platform.assetPath,
          width: 20.92.w,
          height: 20.92.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class CaptionCard extends StatelessWidget {
  const CaptionCard({
    super.key,
    required this.caption,
    this.onTap,
    this.onEditTap,
  });

  final String caption;
  final VoidCallback? onTap;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.musicRecommendationBackground,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              text: CaptionTextBuilder.buildSpan(caption),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                // Text(
                //   'See More',
                //   style: TextStyle(
                //     color: Colors.white.withValues(alpha: 0.7),
                //     fontSize: 12.sp,
                //     decoration: TextDecoration.underline,
                //     decorationColor: Colors.white.withValues(alpha: 0.7),
                //   ),
                // ),
                const Spacer(),
                GestureDetector(
                  onTap: onEditTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Edit Caption',
                        style: AppTypography.editCaptionButton.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
