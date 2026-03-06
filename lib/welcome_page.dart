import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'riri_chat_page.dart';
import 'qr_scanner_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int userPoints = 0;

  void addPoints(int points) {
    setState(() {
      userPoints += points;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("♻️ Recycling Successful! +$points Points Earned!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text ("Bitsy"),
        backgroundColor: Colors.green,

        leading: IconButton(
          icon: const Icon(Icons.smart_toy),
          tooltip: "RIRI Chatbot",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RiriChatPage()),
            );
          },
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {

              if (value == "profile") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilePage(points: userPoints))
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "profile",
                child: Text("Profile"),
              ),
            ],
          )
        ],
      ),

      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage(points: userPoints)));
          } else if (details.primaryVelocity! < 0) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RiriChatPage()));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Bitsy ♻️",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text("Your Points: $userPoints",
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text("Scan Recyclable Item"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QRScannerPage()),
                  );

                  if (result != null) {
                    addPoints(10); // Example: 10 points per recycle
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}