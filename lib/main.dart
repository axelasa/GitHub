import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter/bloc/get_profile_bloc.dart';
import 'package:github_flutter/common/simple_bloc_observer.dart';
import 'package:github_flutter/common/user_simple_preferences.dart';
import 'package:github_flutter/di/injection.dart';
import 'package:github_flutter/home.dart';
import 'package:github_flutter/pages/account.dart';
import 'package:github_flutter/pages/clicked_user.dart';
import 'package:github_flutter/pages/following.dart';
import 'package:github_flutter/pages/landing.dart';
import 'package:github_flutter/pages/signIn.dart';

import 'bloc/get_followers_bloc.dart';
import 'bloc/get_following_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await UserSimplePreferences.init();
  runApp( MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final storage = UserSimplePreferences.getUsername();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => getIt.get<GetProfileBloc>()
          ),
          BlocProvider(
              create: (context) => getIt.get<GetFollowersBloc>()
          ),
          BlocProvider(
              create: (context) => getIt.get<GetFollowingBloc>()
          ),
        ],
        child: MaterialApp(
          home: storage != null ? const HomeScreen(): const SignIn(),
          routes: {
            '/account':(context) => const Account(),
            '/home':(context) => const HomeScreen(),
            '/signIn':(context) => const SignIn(),
            '/landing':(context) => const Landing(),
            '/clicked_user':(context) => const ClickedUser(),
            '/following':(context) => const Following(),
          },
        ),
    );

  }
}

