import 'package:flutter/material.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat History")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Plastic Recycling"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("E-Waste"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Sustainability Tips"),
          ),
        ],
      ),
    );
  }
}