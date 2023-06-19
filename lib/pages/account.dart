import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/get_profile_bloc.dart';
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // String name = "";
  // @override
  // void initState() {
  //   super.initState();
  //   name = UserSimplePreferences.getUsername() ?? '';
  // }
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                radius: 65,
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
                                  fontSize: 15,
                                  color: CupertinoColors.black
                              ),
                              maxLines: 5,
                            ),
                          ),
                          const SizedBox(height:10),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Twitter:${response?.twitter_username ?? ""}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: CupertinoColors.black
                                  ),
                                ),
                                const SizedBox(width:10),
                                AutoSizeText('Blog: ${response?.blog ?? ""}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: CupertinoColors.black
                                  ),
                                  maxLines: 5,
                                )
                              ],
                            ),
                          ),
                          const Divider(height: 40,),
                          const SizedBox(height:10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('name: ${response?.name}',
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
                              const SizedBox(height: 10,),
                              AutoSizeText('public repos: ${response?.public_repos}',
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
                              const SizedBox(height: 10,),
                              Text('public gist: ${response?.public_gists}',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 40,
                                    color: CupertinoColors.black
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text('followers: ${response?.followers}',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 40,
                                    color: CupertinoColors.black
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text('following: ${response?.following}',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 40,
                                    color: CupertinoColors.black
                                ),
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
