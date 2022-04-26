import 'package:core_ui/src/pill/pill.dart';
import 'package:flutter/material.dart';

class VotesWidget extends StatelessWidget {
  const VotesWidget(
    this.votes, {
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  final double votes;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return PillWidget(
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: size,
            color: color,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(votes.toString())
        ],
      ),
    );
  }
}
