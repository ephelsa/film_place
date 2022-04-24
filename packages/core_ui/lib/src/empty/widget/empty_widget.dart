import 'package:core_ui/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    this.width,
    this.height,
    this.message,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          CoreUIAssets.lottieEmptyBox,
          width: width,
          height: height,
        ),
        if (message != null) message!,
      ],
    );
  }
}
