import 'package:core_ui/src/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Lottie.asset(
            CoreUIAssets.lottieOops,
            width: width,
            height: height,
            repeat: false,
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
