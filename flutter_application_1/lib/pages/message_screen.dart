import 'package:flutter/material.dart';
import '/widgets/message_bubble.dart';
import '/widgets/text_input_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Chat with User'),
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back),
            ),
            onPressed: () => Navigator.pop(
              context,
          )
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 16),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, index) => _messages[index],
                separatorBuilder: (_, index) => const SizedBox(height: 16),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MessageTextField(),
          )
        ],
      ),
    );
  }

  static const _messages = <MessageBubble>[
    MessageBubble(
      profileImageUrl:
          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      message: 'Hello',
      date: 'August 1, 11:09 AM',
    ),
    MessageBubble(
      message: "lorem jgrfhgjf",
      date: 'August 1, 11:09 AM',
    ),
    MessageBubble(
      profileImageUrl:'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      message: 'This app would be perfect if it had video chat!',
      date: 'Apr 22, 5:47 PM',
    ), // MessageBubble
    MessageBubble(
      message: 'hi, lovely to meet you.',
      date: 'Apr 22, 3:23 PM',
    ),
  ];
}
