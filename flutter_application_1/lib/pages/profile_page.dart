import 'package:flutter/material.dart';
import '/widgets/user_service.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(user.imageUrl),
            Text(user.name),
            Text('${user.distance} km away'),
            Text('${user.age} years old'),
          ],
        ),
      ),
    );
  }
}
