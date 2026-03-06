import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final int points;

  const ProfilePage({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 20),
            Text("Total Points: $points",
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text("Level: ${points ~/ 50 + 1}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}