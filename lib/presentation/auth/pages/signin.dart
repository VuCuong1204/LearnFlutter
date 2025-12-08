import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_app/common/widgets/appbar/app_bar.dart';
import 'package:learn_app/common/widgets/button/basic_app_button.dart';
import 'package:learn_app/core/configs/app_vectors.dart';
import 'package:learn_app/core/theme/app_color.dart';
import 'package:learn_app/data/models/auth/create_user_req.dart';
import 'package:learn_app/data/models/auth/signin_user_req.dart';
import 'package:learn_app/domain/usecase/auth/signin.dart';
import 'package:learn_app/presentation/auth/pages/signup.dart';
import 'package:learn_app/resources/app_common.dart';
import 'package:learn_app/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
        bottomNavigationBar: _registerText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.dimen_30,
            vertical: AppDimens.dimen_50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: AppDimens.dimen_24),
              _supportText(),
              const SizedBox(height: AppDimens.dimen_24),
              _usernameOrEmailField(context),
              const SizedBox(height: AppDimens.dimen_20),
              _passwordField(context),
              const SizedBox(height: AppDimens.dimen_16),
              _recoveryPasswordText(),
              const SizedBox(height: AppDimens.dimen_16),
              BasicAppButton(
                title: 'Sign in',
                onPressed: () async {
                  var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );

                  result.fold(
                    (l) {
                      var snackBar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    (r) {
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext content) => const HomePage(),
                      //   ),
                      //   (route) => false,
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Đăng nhập thành công"),
                        ),
                      );
                    },
                  );
                },
                textSize: AppDimens.dimen_22,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: AppDimens.dimen_32,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "If You Need Any Support ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Click here",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.dimen_16,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _usernameOrEmailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: "Enter Username Or Email",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: "Password",
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _recoveryPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Recovery Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.dimen_16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.dimen_40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Not A Member ? ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.dimen_16,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text(
              "Register Now",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppDimens.dimen_16,
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
