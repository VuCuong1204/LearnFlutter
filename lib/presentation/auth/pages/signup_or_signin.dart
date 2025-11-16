import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_app/common/helper/is_dark_mode.dart';
import 'package:learn_app/common/widgets/appbar/app_bar.dart';
import 'package:learn_app/common/widgets/button/basic_app_button.dart';
import 'package:learn_app/core/configs/app_images.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/resources/app_dimens.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BasicAppBar(),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.unionTop),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(AppVectors.unionBottom),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.chooseAuthBG),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimen_36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(
                  height: AppDimens.dimen_50,
                ),
                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.dark,
                    fontSize: AppDimens.dimen_30,
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimen_20,
                ),
                Text(
                  'Spotify is a proprietary Swedish audio streaming and media services provider',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: context.isDarkMode
                        ? AppColors.greyTitle
                        : AppColors.grey,
                    fontSize: AppDimens.dimen_20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppDimens.dimen_36,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: BasicAppButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => SignupPage(),
                          //   ),
                          // );
                        },
                        title: "Register",
                        textSize: AppDimens.dimen_20,
                        weight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: AppDimens.dimen_20,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => SigninPage(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: context.isDarkMode
                                ? AppColors.white
                                : AppColors.dark,
                            fontSize: AppDimens.dimen_22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppDimens.dimen_100,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
