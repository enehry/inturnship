import 'package:flutter/material.dart';
import 'package:inturnship/widgets/text_icon_button.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    required this.label,
    required this.onPicked,
    required this.initialTime,
  });

  final String label;
  final void Function(TimeOfDay? value) onPicked;
  final TimeOfDay initialTime;

  @override
  Widget build(BuildContext context) {
    return TextIconButton(
      icon: Icons.access_time,
      label: label,
      onPressed: () async {
        var res = await showDialog(
          context: context,
          builder: (context) {
            return TimePickerDialog(
              initialTime: initialTime,
              initialEntryMode: TimePickerEntryMode.input,
            );
          },
        );

        onPicked(res);
      },
    );
  }
}
