import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'chat_history_page.dart';

class RiriChatPage extends StatefulWidget {
  const RiriChatPage({super.key});

  @override
  State<RiriChatPage> createState() => _RiriChatPageState();
}

class _RiriChatPageState extends State<RiriChatPage> {

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<Map<String, String>> messages = [];

  bool isTyping = false;

  final String apiKey = "AIzaSyB9XOjkVOeCngVYXOHa2S-1WAwwALPfkPs";

  Future<String> sendToGemini(String userMessage) async {

    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyD0K3Zlx4U7wcy_SzPbvc1sRX8zz1Pa8Ec");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                "You are RIRI, an AI recycling assistant helping users recycle better.\nUser: $userMessage"
              }
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body);

    try {
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } catch (e) {
      return "Sorry, I couldn't answer that.";
    }
  }

  void sendMessage() async {

    String text = controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": text});
      isTyping = true;
    });

    controller.clear();

    scrollToBottom();

    String reply = await sendToGemini(text);

    setState(() {
      isTyping = false;
      messages.add({"sender": "bot", "text": reply});
    });

    scrollToBottom();
  }

  void scrollToBottom() {

    Future.delayed(const Duration(milliseconds: 300), () {

      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget typingIndicator() {

    return Row(
      children: const [
        CircleAvatar(child: Icon(Icons.smart_toy)),
        SizedBox(width: 10),
        Text("RIRI is typing...")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text("RIRI - Recycling AI"),
        backgroundColor: Colors.green,

        actions: [

          IconButton(
            icon: const Icon(Icons.folder),
            tooltip: "Chat History",
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatHistoryPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: messages.length + (isTyping ? 1 : 0),

              itemBuilder: (context, index) {

                if (isTyping && index == messages.length) {
                  return typingIndicator();
                }

                final msg = messages[index];
                final isUser = msg["sender"] == "user";

                return Align(
                  alignment:
                  isUser ? Alignment.centerRight : Alignment.centerLeft,

                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),

                    constraints: const BoxConstraints(maxWidth: 260),

                    decoration: BoxDecoration(
                      color: isUser ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Text(
                      msg["text"]!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.white,

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Ask RIRI about recycling...",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}