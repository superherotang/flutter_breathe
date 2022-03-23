import 'posts_type.dart';

class TagModel {
  const TagModel({
    required this.count,
    required this.postsType,
  });

  final int count;
  final PostsType postsType;
}

