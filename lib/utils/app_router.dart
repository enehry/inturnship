import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/screens/home/home_screen.dart';
import 'package:inturnship/screens/loading_screen.dart';
import 'package:inturnship/screens/log_detail/create_log_entry.dart';
import 'package:inturnship/screens/onboarding/initial_onboarding.dart';
import 'package:inturnship/screens/onboarding/registration_onboarding.dart';
import 'package:inturnship/screens/onboarding/time_period_onboarding.dart';
import 'package:inturnship/screens/profile/profile_screen.dart';
import 'package:inturnship/screens/settings/settings.dart';

class AppRouter {
  static GoRouter router(String initialRoute) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initialRoute,
      errorPageBuilder: (context, state) => const MaterialPage<void>(
        key: ValueKey('ErrorPage'),
        child: Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        ),
      ),
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
        GoRoute(
          path: '/loading',
          name: 'LoadingScreen',
          pageBuilder: (context, state) => const MaterialPage<void>(
            key: ValueKey('LoadingScreen'),
            child: LoadingScreen(),
          ),
        ),
        GoRoute(
          path: '/settings',
          name: 'Settings',
          pageBuilder: (context, state) => const MaterialPage<void>(
              key: ValueKey('Settings'), child: Settings()),
        ),
        GoRoute(
          path: '/profile-screen',
          name: 'ProfileScreen',
          pageBuilder: (context, state) => const MaterialPage<void>(
              key: ValueKey('ProfileScreen'), child: ProfileScreen()),
        ),
      ],
    );
  }
}
