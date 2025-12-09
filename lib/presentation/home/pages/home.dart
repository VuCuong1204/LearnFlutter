import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_app/common/helper/is_dark_mode.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/resources/app_dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _app,
    );
  }

  AppBar _appBarArtist(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AppVectors.logo,
        height: AppDimens.dimen_40,
        width: AppDimens.dimen_40,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ProfilePage(),
              ),
            );
          },
          icon: const Icon(Icons.percent),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: Container(
          height: AppDimens.dimen_50,
          width: AppDimens.dimen_50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.white.withOpacity(0.03)
                : AppColors.dark.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.search_rounded,
            size: AppDimens.dimen_30,
            color: context.isDarkMode ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
    );
  }
}
