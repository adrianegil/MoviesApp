import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Vista del Home.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'.tr),
      ),
    );
  }
}
