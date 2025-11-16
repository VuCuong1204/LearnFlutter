import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_app/common/helper/is_dark_mode.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/resources/app_dimens.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget action;
  final bool hiveBack;
  final Color backgroundColor;

  const BasicAppBar({
    super.key,
    this.hiveBack = false,
    this.title = const Text(''),
    this.action = const SizedBox(),
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [
        action,
      ],
      leading: hiveBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: AppDimens.dimen_50,
                width: AppDimens.dimen_50,
                decoration: BoxDecoration(
                  color: context.isDarkMode ? AppColors.white : AppColors.dark,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
