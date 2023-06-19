import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter/model/git_api.dart';
import '../bloc/get_following_bloc.dart';
import '../bloc/get_profile_bloc.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
        child: SafeArea(
          top: true,
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
                        padding: const EdgeInsets.only(top: 48.0,left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage:NetworkImage("${response?.avatar_url}"),
                                  radius: 35,
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
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 30,),

                Expanded(
                  child: BlocConsumer<GetFollowingBloc,GetFollowingState>(
                    listener: (context,state){
                      if(state is GetFollowingSuccess){
                        debugPrint('Data Has Been Retrieved');
                      }
                    },
                    builder: (context,state){
                      if(state is GetFollowingLoading){
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }

                      if(state is GetFollowingFail){
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
                      if(state is GetFollowingSuccess){
                        List<Followers> response = state.data;
                        debugPrint('${response.length}');
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            childAspectRatio: 1,
                          ),
                          itemCount: response.length,
                          itemBuilder: ( _, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        BlocProvider.of<GetProfileBloc>(context).add(GetProfileInfo('${response[i].login}'));
                                        Navigator.of(context).pushNamed('/clicked_user');
                                      },
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage('${response[i].avatar_url}'),
                                        radius: 40,
                                      ),
                                    ),
                                    Text('${response[i].login}',
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: CupertinoColors.black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}
