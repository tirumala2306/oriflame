import 'package:flutter/material.dart';
import 'package:oriflame/core/routes/app_router.dart';
import 'package:oriflame/core/theme/app_theme.dart';
import 'package:oriflame/core/utils/screen_utils.dart';

class OriflameApp extends StatelessWidget {
  const OriflameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtils.init(
      builder: (context) {
        return MaterialApp.router(
          title: 'Oriflame Sweden',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
