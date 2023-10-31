import 'package:flutter_application_1/routes/go_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/log_in_page.dart';
import 'package:provider/provider.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/video_call_screen.dart';


String appId = dotenv.get('APP_ID');
String tempToken = dotenv.get('TEMP_TOKEN');
String userName = "USER_NAME";
String certificate = dotenv.get('CERTIFICATE');


void main() {
  runApp(
    MultiProvider(
      providers: const [],
      child: const AppInitializer(),
    ),
  );
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({Key? key}) : super(key: key);

  @override
State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoggedInStatus();
  }

  _checkLoggedInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('loggedIn') ?? false;

    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

@override
  Widget build(BuildContext context) {
    if (_isLoggedIn == null) {
      return const MaterialApp(home: CircularProgressIndicator());
    } else if (_isLoggedIn!) {
      return MaterialApp.router(
        routerDelegate: goRouter.routerDelegate,  // <-- Use the GoRouter's routerDelegate here
        routeInformationParser: goRouter.routeInformationParser,  // <-- and routeInformationParser here
      );
    } else {
       return Navigator(
        pages: const[
         MaterialPage(child: LoginScreen())
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          _updateLoginStatus(); // We'll call the update login status when the LoginScreen is popped.
          return true;
        },
      );
    }
  }

  _updateLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', true);

    setState(() {
      _isLoggedIn = true;
    });
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  title() {
 String userName = "USER_NAME";
    return SafeArea(
      child: Text(
        'Video Calling [user_id: $userName]',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
    
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: 'test',
      tempToken: '007eJxTYPgdmV104/brpnxFJ7nnKwRDz4kvXGV/aeO677e3/fS6G/VIgSEtMS3RwNTAJDkxKdnE0tjUwjLZ0szCMCU50SglKTHJ0lnfIbUhkJHhwNa7TIwMEAjiszCUpBaXMDAAAFrQI08=',
      uid: 0,
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Calling [user_id: $uid]'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: true,
             ),
            ],
          ),
        ),
      ),
    );
  }

}