// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/custom_app_bar.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';

 String channelName = "<--Insert channel name here-->";
    String token = "<--Insert authentication token here-->";
    
    int uid = 0; // uid of the local user

    int? _remoteUid; // uid of the remote user
    bool _isJoined = false; // Indicates if the local user has joined the channel
    late RtcEngine agoraEngine; // Agora engine instance

    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey
    = GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold

    showMessage(String message) {
        scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(message),
        ));
    }
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            scaffoldMessengerKey: scaffoldMessengerKey,
            home: Scaffold(
                appBar: AppBar(
                    title: const Text('Get started with Video Calling'),
                ),
                body: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    children: [
                        // Container for the local video
                        Container(
                            height: 240,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(child: _localPreview())),
                        const SizedBox(height: 10),
                        //Container for the Remote video
                        Container(
                            height: 240,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(child: _remoteVideo())),
                        // Button Row
                        Row(
                            children: <Widget>[
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: _isJoined ? null : () => {join(
                                            channelName,
                                            token,
                                        )},
                                        child: const Text("Join"),
                                    ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: _isJoined ? () => {leave(
                                            channelName,
                                            token,
                                        )} : null,
                                        child: const Text("Leave"),
                                    ),
                                ),
                            ],
                        ),
                        const SizedBox(height: 10),
                        // Button Row ends

                    ],
                ),
            ),
        );
    }
  
 

// Display local video preview  
  Widget _localPreview() {
    if (_isJoined) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: agoraEngine,
          canvas: const VideoCanvas(uid: 0),
        ),
      );
    } else {
      return const Text(
        'Join a channel',
        textAlign: TextAlign.center,
      );
    }
  }

// Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: agoraEngine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: channelName),
        ),
      );
    } else {
      String msg = '';
      if (_isJoined) msg = 'Waiting for a remote user to join';
      return Text(
        msg,
        textAlign: TextAlign.center,
      );
    }
  }

  join(
    String channelName,
    String token
  ) {
    agoraEngine.joinChannel(
      token: token,
      channelId: channelName,
      uid: uid,
      options: const ChannelMediaOptions(
        autoSubscribeAudio: true,
        autoSubscribeVideo: true,
      ),
    );
  }
 
  leave(
    String channelName,
    String token
  ) {
    agoraEngine.leaveChannel();
    _remoteUid = null;
    _isJoined = false;
  } 


// Build UI
