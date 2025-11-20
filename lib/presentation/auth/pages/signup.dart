import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_app/common/widgets/appbar/app_bar.dart';
import 'package:learn_app/common/widgets/button/basic_app_button.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/data/models/auth/create_user_req.dart';
import 'package:learn_app/domain/usecase/auth/singup.dart';
import 'package:learn_app/resources/app_common.dart';
import 'package:learn_app/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
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
        bottomNavigationBar: _signinText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.dimen_30,
            vertical: AppDimens.dimen_50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: AppDimens.dimen_26,),
              _supportText(),
              const SizedBox(height: AppDimens.dimen_26,),
              _fullNameField(context),
              const SizedBox(height: AppDimens.dimen_20,),
              _emailField(context),
              const SizedBox(height: AppDimens.dimen_20,),
              _passwordField(context),
              const SizedBox(height: AppDimens.dimen_30,),
              BasicAppButton(onPressed: () async{
                var result = await sl<SingupUseCase>().call(
                  params: CreateUserReq(email: , fullName: fullName, password: password)

                )
              }, title: )
            ],
          ),
        ),
      ),
    );
  }
}
