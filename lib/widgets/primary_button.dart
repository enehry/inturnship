import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.textLabel,
    this.icon,
  });

  final void Function()? onPressed;
  final Widget? icon;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(textLabel),
          SizedBox(width: (icon == null) ? 0.0 : 16.0),
          icon ?? const SizedBox(),
        ],
      ),
    );
  }
}
