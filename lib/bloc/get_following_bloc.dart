import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_flutter/api/network_call.dart';
import 'package:injectable/injectable.dart';

import '../model/git_api.dart';

part 'get_following_event.dart';
part 'get_following_state.dart';

@Injectable()
class GetFollowingBloc extends Bloc<GetFollowingEvent, GetFollowingState> {
  GetFollowingBloc() : super(GetFollowingInitial()) {
    on<GetFollowingInfo>(_onGetFollowingEvent);
  }

  FutureOr<void> _onGetFollowingEvent(GetFollowingInfo event, Emitter<GetFollowingState> emit) async{
    try{
      emit(const GetFollowingLoading());
      final List<Followers> model = await getUserFollowing(event.user);
      debugPrint(model.toString());
      emit(GetFollowingSuccess(model));
    }catch(e){
      debugPrint(e.toString());
      emit(GetFollowingFail(e.toString()));
    }
  }
}
