import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/bottom_nav_bar.dart';
import 'routes/go_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomAppBarNotifier()),
        ChangeNotifierProvider(create: (context) => BottomNavBarNotifier()),
      ],
      child: MaterialApp.router(
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser:goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(),
      ),
    );
  }
}
