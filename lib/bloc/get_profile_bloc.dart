import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_flutter/api/network_call.dart';
import 'package:github_flutter/model/git_api.dart';
import 'package:injectable/injectable.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

@Injectable()
class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {

  //cache data here

  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetProfileInfo>(_onGetProfileEvent);
  }

  FutureOr<void> _onGetProfileEvent(GetProfileInfo event, Emitter<GetProfileState> emit) async{
    try{
      emit(const GetProfileLoading());
      final model = await getProfile(event.username);
      debugPrint(model?.name);
      emit(GetProfileSuccess(model));
    }catch(e){
      debugPrint(e.toString());
      emit(GetProfileFail(e.toString()));
    }
  }
}
