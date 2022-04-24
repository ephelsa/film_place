import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  double widthAspectRatio(double aspectRatio, {double modifiers = 0}) {
    final height = MediaQuery.of(this).size.height;

    return (height + modifiers) * aspectRatio;
  }

  double heightAspectRatio(double aspectRatio, {double modifiers = 0}) {
    final width = MediaQuery.of(this).size.width;
    final _aspectRatio = 1 / aspectRatio;

    return (width + modifiers) * _aspectRatio;
  }
}
