import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inturnship/models/log_entry.dart';
import 'package:inturnship/utils/date_helper.dart';

class LogEntryWidget extends StatelessWidget {
  const LogEntryWidget(
      {super.key,
      required this.logEntry,
      required this.index,
      required this.deleteLogEntry});

  final LogEntry logEntry;
  final int index;
  final Function(int?) deleteLogEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Slidable(
        key: ValueKey(logEntry.id),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                onPressed: () async {
                  bool accept = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Delete Log Entry',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      content: Text(
                        'Are you sure you want to delete this log entry?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );

                  if (accept) {
                    // delete log entry
                    deleteLogEntry(logEntry.key);
                  }
                },
                icon: Icon(Icons.delete, color: Colors.red.shade400),
              ),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
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
                  '$index',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      logEntry.summary,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16.0,
                        ),
                        Text(
                          timeToReadable(logEntry.timeIn),
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
                          logEntry.timeOut == null
                              ? ''
                              : timeToReadable(logEntry.timeOut!),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        // date in the end
                        const Spacer(),
                        Text(
                          dateToReadable(logEntry.timeIn),
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
