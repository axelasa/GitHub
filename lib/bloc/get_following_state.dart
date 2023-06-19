part of 'get_following_bloc.dart';

abstract class GetFollowingState extends Equatable {
  const GetFollowingState();
  @override
  List<Object> get props => [];
}

class GetFollowingInitial extends GetFollowingState {}

class GetFollowingLoading extends GetFollowingState{

  const GetFollowingLoading() : super();
}

class GetFollowingSuccess extends GetFollowingState{
  final List<Followers> data;

  const GetFollowingSuccess(this.data) : super();

  @override
  List<Object> get props=> [data];
}

class GetFollowingFail extends GetFollowingState{
  final dynamic error;

  const GetFollowingFail(this.error) : super();

  @override
  List<Object> get props => [error];
}
