import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame/core/routes/app_routes.dart';
import 'package:oriflame/features/intro/screens/intro_video_screen.dart';
import 'package:oriflame/features/smart_post/screens/edit_caption_screen.dart';
import 'package:oriflame/features/smart_post/screens/smart_post_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.intro,
    routes: [
      GoRoute(
        path: AppRoutes.intro,
        builder: (context, state) => const IntroVideoScreen(),
      ),
      GoRoute(
        path: AppRoutes.smartPost,
        builder: (context, state) => const SmartPostScreen(),
        routes: [
          GoRoute(
            path: 'edit-caption',
            builder: (context, state) {
              final caption = state.extra as String? ?? '';
              return EditCaptionScreen(initialCaption: caption);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text(state.error.toString())),
    ),
  );
}
