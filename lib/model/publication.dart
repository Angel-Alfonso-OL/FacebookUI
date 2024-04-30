
class Publication {
  final String title;
  final DateTime time;
  final String imageUrl;
  final int commenstCount;
  final int shareCount;
  final User user;
  final Reaction currenUserReaction;

  Publication({
    required this.currenUserReaction,
    required this.user,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.commenstCount,
    required this.shareCount,
  });
}

class User {
  final String avatar;
  final String username;

  User({
    required this.avatar,
    required this.username,
  });
}

enum Reaction {
  like,
  love,
  lauhing,
  sad,
  shocking,
  angry,
}
