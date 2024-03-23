import 'package:flutter/material.dart';
import 'package:htx_ws_test/feature_home/presentation/util/home_textstyles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('HTX TON'),
      centerTitle: true,
      backgroundColor: Colors.grey[850],
      titleTextStyle: HomeTextStyles.titleTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
