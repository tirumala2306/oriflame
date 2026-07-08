class PostItem {
  const PostItem({
    required this.id,
    required this.imageAsset,
    required this.caption,
    required this.musicTitle,
    required this.musicArtist,
    required this.productName,
    required this.productPrice,
    required this.productDiscount,
    required this.communityLabel,
    required this.indexLabel,
  });

  final String id;
  final String imageAsset;
  final String caption;
  final String musicTitle;
  final String musicArtist;
  final String productName;
  final String productPrice;
  final String productDiscount;
  final String communityLabel;
  final String indexLabel;

  PostItem copyWith({String? caption}) {
    return PostItem(
      id: id,
      imageAsset: imageAsset,
      caption: caption ?? this.caption,
      musicTitle: musicTitle,
      musicArtist: musicArtist,
      productName: productName,
      productPrice: productPrice,
      productDiscount: productDiscount,
      communityLabel: communityLabel,
      indexLabel: indexLabel,
    );
  }
}
