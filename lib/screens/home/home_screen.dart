import 'package:flutter/material.dart';
import 'package:inturnship/models/log_entry.dart';
import 'package:inturnship/providers/log_entry_provider.dart';
import 'package:inturnship/providers/profile_provider.dart';
import 'package:inturnship/screens/home/log_entry_widget.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/screens/home/home_layout.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        child: StreamBuilder(
      stream: context.read<LogEntryProvider>().getLogEntriesStream(),
      builder: (BuildContext context, AsyncSnapshot<List<LogEntry>> snapshot) {
        if (snapshot.hasData) {
          // sort the log entries by date
          if (snapshot.data!.isNotEmpty) {
            snapshot.data!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          }

          // calculate the total hours
          final profileProvider = context.read<ProfileProvider>();
          final totalHours = profileProvider.totalHours;
          final hoursPerDay = profileProvider.hoursPerDay;

          // calculate the total hours
          final totalHoursWorked =
              snapshot.data!.fold(0, (previousValue, element) {
            if (element.timeOut != null) {
              return previousValue +
                  element.timeOut!.difference(element.timeIn).inHours;
            }
            return previousValue;
          });

          return ListView.custom(
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
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.length.toString(),
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
                                value: snapshot.data!.length /
                                    (totalHours / hoursPerDay).ceil(),
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$totalHoursWorked',
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
                                value: totalHoursWorked / totalHours,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                Text('Recent Logs',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 16.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return LogEntryWidget(
                      logEntry: snapshot.data![index],
                      index: snapshot.data!.length - index,
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
