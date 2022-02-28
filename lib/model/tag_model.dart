class TagModel {
  const TagModel({
    required this.count,
    required this.tagType,
  });

  final int count;
  final TagType tagType;
}

enum TagType {
  ///图片
  img,

  ///视频
  video,

  ///声音
  sound,

  ///赏金
  bounty,
}
