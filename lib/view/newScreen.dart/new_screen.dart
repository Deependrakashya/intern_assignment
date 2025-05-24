import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  String lastScreenName;
  NewScreen({super.key, required this.lastScreenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("You tapped on: $lastScreenName")),
    );
  }
}
