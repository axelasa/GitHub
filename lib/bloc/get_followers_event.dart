part of 'get_followers_bloc.dart';

abstract class GetFollowersEvent extends Equatable {
  const GetFollowersEvent();
  @override
  List<Object> get props => [];
}

class GetFollowersInfo extends GetFollowersEvent{
  final String user;

  const GetFollowersInfo(this.user) : super();

  @override
  List<Object> get props => [];
}
