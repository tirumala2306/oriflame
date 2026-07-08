import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/constants/app_enums.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';
import 'package:oriflame/features/smart_post/models/post_item.dart';
import 'package:oriflame/features/smart_post/models/share_platform_info.dart';
import 'package:oriflame/features/smart_post/widgets/product_info_box.dart';
import 'package:oriflame/features/smart_post/widgets/quick_share_row.dart';
import 'package:oriflame/shared/widgets/app_bottom_nav_bar.dart';

class SmartPostOverlay extends StatelessWidget {
  const SmartPostOverlay({
    super.key,
    required this.post,
    required this.showProductBox,
    this.onCaptionTap,
    this.onEditCaptionTap,
    this.onShareTap,
  });

  final PostItem post;
  final bool showProductBox;
  final VoidCallback? onCaptionTap;
  final VoidCallback? onEditCaptionTap;
  final void Function(SharePlatformInfo platform)? onShareTap;

  static const _bottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(47, 47, 47, 0),
      Color.fromRGBO(47, 47, 47, 0.6),
      Color.fromRGBO(47, 47, 47, 0.6),
    ],
    stops: [0.0, 0.54, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _ProfileBadge(label: post.communityLabel)),
                      _PickIndicator(label: post.indexLabel),
                    ],
                  ),
                  const Spacer(),
                  ProductInfoBox(post: post, visible: showProductBox),
                ],
              ),
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(gradient: _bottomGradient),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MusicRecommendation(
                    title: post.musicTitle,
                    artist: post.musicArtist,
                  ),
                  SizedBox(height: 4.h),
                  CaptionCard(
                    caption: post.caption,
                    onTap: onCaptionTap,
                    onEditTap: onEditCaptionTap,
                  ),
                  SizedBox(height: 16.h),
                  QuickShareRow(onPlatformTap: onShareTap),
                  AppBottomNavBar(currentIndex: BottomNavItem.home.index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MusicRecommendation extends StatelessWidget {
  const _MusicRecommendation({
    required this.title,
    required this.artist,
  });

  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 34.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.musicRecommendationBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.music_note, color: Colors.white, size: 16.sp),
          SizedBox(width: 4.w),
          Expanded(
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'RECOMMENDED: ',
                    style: AppTypography.musicRecommendedLabel,
                  ),
                  TextSpan(
                    text: title,
                    style: AppTypography.musicTitle,
                  ),
                  TextSpan(
                    text: ' by $artist',
                    style: AppTypography.musicArtist,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileBadge extends StatelessWidget {
  const _ProfileBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF4F4F4), width: 1.w),
          ),
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: const Color(0xFFF4F4F4),
            backgroundImage: const AssetImage(AppAssets.profileImage1),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.readyToShareBg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      'Ready to share',
                      style: AppTypography.readyToShareLabel,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Text(label, style: AppTypography.communityLabel),
            ],
          ),
        ),
      ],
    );
  }
}

class _PickIndicator extends StatelessWidget {
  const _PickIndicator({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
