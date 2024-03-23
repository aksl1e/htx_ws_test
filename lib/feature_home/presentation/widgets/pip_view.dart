import 'package:flutter/material.dart';

import '../util/home_textstyles.dart';

class PipView extends StatefulWidget {
  final double? price;
  const PipView(this.price, {super.key});

  @override
  State<PipView> createState() => _PipViewState();
}

class _PipViewState extends State<PipView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${widget.price ?? 0}',
          style: HomeTextStyles.titleTextStyle,
        )
      ],
    );
  }
}
