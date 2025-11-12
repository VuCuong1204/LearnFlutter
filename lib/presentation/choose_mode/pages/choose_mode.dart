import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_app/core/configs/app_images.dart';
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
                    )
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
