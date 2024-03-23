import 'package:flutter/material.dart';
import 'package:htx_ws_test/feature_home/presentation/util/home_textstyles.dart';

class HomeBody extends StatefulWidget {
  final double? price;
  const HomeBody(this.price, {super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Current Price:',
            style: HomeTextStyles.itemTitleTextStyle,
          ),
          Text(
            '${widget.price ?? 0}',
            style: HomeTextStyles.itemTextStyle,
          )
        ],
      ),
    );
  }
}
