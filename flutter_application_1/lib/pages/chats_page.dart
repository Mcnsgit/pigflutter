import 'package:flutter/material.dart';
class ChatPageScreen extends StatefulWidget {
  const ChatPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {

  bool _isChatInfoDrawerOpen = false;

  void toggleChatInfoDrawer() {
    setState(() {
      _isChatInfoDrawerOpen = !_isChatInfoDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Chat'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {Navigator.of(context).pushNamed('/home');},
          ),
        ],
      ),
      body: Column(
        children: [
          // Placeholder for the chat messages
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Chat Messages Placeholder'),
              ),
            ),
          ),
          // Typing box and send button
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement sending the message here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Implement sending images or emojis here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: _isChatInfoDrawerOpen
          ? Drawer(
              child: Container(
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Chat Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    // Add chat info and settings content here...
                  ],
                ),
              ),
            )
          : null,
    );
  }
}