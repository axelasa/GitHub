part of 'get_profile_bloc.dart';

abstract class GetProfileEvent extends Equatable {
  const GetProfileEvent();
  @override
  List<Object> get props => [];
}

class GetProfileInfo extends GetProfileEvent{
  final String username;
  const GetProfileInfo(this.username) : super();

  @override
  List<Object> get props => [username];
}