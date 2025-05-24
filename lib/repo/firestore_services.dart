import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern_project/model/music_services_model.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<MusicServicesModel>> fetchItems() async {
    try {
      final snapshot = await _firestore.collection('services').get();
      return snapshot.docs
          .map((doc) => MusicServicesModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Firestore fetch error: $e');
    }
  }
}
