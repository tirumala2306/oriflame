import 'package:flutter/foundation.dart';
import 'package:oriflame/core/constants/app_enums.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareLauncher {
  ShareLauncher._();

  static String urlFor(SharePlatform platform) {
    return switch (platform) {
      SharePlatform.instagram => 'https://www.instagram.com/',
      SharePlatform.facebook => 'https://www.facebook.com/',
      SharePlatform.messenger => 'https://www.messenger.com/',
      SharePlatform.tiktok => 'https://www.tiktok.com/',
      SharePlatform.whatsapp => 'https://wa.me/',
      SharePlatform.whatsappBusiness => 'https://wa.me/',
      SharePlatform.telegram => 'https://t.me/',
      SharePlatform.friend => 'mailto:?subject=Oriflame%20Share',
      SharePlatform.oriflameApp => 'https://www.oriflame.com/',
    };
  }

  static Future<bool> open(SharePlatform platform) async {
    final uri = Uri.parse(urlFor(platform));

    try {
      // Avoid canLaunchUrl — it can throw channel-error on Android after hot reload.
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (error) {
      if (kDebugMode) {
        debugPrint('ShareLauncher.open failed: $error');
      }
      return false;
    }
  }
}
