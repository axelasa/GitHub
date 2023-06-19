import 'package:get_it/get_it.dart';
import 'package:github_flutter/bloc/get_profile_bloc.dart';

import '../bloc/get_followers_bloc.dart';
import '../bloc/get_following_bloc.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<GetProfileBloc>(() => GetProfileBloc());
  getIt.registerLazySingleton<GetFollowersBloc>(() => GetFollowersBloc());
  getIt.registerLazySingleton<GetFollowingBloc>(() => GetFollowingBloc());
}