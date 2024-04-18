import 'package:future_me/components/bored_activities/just_me_activity.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:future_me/views/create_future.dart';
import 'package:go_router/go_router.dart';

import '../views/SplashScreen.dart';
import '../views/bored_page.dart';
import '../views/homepage.dart';
import '../views/login_view.dart';
import '../views/register.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) => CreateFuture(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/bored ',
      builder: (context, state) => BoredPage(),
    ),
    GoRoute(
      path: '/bored/just_me/:participants',
      builder: (context, state) => JustMeActivity(
        participants: int.parse(state.pathParameters['participants']!),
      ),
    ),
    GoRoute(
      path: '/bored/with_friends',
      builder: (context, state) => FriendActivity(),
    ),
  ],
);
