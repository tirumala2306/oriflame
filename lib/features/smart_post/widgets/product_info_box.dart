import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';
import 'package:oriflame/features/smart_post/models/post_item.dart';

class ProductInfoBox extends StatelessWidget {
  const ProductInfoBox({
    super.key,
    required this.post,
    this.visible = true,
    this.onTap,
  });

  final PostItem post;
  final bool visible;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 0.3),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 52.h,
            margin: EdgeInsets.only(bottom: 8.h),
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: AppColors.productInfoBackground,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    AppAssets.lipstick,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      post.productName,
                      style: AppTypography.productName,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          post.productPrice,
                          style: AppTypography.productPrice,
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                          decoration: BoxDecoration(
                            color: AppColors.discountBadgeBackground,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            post.productDiscount,
                            style: AppTypography.productDiscount,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
