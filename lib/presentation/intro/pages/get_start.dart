import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_app/common/widgets/button/basic_app_button.dart';
import 'package:learn_app/core/configs/app_images.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/presentation/choose_mode/pages/choose_mode.dart';
import 'package:learn_app/resources/app_dimens.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                image: AssetImage(AppImages.introBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.dimen_50,
              horizontal: AppDimens.dimen_40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: AppDimens.dimen_26,
                  ),
                ),
                const SizedBox(
                  height: AppDimens.dimen_26,
                ),
                const Text(
                  'The customer is very important, the customer will be followed by the customer. For the arrows are clear but phaseless. It\'s time to decorate it with some chocolate.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyTitle,
                    fontSize: AppDimens.dimen_16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppDimens.dimen_30,
                ),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChooseModePage(),
                        ),
                      );
                    },
                    title: "Get Start")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
