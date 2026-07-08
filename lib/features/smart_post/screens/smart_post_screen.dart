import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame/core/constants/app_enums.dart';
import 'package:oriflame/core/routes/app_routes.dart';
import 'package:oriflame/features/smart_post/data/mock_posts.dart';
import 'package:oriflame/features/smart_post/models/post_item.dart';
import 'package:oriflame/features/smart_post/models/share_platform_info.dart';
import 'package:oriflame/features/smart_post/utils/reels_page_physics.dart';
import 'package:oriflame/features/smart_post/widgets/reels_page_indicator.dart';
import 'package:oriflame/features/smart_post/widgets/share_loading_overlay.dart';
import 'package:oriflame/features/smart_post/widgets/smart_post_overlay.dart';
import 'package:oriflame/shared/widgets/app_header.dart';
import 'package:oriflame/shared/widgets/app_tab_bar.dart';

class SmartPostScreen extends StatefulWidget {
  const SmartPostScreen({super.key});

  @override
  State<SmartPostScreen> createState() => _SmartPostScreenState();
}

class _SmartPostScreenState extends State<SmartPostScreen> {
  final PageController _pageController = PageController();
  Timer? _productBoxTimer;

  late List<PostItem> _posts;
  int _currentIndex = 0;
  bool _showProductBox = false;
  SharePlatformInfo? _loadingPlatform;

  @override
  void initState() {
    super.initState();
    _posts = List<PostItem>.from(MockPosts.all);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scheduleProductBox());
  }

  void _scheduleProductBox() {
    _productBoxTimer?.cancel();
    setState(() => _showProductBox = true);
    _productBoxTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() => _showProductBox = false);
    });
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    _scheduleProductBox();
  }

  Future<void> _openEditCaption(PostItem post) async {
    final result = await context.push<String>(
      AppRoutes.editCaption,
      extra: post.caption,
    );
    if (result != null && mounted) {
      setState(() {
        _posts[_currentIndex] = post.copyWith(caption: result);
      });
    }
  }

  void _onShareTap(SharePlatformInfo platform) {
    setState(() => _loadingPlatform = platform);
  }

  void _onLoadingComplete() {
    setState(() => _loadingPlatform = null);
  }

  @override
  void dispose() {
    _productBoxTimer?.cancel();
    _productBoxTimer = null;
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppHeader(),
            const AppTabBar(selectedTab: SmartPostTab.smartPost),
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: const ReelsPagePhysics(),
                    itemCount: _posts.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      final post = _posts[index];
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(post.imageAsset, fit: BoxFit.cover),
                          if (index == _currentIndex)
                            SmartPostOverlay(
                              post: post,
                              showProductBox: _showProductBox,
                              onCaptionTap: () => _openEditCaption(post),
                              onEditCaptionTap: () => _openEditCaption(post),
                              onShareTap: _onShareTap,
                            ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    right: 16.w,
                    top: 261.h,
                    child: ReelsPageIndicator(
                      count: _posts.length,
                      currentIndex: _currentIndex,
                    ),
                  ),
                  if (_loadingPlatform != null)
                    ShareLoadingOverlay(
                      platform: _loadingPlatform!,
                      onComplete: _onLoadingComplete,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
