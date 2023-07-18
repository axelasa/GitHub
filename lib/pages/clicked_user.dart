import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter/common/user_simple_preferences.dart';

import '../bloc/get_followers_bloc.dart';
import '../bloc/get_profile_bloc.dart';

class ClickedUser extends StatefulWidget {
  const ClickedUser({super.key});

  @override
  State<ClickedUser> createState() => _ClickedUserState();
}

class _ClickedUserState extends State<ClickedUser> {
  String name = "";
  @override
  void initState() {
    super.initState();
    name = UserSimplePreferences.getUsername() ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom:15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: CupertinoButton(
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 10),(){
                        BlocProvider.of<GetFollowersBloc>(context).add(GetFollowersInfo(name));
                        BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo(name));
                      });
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.arrow_left,
                    ),
                  ),
                ),
              ),
              BlocConsumer<GetProfileBloc,GetProfileState>(
                listener: (context,state){
                  if(state is GetProfileSuccess){
                    debugPrint("Data Has Been Retrieved");
                  }
                },
                builder: (context,state){
                  if(state is GetProfileLoading){
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if(state is GetProfileFail){
                    return Center(
                      child: Text(
                        state.error.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.red
                        ),
                      ),
                    );
                  }
                  if(state is GetProfileSuccess){
                    var response = state.data;
                    debugPrint(response?.login);
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:NetworkImage("${response?.avatar_url}"),
                                radius: 55,
                              ),
                              const SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0,left: 8.0),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child:Text(
                                      "${response?.name}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: CupertinoColors.black
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Location: ${response?.location ?? 'unknown'}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: CupertinoColors.black
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: AutoSizeText('Bio: ${response?.bio ?? ''}',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: CupertinoColors.black
                              ),
                              maxLines: 5,
                            ),
                          ),
                          const Divider(height: 40,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Visibility(
                                visible: false,
                                child: Text('name: ${response?.name}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 40,
                                      color: CupertinoColors.black
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              CupertinoListTile(
                                  title: AutoSizeText('public repos: ${response?.public_repos}',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 40,
                                    color: CupertinoColors.black
                                ),
                                maxLines: 5,
                              ),
                                  leading: const Icon(
                                    Icons.public_outlined,
                                  )
                              ),
                              const SizedBox(height: 10,),
                              CupertinoListTile(
                                title: Text('public gist: ${response?.public_gists}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 40,
                                      color: CupertinoColors.black
                                  ),
                                ),
                                leading: Icon(CupertinoIcons.chart_bar_circle),
                              ),
                              const SizedBox(height: 10,),
                              CupertinoListTile(
                                title: Text('followers: ${response?.followers}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 40,
                                      color: CupertinoColors.black
                                  ),
                                ),
                                leading: Icon(Icons.follow_the_signs_outlined),
                              ),
                              const SizedBox(height: 10,),
                              CupertinoListTile(
                                title: Text('following: ${response?.following}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 40,
                                      color: CupertinoColors.black
                                  ),
                                ),
                                leading: Icon(Icons.accessibility_new_outlined),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        )
    );
  }
}
