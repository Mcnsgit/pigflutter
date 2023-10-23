import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String? profileImageUrl;
  final String message;
  final String date;

  const MessageBubble({
    super.key,
    this.profileImageUrl,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    bool isSentByMe = profileImageUrl == null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isSentByMe)
            CircleAvatar(
              backgroundImage: NetworkImage(profileImageUrl!),
            ),
          Material(
            color: isSentByMe ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      color: isSentByMe ? Colors.white : Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: isSentByMe ? Colors.white : Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
