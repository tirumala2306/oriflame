import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/theme/app_colors.dart';
import 'package:oriflame/core/theme/app_typography.dart';
import 'package:oriflame/features/smart_post/models/share_platform_info.dart';
import 'package:oriflame/features/smart_post/utils/share_launcher.dart';

class ShareLoadingOverlay extends StatefulWidget {
  const ShareLoadingOverlay({
    super.key,
    required this.platform,
    required this.onComplete,
  });

  final SharePlatformInfo platform;
  final VoidCallback onComplete;

  @override
  State<ShareLoadingOverlay> createState() => _ShareLoadingOverlayState();
}

class _ShareLoadingOverlayState extends State<ShareLoadingOverlay>
    with SingleTickerProviderStateMixin {
  static const _steps = [
    _LoadingStep(message: 'Generating your sales link..', progress: 0.25),
    _LoadingStep(message: 'Copying the caption to clipboard', progress: 0.5),
    _LoadingStep(message: 'Saving the content to your profile', progress: 0.75),
    _LoadingStep(
      message: 'Preparing the content for social media',
      progress: 0.95,
    ),
  ];

  late final AnimationController _spinController;
  int _currentStep = 0;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _runSequence();
  }

  Future<void> _runSequence() async {
    for (var i = 0; i < _steps.length; i++) {
      if (!mounted) return;
      setState(() {
        _currentStep = i;
        _progress = _steps[i].progress;
      });
      await Future<void>.delayed(const Duration(milliseconds: 900));
    }

    if (!mounted) return;
    await ShareLauncher.open(widget.platform.platform);
    if (!mounted) return;
    widget.onComplete();
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = _steps[_currentStep];

    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(41, 41, 41, 0.37),
                  Color.fromRGBO(11, 11, 11, 0.37),
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: 310.w,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(4, 4),
                      blurRadius: 14,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        AppAssets.loadingImage,
                        width: 48.w,
                        height: 48.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      step.message,
                      textAlign: TextAlign.center,
                      style: AppTypography.loadingMessage,
                    ),
                    SizedBox(height: 24.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: LinearProgressIndicator(
                        value: _progress,
                        minHeight: 4.h,
                        backgroundColor: const Color(0xFFEEF3F0),
                        color: AppColors.tabSelected,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingStep {
  const _LoadingStep({required this.message, required this.progress});

  final String message;
  final double progress;
}
