import 'package:flutter/material.dart';

class DropdownSelect<T> extends StatelessWidget {
  const DropdownSelect({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.hinText,
    this.validator,
  });

  final List<T> items;
  final T? selectedValue;
  final void Function(T?) onChanged;

  final String? hinText;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('University/Campus',
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<T>(
          isExpanded: true,
          style: Theme.of(context).textTheme.bodyMedium,
          value: selectedValue,
          onChanged: onChanged,
          hint: Text(hinText ?? ''),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                softWrap: true,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          validator: validator,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
