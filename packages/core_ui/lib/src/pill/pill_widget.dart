import 'package:flutter/material.dart';

class PillWidget extends StatelessWidget {
  const PillWidget({
    Key? key,
    this.color,
    this.alignment = Alignment.center,
    this.child,
  }) : super(key: key);

  final Color? color;
  final Alignment alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Theme.of(context).colorScheme.primary;

    return Align(
      alignment: alignment,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: _color,
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
