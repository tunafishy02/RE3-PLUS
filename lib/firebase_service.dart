import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {

  final user = FirebaseAuth.instance.currentUser;

  final firestore = FirebaseFirestore.instance;

  Future addPoints(int points) async {

    final uid = user!.uid;

    final doc = firestore.collection("users").doc(uid);

    final snapshot = await doc.get();

    if (!snapshot.exists) {

      await doc.set({
        "points": points
      });

    } else {

      int currentPoints = snapshot["points"];

      await doc.update({
        "points": currentPoints + points
      });
    }
  }
}