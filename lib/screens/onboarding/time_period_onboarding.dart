import 'package:flutter/material.dart';
import 'package:inturnship/screens/onboarding/time_period_form.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/widgets/layouts/onboarding_layout.dart';
import 'package:inturnship/widgets/logo_widget.dart';

class TimePeriodOnboarding extends StatelessWidget {
  const TimePeriodOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            const LogoWidget(
              maxWidth: 180,
            ),
            Text(
              'Please fill the form below to continue',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const TimePeriodForm(),
          ],
        ),
      ),
    );
  }
}
