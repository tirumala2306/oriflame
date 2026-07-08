import 'package:flutter/material.dart';
import 'package:oriflame/core/theme/app_typography.dart';

class CaptionTextBuilder {
  CaptionTextBuilder._();

  static const String referralCodePrefix = 'Use my referral code:';
  static const String referralLinkPrefix = 'Use my referral link:';

  static TextSpan buildSpan(
    String text, {
    Color color = Colors.white,
  }) {
    final lines = text.split('\n');
    final spans = <InlineSpan>[];

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (line.startsWith(referralCodePrefix)) {
        spans.addAll(_referralCodeSpans(line, color));
      } else if (line.startsWith(referralLinkPrefix)) {
        spans.addAll(_referralLinkSpans(line, color));
      } else {
        spans.add(
          TextSpan(
            text: line,
            style: AppTypography.captionBody.copyWith(color: color, height: 1.2),
          ),
        );
      }

      if (i < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return TextSpan(children: spans);
  }

  static List<TextSpan> _referralCodeSpans(String line, Color color) {
    final value = line.replaceFirst(referralCodePrefix, '').trim();
    return [
      TextSpan(
        text: '$referralCodePrefix ',
        style: AppTypography.captionLabel.copyWith(color: color, height: 1.2),
      ),
      TextSpan(
        text: value,
        style: AppTypography.captionBold.copyWith(color: color, height: 1.2),
      ),
    ];
  }

  static List<TextSpan> _referralLinkSpans(String line, Color color) {
    final value = line.replaceFirst(referralLinkPrefix, '').trim();
    return [
      TextSpan(
        text: '$referralLinkPrefix ',
        style: AppTypography.captionLabel.copyWith(color: color, height: 1.2),
      ),
      TextSpan(
        text: value,
        style: AppTypography.captionLink.copyWith(color: color, height: 1.2),
      ),
    ];
  }
}
