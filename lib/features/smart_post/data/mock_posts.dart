import 'package:oriflame/core/constants/app_assets.dart';
import 'package:oriflame/features/smart_post/models/post_item.dart';

class MockPosts {
  MockPosts._();

  static const List<PostItem> all = [
    PostItem(
      id: '1',
      imageAsset: AppAssets.postImage1,
      caption:
          '💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn\'t just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too. Pamper your lips with care while enjoying a long-lasting, luminous matte colour. 💋 ✨ #Oriflame #GiordaniGold #LipCareGoals\nUse my referral code: UK-AMANDA3012\nUse my referral link: www.oriflame.com/giordani/amada3012',
      musicTitle: 'Bad Habits',
      musicArtist: 'Ed Sheeran',
      productName: 'Giordani Gold Lipstick',
      productPrice: '\$14.99',
      productDiscount: '30% off',
      communityLabel: 'High-converting in Oriflame Community',
      indexLabel: '1 of 3',
    ),
    PostItem(
      id: '2',
      imageAsset: AppAssets.postImage2,
      caption:
          '✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance\nUse my referral code: UK-AMANDA3012\nUse my referral link: www.oriflame.com/giordani/amada3012',
      musicTitle: 'Unstoppable',
      musicArtist: 'Sia',
      productName: 'Eclat Femme',
      productPrice: '\$29.99',
      productDiscount: '25% off',
      communityLabel: 'Trending in Oriflame Community',
      indexLabel: '2 of 3',
    ),
    PostItem(
      id: '3',
      imageAsset: AppAssets.postImage3,
      caption:
          'Unlock the power of bold, beautiful lashes! With WonderLash Mascara, get ultimate length, volume, and definition for a stunning, eye-catching look. One swipe is all it takes! 💖 #WonderLash #LashesForDays\nUse my referral code: UK-AMANDA3012\nUse my referral link: www.oriflame.com/giordani/amada3012',
      musicTitle: 'Vogue',
      musicArtist: 'Madonna',
      productName: 'Beauty Bundle',
      productPrice: '\$39.99',
      productDiscount: '20% off',
      communityLabel: 'Popular in Oriflame Community',
      indexLabel: '3 of 3',
    ),
  ];
}
