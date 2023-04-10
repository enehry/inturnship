import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.0,
              color: Theme.of(context).primaryColorLight,
            ),
            color: Colors.transparent,
          ),
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 24.0,
            weight: 0.5,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
    );
  }
}
