import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime timeOfDayToDate(TimeOfDay time) =>
    DateTime(0, 0, 0, time.hour, time.minute);

String dateToReadable(DateTime date) => DateFormat('MMM dd, yyyy').format(date);

String timeToReadable(DateTime time) => DateFormat('hh:mm a').format(time);

bool areDatesEqual(DateTime date1, DateTime date2) =>
    date1.year == date2.year &&
    date1.month == date2.month &&
    date1.day == date2.day;

bool isTimeBefore(TimeOfDay time1, TimeOfDay time2) =>
    time1.hour < time2.hour ||
    (time1.hour == time2.hour && time1.minute < time2.minute);

TimeOfDay dateToTimeOfDay(DateTime date) =>
    TimeOfDay(hour: date.hour, minute: date.minute);
