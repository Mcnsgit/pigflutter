import 'package:flutter/material.dart';
// import 'package:agora_uikit/agora_uikit.dart';
// import '/src/presentation/widgets/custom_app_bar.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreeState();
}

class _VideoCallScreeState extends State<VideoCallScreen> {
//   final appBarNotifier = CustomAppBarNotifier();
//   final AgoraClient client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: ' fafa0504cabc493589c9681dca2dbab9 ',
//       channelName: 'flutter text',
//       tempToken:
//           '007eJxTYAjZcYpn5rXLvoWX/HWE37gFJgYvjvsToG4zr6sg43K+7lsFhrTEtEQDUwOT5MSkZBNLY1MLy2RLMwvDlOREo5SkxCTLuI9fUxoCGRmSCheyMDJAIIjPwlCSWlzCwAAAfoUgzw==',
//     ),
//   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Video Call')),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: Stack(children: [
          Container(),
        ]))
      ])),
    );
  }
}