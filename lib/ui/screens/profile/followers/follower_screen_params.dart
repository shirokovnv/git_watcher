import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';

class FollowerScreenParams {
  final User user;
  final FollowerType followerType;

  FollowerScreenParams({required this.user, required this.followerType});
}
