import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LogEntryWidget extends StatelessWidget {
  const LogEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Slidable(
        key: key,
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.delete, color: Colors.red.shade400),
              ),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18.0,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  '4',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Worked on debugging a database issue in the production environment...',
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16.0,
                        ),
                        Text(
                          '8:30 AM',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 12.0,
                          child: Center(
                            child: Text('-'),
                          ),
                        ),
                        const Icon(
                          Icons.access_time,
                          size: 16.0,
                        ),
                        Text(
                          '5:30 PM',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        // date in the end
                        const Spacer(),
                        Text(
                          'April 6, 2023',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
