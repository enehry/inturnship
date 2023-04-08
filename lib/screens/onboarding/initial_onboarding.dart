import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/widgets/layouts/onboarding_layout.dart';
import 'package:inturnship/widgets/logo_widget.dart';
import 'package:inturnship/widgets/primary_button.dart';

class InitialOnboarding extends StatelessWidget {
  const InitialOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kVerticalPadding, horizontal: kHorizontalPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16.0),
                    const Hero(
                      tag: 'onboarding-logo',
                      child: LogoWidget(),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Your personal logbook for internship success',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  textLabel: "Let's Start",
                  onPressed: () {
                    context.push('/onboarding/registration');
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
