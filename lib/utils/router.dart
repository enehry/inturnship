import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/screens/home/home_screen.dart';
import 'package:inturnship/screens/log_detail/create_log_entry.dart';
import 'package:inturnship/screens/onboarding/initial_onboarding.dart';
import 'package:inturnship/screens/onboarding/registration_onboarding.dart';
import 'package:inturnship/screens/onboarding/time_period_onboarding.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: ValueKey('InitialOnboarding'),
        child: InitialOnboarding(),
      ),
    ),
    GoRoute(
      path: '/home-screen',
      name: 'HomeScreen',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: ValueKey('HomeScreen'),
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/onboarding/registration',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: ValueKey('RegistrationOnboarding'),
        child: RegistrationOnboarding(),
      ),
    ),
    GoRoute(
      path: '/onboarding/time-period',
      pageBuilder: (context, state) {
        return const MaterialPage<void>(
          key: ValueKey('TimePeriodOnboarding'),
          child: TimePeriodOnboarding(),
        );
      },
    ),
    GoRoute(
      path: '/create-log-entry',
      name: 'CreateLogEntry',
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: ValueKey('CreateLogEntry'),
        child: CreateLogEntry(),
      ),
    ),
  ],
);
