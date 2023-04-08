import 'package:flutter/material.dart';
import 'package:inturnship/screens/onboarding/registration_form.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/widgets/layouts/onboarding_layout.dart';
import 'package:inturnship/widgets/logo_widget.dart';

class RegistrationOnboarding extends StatelessWidget {
  const RegistrationOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPadding, horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            const Hero(
              tag: 'onboarding-logo',
              child: LogoWidget(
                maxWidth: 180,
              ),
            ),
            Text(
              'Please fill the form below to continue',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const RegistrationForm()
          ],
        ),
      ),
    ));
  }
}
