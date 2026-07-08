import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/core/constants/app_enums.dart';

class SharePlatformInfo {
  const SharePlatformInfo({
    required this.platform,
    required this.label,
    required this.assetPath,
    this.showSelectionRing = false,
    this.ringColor = 0xFFE4405F,
  });

  final SharePlatform platform;
  final String label;
  final String assetPath;
  final bool showSelectionRing;
  final int ringColor;

  static const List<SharePlatformInfo> all = [
    SharePlatformInfo(
      platform: SharePlatform.instagram,
      label: 'Instagram',
      assetPath: AppAssets.instagram,
    ),
    SharePlatformInfo(
      platform: SharePlatform.instagram,
      label: 'Instagram',
      assetPath: AppAssets.instagram,
      showSelectionRing: true,
      ringColor: 0xFFFF64EE,
    ),
    SharePlatformInfo(
      platform: SharePlatform.facebook,
      label: 'Facebook',
      assetPath: AppAssets.facebook,
    ),
    SharePlatformInfo(
      platform: SharePlatform.facebook,
      label: 'Facebook',
      assetPath: AppAssets.facebook,
      showSelectionRing: true,
      ringColor: 0xFF75A5FF,
    ),
    SharePlatformInfo(
      platform: SharePlatform.messenger,
      label: 'Messenger',
      assetPath: AppAssets.messenger,
    ),
    SharePlatformInfo(
      platform: SharePlatform.tiktok,
      label: 'TikTok',
      assetPath: AppAssets.tiktok,
    ),
    SharePlatformInfo(
      platform: SharePlatform.whatsapp,
      label: 'WhatsApp',
      assetPath: AppAssets.whatsapp,
    ),
    SharePlatformInfo(
      platform: SharePlatform.whatsappBusiness,
      label: 'WA Business',
      assetPath: AppAssets.businesswhatsapp,
    ),
    SharePlatformInfo(
      platform: SharePlatform.telegram,
      label: 'Telegram',
      assetPath: AppAssets.telegram,
    ),
    SharePlatformInfo(
      platform: SharePlatform.friend,
      label: 'Email',
      assetPath: AppAssets.friend,
    ),
  ];
}
