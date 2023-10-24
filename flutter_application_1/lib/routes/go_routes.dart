import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/log_in_page.dart';
import 'package:flutter_application_1/pages/message_screen.dart';
import 'package:flutter_application_1/pages/user_profile_screen.dart';

import '../pages/video_call_screen.dart';

final goRouter = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: 'home',

  routes: <RouteBase>[
    GoRoute(
      path: 'login',
      builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      path: 'register',
      builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      path: 'home',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: 'message',
      builder: (BuildContext context, GoRouterState state) => const ChatScreen(),
    ),
    GoRoute(
      path: 'video_call',
      builder: (BuildContext context, GoRouterState state) => const VideoCallScreen(),
    ),
    GoRoute(
      path: 'profile',
      builder: (BuildContext context, GoRouterState state) => const UserPage(),
    ),
  ],
);
