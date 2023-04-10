import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final void Function() onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColorLight,
        size: 20.0,
      ),
      label: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(
            color: Theme.of(context).primaryColorLight,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
