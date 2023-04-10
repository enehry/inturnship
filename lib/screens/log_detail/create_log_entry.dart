import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/models/log_entry.dart';
import 'package:inturnship/providers/log_entry_provider.dart';
import 'package:inturnship/screens/log_detail/remarks.dart';
import 'package:inturnship/screens/log_detail/time_picker.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/utils/date_helper.dart';
import 'package:inturnship/widgets/circle_icon_button.dart';
import 'package:inturnship/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class CreateLogEntry extends StatefulWidget {
  const CreateLogEntry({super.key});

  @override
  State<CreateLogEntry> createState() => _CreateLogEntryState();
}

class _CreateLogEntryState extends State<CreateLogEntry> {
  final _logEntryFormKey = GlobalKey<FormState>();
  final _textSummaryController = TextEditingController();
  String? _remarks;

  DateTime? _startTime;
  DateTime? _endTime;

  DateTime _dateCreated = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: 'create-log-entry',
                  child: CircleIconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icons.close,
                  ),
                ),
              ),
              Form(
                key: _logEntryFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _textSummaryController,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                      minLines: 1,
                      maxLines: 10,
                      // remove the decoration
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Tap to start typing...',
                        hintStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.5),
                                ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 2.0,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate != null) {
                              // do something with the selected date
                              setState(() {
                                _dateCreated = selectedDate;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Theme.of(context).primaryColorLight,
                            size: 20.0,
                          ),
                          label: Text(
                              areDatesEqual(_dateCreated, DateTime.now())
                                  ? 'Today'
                                  : dateToReadable(_dateCreated),
                              style: Theme.of(context).textTheme.bodyMedium),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Remarks(
                          onSaved: (value) => {},
                        ),
                        TimePicker(
                          label: _startTime == null
                              ? 'Time In'
                              : timeToReadable(_startTime!),
                          initialTime:
                              dateToTimeOfDay(_startTime ?? DateTime.now()),
                          onPicked: (value) {
                            setState(() {
                              _startTime =
                                  value == null ? null : timeOfDayToDate(value);
                            });
                          },
                        ),
                        TimePicker(
                          label: _endTime == null
                              ? 'Time Out'
                              : timeToReadable(_endTime!),
                          initialTime:
                              dateToTimeOfDay(_endTime ?? DateTime.now()),
                          onPicked: (value) {
                            setState(() {
                              _endTime =
                                  value == null ? null : timeOfDayToDate(value);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  textLabel: 'Save',
                  onPressed: () async {
                    if (_logEntryFormKey.currentState!.validate()) {
                      // do something with the data
                      String error = errorField();

                      if (error.isNotEmpty) {
                        // do something with the data
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorField()),
                          ),
                        );
                        return;
                      }

                      DateTime startTime = DateTime(
                        _dateCreated.year,
                        _dateCreated.month,
                        _dateCreated.day,
                        _startTime!.hour,
                        _startTime!.minute,
                      );

                      DateTime? endTime;

                      if (_endTime != null) {
                        endTime = DateTime(
                          _dateCreated.year,
                          _dateCreated.month,
                          _dateCreated.day,
                          _endTime!.hour,
                          _endTime!.minute,
                        );
                        if (endTime.isBefore(startTime)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Time Out must be after Time In'),
                            ),
                          );
                          return;
                        }
                      }

                      LogEntry logEntry = LogEntry(
                        summary: _textSummaryController.text,
                        createdAt: _dateCreated,
                        remarks: _remarks,
                        timeIn: startTime,
                        timeOut: endTime,
                      );

                      var provider = context.read<LogEntryProvider>();

                      await provider.addLogEntry(logEntry: logEntry);

                      if (context.mounted) {
                        context.pop();
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String errorField() {
    // check all the fields if they are not empty
    if (_textSummaryController.text.isEmpty) {
      return 'Summary is required';
    } else if (_startTime == null) {
      return 'Time In is required';
    }

    return "";
  }
}
