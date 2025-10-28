import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/navigation/router.dart';
import 'package:root/src/core/navigation/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                (_) => router.go(AppRoute.authentication.path),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
