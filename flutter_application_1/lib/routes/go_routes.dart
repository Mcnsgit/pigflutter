import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/pages/home_screen.dart';
import 'package:flutter_application_1/pages/log_in_page.dart';
import 'package:flutter_application_1/pages/chats_page.dart';
import 'package:flutter_application_1/pages/user_profile_screen.dart';
import 'package:flutter_application_1/pages/video_call_screen.dart';

// Create a list of pages to easily manage and avoid redundancy
final pages = <Page>[
  const MaterialPage(child: HomeScreen(), name: '/home'),
  const MaterialPage(child: LoginScreen(), name: '/login'),
  const MaterialPage(child: UserPage(), name: '/profile'),
  const MaterialPage(child: VideoCallScreen(), name: '/video_call'),
  const MaterialPage(child: ChatPageScreen(), name: '/chats'),
  const MaterialPage(child: UserPage(), name: '/profile'),
  
];

// Generate routes dynamically from the pages list
final routes = pages.map(
  (page) => GoRoute(
    path: page.name!,
    pageBuilder: (context, state) => page,
  ),
);

final goRouter = GoRouter(
  // Global key for Navigator
  navigatorKey: GlobalKey<NavigatorState>(),

  // Initial location when the app starts
  initialLocation: '/home',

  routes: routes.toList(),
  ); 

  // Build the MaterialApp and provide the router delegate and route information parser
  materialApp(BuildContext context, ValueNotifier<RoutingConfig?> state, GoRouter router) {
     return MaterialApp.router(
       debugShowCheckedModeBanner: false,
      routerConfig: router
    );
  }
       
    
    

  
