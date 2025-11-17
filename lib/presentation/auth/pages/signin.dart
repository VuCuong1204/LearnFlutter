import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_app/common/widgets/appbar/app_bar.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/resources/app_common.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppBar(
          title: SvgPicture.asset(
            AppVectors.logo,
            height: AppDimens.dimen_40,
            width: AppDimens.dimen_40,
          ),
        ),
        bottomNavigationBar: _registerText,
      ),
    );
  }
}
