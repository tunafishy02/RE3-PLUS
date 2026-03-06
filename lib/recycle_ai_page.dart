import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecycleAIPage extends StatefulWidget {
  const RecycleAIPage({super.key});

  @override
  State<RecycleAIPage> createState() => _RecycleAIPageState();
}

class _RecycleAIPageState extends State<RecycleAIPage> {

  File? image;
  String result = "No item detected";

  final picker = ImagePicker();

  Future pickImage() async {

    final pickedFile =
    await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) return;

    setState(() {
      image = File(pickedFile.path);
    });

    detectRecycleItem();
  }

  void detectRecycleItem() {

    // Placeholder AI logic
    // Replace later with TensorFlow model

    setState(() {
      result = "Plastic Bottle Detected ♻️";
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Recycling Successful!"),
        content: const Text("+10 Points Awarded"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Recycle Item AI")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            image != null
                ? Image.file(image!, height: 200)
                : const Icon(Icons.camera_alt, size: 120),

            const SizedBox(height: 20),

            Text(result, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Scan Recyclable Item"),
            )
          ],
        ),
      ),
    );
  }
}