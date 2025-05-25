import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:intern_project/model/music_services_model.dart';
import 'package:intern_project/repo/firestore_services.dart';
import 'package:intern_project/repo/locator.dart';

class HomeProvider extends ChangeNotifier {
  List<MusicServicesModel> musicServices = [];
  bool isLoading = true;
  // using dependecy of Firestore
  final FirestoreServices firestoreServices = locator<FirestoreServices>();

  Future<void> getMusicServices() async {
    isLoading = true;
    try {
      musicServices = await firestoreServices.fetchItems();
      notifyListeners();
      log("music Services $musicServices");
    } catch (e) {
      log("error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
