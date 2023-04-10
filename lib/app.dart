import 'package:flutter/material.dart';
import 'package:inturnship/providers/profile_provider.dart';
import 'package:inturnship/providers/theme_provider.dart';
import 'package:inturnship/utils/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.read<ProfileProvider>().initProfile();

    return Consumer<ThemeProvider>(
      builder: (_, themeProvider, __) => FutureBuilder(
          future: profileProvider,
          builder: (context, snapshot) {
            String initialRoute = '/loading';

            if (snapshot.connectionState == ConnectionState.waiting) {
              initialRoute = '/loading';
            } else if (snapshot.hasError) {
              initialRoute = '/error';
            } else if (snapshot.connectionState == ConnectionState.done) {
              initialRoute = snapshot.data == false ? '/' : '/home-screen';
            } else {
              initialRoute = '/error';
            }

            return Builder(builder: (context) {
              return MaterialApp.router(
                title: 'Inturnship',
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router(initialRoute),
                theme: themeProvider.currentTheme,
              );
            });
          }),
    );
  }
}
