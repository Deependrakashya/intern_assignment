import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intern_project/repo/firestore_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 280, // Adjust height as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFa90140), Color(0xFF610024)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
