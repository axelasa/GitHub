import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter/bloc/get_followers_bloc.dart';
import 'package:github_flutter/bloc/get_profile_bloc.dart';
import 'package:github_flutter/common/user_simple_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: Column(
          //direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              top: true,
              child: BlocConsumer<GetProfileBloc,GetProfileState>(
                  listener: (context,state){
                    if(state is GetProfileSuccess){
                      var res = state.data;
                      debugPrint("Data Has Been Retrieved");
                      debugPrint(res?.login);
                    }
                  },
                builder: (context,state){
                    if(state is GetProfileLoading){
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if(state is GetProfileFail){
                      return Center(
                        child: Text(
                          state.error.toString(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.red
                          ),
                        ),
                      );
                    }
                    if(state is GetProfileSuccess){
                      var response = state.data;
                      debugPrint('HERE IS THE AVATAR${response?.avatar_url}');
                      Future.delayed(const Duration(milliseconds: 100),(){
                        BlocProvider.of<GetFollowersBloc>(context).add(GetFollowersInfo('${response?.login}'));
                      });
                    }
                    return const SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child:  Image.asset('assets/github.png')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Card(
                elevation: 2,
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(14),
                    minLines: 1,
                    maxLines: 1,
                    expands: false,
                    placeholder: 'Username',
                    controller: usernameController,
                    style: const TextStyle(
                        fontSize: 15
                    ),
                    cursorColor: CupertinoColors.black,
                  )
              ) ,
            ),
            Align(
              alignment: Alignment.center,
              child: CupertinoButton(
                  child: const Text('SignIn',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: () async{
                    // initState();
                    Future.delayed(const Duration(milliseconds: 1000),(){
                      BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo(usernameController.text));
                      Navigator.of(context).pushNamed('/landing');
                    });

                    await UserSimplePreferences.setUsername(usernameController.text);
                  }
               ),
            ),
          ],
        )
    );
  }
}



