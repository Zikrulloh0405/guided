import 'package:flutter/material.dart';
import 'package:guidist/src/common/styles/text_style.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trips"),
      ),
      body: Center(
        child: Text(
          "Schedule",
          style: const AppTextStyle().titleLarge,
        ),
      ),
    );
  }
}
