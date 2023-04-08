import 'package:flutter/material.dart';
import 'package:inturnship/screens/home/log_entry_widget.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/screens/home/home_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: ListView.custom(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        childrenDelegate: SliverChildListDelegate.fixed(
          [
            Text(
              'Good morning, Nehry!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            // Row with two equal containers with rounded corners
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '32',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Total Logs',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        // progress bar
                        const SizedBox(height: 8.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: LinearProgressIndicator(
                            minHeight: 10.0,
                            value: 0.5,
                            backgroundColor: const Color(0xFFF2F2F2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '256',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          'Hours Spent',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        // progress bar
                        const SizedBox(height: 8.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: LinearProgressIndicator(
                            minHeight: 10.0,
                            value: 0.5,
                            backgroundColor: const Color(0xFFF2F2F2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text('Recent Logs', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 16.0),
            // Recent logs Containers
            const LogEntryWidget(),
            const LogEntryWidget(),
            const LogEntryWidget(),
            const LogEntryWidget(),
            const LogEntryWidget(),
            const LogEntryWidget(),
            const LogEntryWidget(),
          ],
        ),
      ),
    );
  }
}
