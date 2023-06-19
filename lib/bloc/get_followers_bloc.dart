import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_flutter/api/network_call.dart';
import 'package:github_flutter/model/git_api.dart';
import 'package:injectable/injectable.dart';

part 'get_followers_event.dart';
part 'get_followers_state.dart';

@Injectable()
class GetFollowersBloc extends Bloc<GetFollowersEvent, GetFollowersState> {
  GetFollowersBloc() : super(GetFollowersInitial()) {
    on<GetFollowersInfo>(_onGetFollowersEvent);
  }

  FutureOr<void> _onGetFollowersEvent(GetFollowersInfo event, Emitter<GetFollowersState> emit) async{
    try{
      emit(const GetFollowersLoading());
      final List<Followers> model = await getUserFollowers(event.user);
      debugPrint(model.toString());
      emit(GetFollowersSuccess(model));
    }catch(e){
      debugPrint(e.toString());
      emit(GetFollowersFail(e.toString()));
    }
  }
}
