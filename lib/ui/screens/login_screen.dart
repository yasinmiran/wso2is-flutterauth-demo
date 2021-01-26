import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterauth/bloc/auth/auth_cubit.dart';
import 'package:flutterauth/ui/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            _buildApplicationLogo(context),
            _buildApplicationDescriptionText(context),
            Spacer(),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationDescriptionText(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Text(
        "WSO2 Identity Server with Flutter",
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildApplicationLogo(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          "assets/svg/wso2_logo.svg",
          semanticsLabel: 'WSO2 Brand Logo',
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        child: FlatButton(
          color: AppColors.wso2,
          onPressed: context.read<AuthCubit>().login,
          padding: const EdgeInsets.all(20),
          child: Text(
            "LOGIN",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
