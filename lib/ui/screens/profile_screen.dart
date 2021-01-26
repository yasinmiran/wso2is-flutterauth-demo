import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterauth/bloc/auth/auth_cubit.dart';
import 'package:flutterauth/ui/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.read<AuthCubit>().state.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProfilePicture(context),
          Container(
            child: Column(
              children: [
                _buildTextField(
                  context,
                  label: "Email",
                  value: user.userInfo.email,
                ),
                const SizedBox(height: 5),
                _buildTextField(
                  context,
                  label: "Display Name",
                  value: user.userInfo.preferredUsername,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, {String label, String value}) {
    return Container(
      child: Theme(
        data: Theme.of(context),
        child: RichText(
          text: TextSpan(
            text: "$label: ",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: value,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    var size = MediaQuery.of(context).size.height * 0.25;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: size,
        child: Material(
          elevation: 10,
          shape: CircleBorder(),
          child: CircleAvatar(
            backgroundColor: AppColors.grey,
            child: ClipOval(
              child: SvgPicture.network(
                context.read<AuthCubit>().state.user.userInfo.picture,
                height: size,
                fit: BoxFit.cover,
              ),
            ),
            radius: 60,
          ),
        ),
      ),
    );
  }
}
