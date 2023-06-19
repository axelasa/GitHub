part of 'get_profile_bloc.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

class GetProfileInitial extends GetProfileState {}

class GetProfileLoading extends GetProfileState{

  const GetProfileLoading() : super();
}

class GetProfileSuccess extends GetProfileState{
  final GitApi? data;

  const GetProfileSuccess(this.data):super();

  @override
  List<Object> get props => [];
}

class GetProfileFail extends GetProfileState{
  final dynamic error;

  const GetProfileFail(this.error):super();

  @override
  List<Object> get props => [error];
}