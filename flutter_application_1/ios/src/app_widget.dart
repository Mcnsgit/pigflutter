import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/go_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'Application Name',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}

