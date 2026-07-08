import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/constants/app_enums.dart';
import 'package:oriflame/core/routes/app_routes.dart';
import 'package:oriflame/features/intro/widgets/intro_loading_content.dart';
import 'package:oriflame/shared/widgets/app_header.dart';
import 'package:oriflame/shared/widgets/app_tab_bar.dart';
import 'package:video_player/video_player.dart';

class IntroVideoScreen extends StatefulWidget {
  const IntroVideoScreen({super.key});

  @override
  State<IntroVideoScreen> createState() => _IntroVideoScreenState();
}

class _IntroVideoScreenState extends State<IntroVideoScreen> {
  VideoPlayerController? _controller;
  bool _navigated = false;
  bool _showVideo = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initVideo());
  }

  Future<void> _initVideo() async {
    final controller = VideoPlayerController.asset(AppAssets.introVideo);
    try {
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }

      controller
        ..setLooping(false)
        ..addListener(_onVideoUpdate)
        ..play();

      setState(() {
        _controller = controller;
        _showVideo = true;
      });
    } catch (_) {
      await controller.dispose();
      _goToSmartPost();
    }
  }

  void _onVideoUpdate() {
    final controller = _controller;
    if (controller == null || _navigated) return;

    final position = controller.value.position;
    final duration = controller.value.duration;
    if (duration > Duration.zero &&
        position >= duration - const Duration(milliseconds: 300)) {
      _goToSmartPost();
    }
  }

  void _goToSmartPost() {
    if (_navigated || !mounted) return;
    _navigated = true;
    context.go(AppRoutes.smartPost);
  }

  @override
  void dispose() {
    _controller
      ?..removeListener(_onVideoUpdate)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppHeader(),
            const AppTabBar(selectedTab: SmartPostTab.smartPost),
            Expanded(
              child: ColoredBox(
                color: Colors.white,
                child: _showVideo && controller != null && controller.value.isInitialized
                    ? SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller.value.size.width,
                            height: controller.value.size.height,
                            child: VideoPlayer(controller),
                          ),
                        ),
                      )
                    : const IntroLoadingContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
