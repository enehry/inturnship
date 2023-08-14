import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/utils/constant.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).primaryColorLight,
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: SafeArea(child: child),
    );
  }
}
