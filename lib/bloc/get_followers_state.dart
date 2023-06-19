part of 'get_followers_bloc.dart';

abstract class GetFollowersState extends Equatable {
  const GetFollowersState();
  @override
  List<Object> get props => [];
}

class GetFollowersInitial extends GetFollowersState {}

class GetFollowersLoading extends GetFollowersState{

  const GetFollowersLoading() : super();
}

class GetFollowersSuccess extends GetFollowersState{
  final List<Followers> data;

  const GetFollowersSuccess(this.data) : super();

  @override
  List<Object> get props=> [data];
}

class GetFollowersFail extends GetFollowersState{
  final dynamic error;

  const GetFollowersFail(this.error) : super();

  @override
  List<Object> get props => [error];
}
