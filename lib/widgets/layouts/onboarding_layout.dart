import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingLayout extends StatelessWidget {
  const OnboardingLayout(
      {super.key, required this.child, this.hasBackButton = false});

  final Widget child;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hasBackButton
                ? BackButton(
                    onPressed: () => context.pop(),
                  )
                : const SizedBox(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
