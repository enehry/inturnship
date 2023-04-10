import 'package:flutter/material.dart';
import 'package:inturnship/widgets/layouts/default_layout.dart';
import 'package:inturnship/widgets/theme_switch.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Application Settings',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            const Icon(Icons.light_mode_outlined),
            const SizedBox(width: 16.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theme',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Let you choose a theme between dark and light mode',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            const ThemeSwitch(),
          ],
        ),
      ],
    ));
  }
}
