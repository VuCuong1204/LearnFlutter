import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_app/common/widgets/button/basic_app_button.dart';
import 'package:learn_app/core/configs/app_images.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:learn_app/presentation/choose_mode/pages/choose_mode.dart'
    as AssetImages;
import 'package:learn_app/resources/app_dimens.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePage();
}

class _ChooseModePage extends State<ChooseModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimen_40,
              vertical: AppDimens.dimen_50,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.chooseAuthBG,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.dimen_50, horizontal: AppDimens.dimen_40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: AppDimens.dimen_28,
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimen_28,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: AppDimens.dimen_88,
                                sigmaY: AppDimens.dimen_88,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0),
                                  shape: BoxShape.circle,
                                ),
                                height: AppDimens.dimen_74,
                                width: AppDimens.dimen_74,
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimen_20,
                        ),
                        const Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppDimens.dimen_18,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light)
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: AppDimens.dimen_88,
                                sigmaY: AppDimens.dimen_88,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimen_16,
                        ),
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppDimens.dimen_18,
                              color: AppColors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: AppDimens.dimen_50,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignupOrSignin(),
                      ),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
