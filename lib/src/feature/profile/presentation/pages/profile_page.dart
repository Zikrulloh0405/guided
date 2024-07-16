import 'package:flutter/material.dart';

import '../../../../common/styles/text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile",
          style: const AppTextStyle().titleLarge,
        ),
      ),
    );
  }
}
