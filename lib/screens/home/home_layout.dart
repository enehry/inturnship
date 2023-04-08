import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.7),
                      Theme.of(context).primaryColor
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 38.0,
                      backgroundColor: Colors.white,
                      child: Text(
                        'NE',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Nehry Dedoro',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              ListTile(
                horizontalTitleGap: 0.0,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -4),
                leading: const Icon(Icons.home_outlined),
                title:
                    Text('Home', style: Theme.of(context).textTheme.titleSmall),
                onTap: () {
                  // Handle item 1 press
                },
              ),
              ListTile(
                horizontalTitleGap: 0.0,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -4),
                leading: const Icon(Icons.person_outline),
                title: Text('Profile',
                    style: Theme.of(context).textTheme.titleSmall),
                onTap: () {
                  // Handle item 1 press
                },
              ),
              ListTile(
                horizontalTitleGap: 0.0,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
                leading: const Icon(Icons.settings_outlined),
                visualDensity:
                    const VisualDensity(horizontal: -2, vertical: -4),
                title: Text('Settings',
                    style: Theme.of(context).textTheme.titleSmall),
                onTap: () {
                  // Handle item 1 press
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              // Handle menu button press
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(child: child),
      floatingActionButton: FloatingActionButton(
        heroTag: 'create-log-entry',
        onPressed: () {
          // Handle add button press
          context.pushNamed('CreateLogEntry');
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
