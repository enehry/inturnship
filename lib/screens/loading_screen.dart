import 'package:flutter/material.dart';
import 'package:inturnship/widgets/logo_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 4.0),
            SizedBox(
              width: 250,
              child: Text(
                'Your personal logbook for internship success',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 24.0),
            const SizedBox(
              height: 24.0,
              width: 24.0,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
