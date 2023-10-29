import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_application_1/routes/go_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/log_in_page.dart';
import 'package:provider/provider.dart';


const String appId = "fafa0504cabc493589c9681dca2dbab9";

void main() {
  runApp(
    MultiProvider(providers: [], child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        // useMaterial3: true,  // Consider commenting out if causing issues
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // useMaterial3: true,  // Consider commenting out if causing issues
      ),
    );
  }
}

final AgoraClient client = AgoraClient(
  agoraConnectionData: AgoraConnectionData(
    appId: "fafa0504cabc493589c9681dca2dbab9",
    channelName: "test",
    tempToken:
        "YOUR_COMPLETE_TOKEN_HERE",  // Replace with your complete token
  ),
  enabledPermission: [
    Permission.camera,
    Permission.microphone,
  ],
);
