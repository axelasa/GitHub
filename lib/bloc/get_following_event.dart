part of 'get_following_bloc.dart';

abstract class GetFollowingEvent extends Equatable {
  const GetFollowingEvent();
  @override
  List<Object> get props => [];
}

class GetFollowingInfo extends GetFollowingEvent{
  final String user;

  const GetFollowingInfo(this.user) : super();

  @override
  List<Object> get props => [];
}
