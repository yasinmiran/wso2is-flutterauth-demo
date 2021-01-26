import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterauth/bloc/auth/auth_cubit.dart';
import 'package:flutterauth/data/util/common.dart';
import 'package:flutterauth/ui/screens/profile_screen.dart';
import 'package:flutterauth/ui/screens/token_detail_view.dart';
import 'package:flutterauth/ui/theme/app_colors.dart';
import 'package:flutterauth/ui/widgets/details_section.dart';
import 'package:pretty_json/pretty_json.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserWelcomeWidget(context),
          const SizedBox(height: 25),
          // _buildUsernameSection(context),
          // const SizedBox(height: 10),
          DetailSection(
            sectionHeader: "ID Token",
            onDetailValueTap: () {
              var route = MaterialPageRoute(
                builder: (_) {
                  String formatted = prettyJson(
                    parseIdToken(context.read<AuthCubit>().state.user.idToken),
                    indent: 8,
                  );
                  return TokenDetailView(
                    detailViewTitle: "ID Token",
                    formattedString: formatted,
                  );
                },
              );
              Navigator.push(context, route);
            },
            onDetailValueCopyAction: () {
              Clipboard.setData(new ClipboardData(
                text: context.read<AuthCubit>().state.user.idToken,
              ));
            },
            detailFragments: [
              DetailFragment(
                title: "Token Issued At",
                content: context.read<AuthCubit>().state.user.idTokenIssuedTime,
              ),
            ],
          ),
          const SizedBox(height: 10),
          DetailSection(
            sectionHeader: "Access Token",
            onDetailValueTap: () {
              var route = MaterialPageRoute(
                builder: (_) {
                  String formatted = prettyJson(
                    context.read<AuthCubit>().state.user.accessToken,
                    indent: 8,
                  );
                  return TokenDetailView(
                    detailViewTitle: "Access Token",
                    formattedString: formatted,
                  );
                },
              );
              Navigator.push(context, route);
            },
            onDetailValueCopyAction: () {
              Clipboard.setData(new ClipboardData(
                text: context.read<AuthCubit>().state.user.accessToken,
              ));
            },
            detailFragments: [
              DetailFragment(
                title: "Token Type",
                content: context.read<AuthCubit>().state.user.accessTokenType,
              ),
              DetailFragment(
                title: "Token Expiry Date",
                content: context.read<AuthCubit>().state.user.accessTokenExpiryTime,
              ),
            ],
          ),
          const SizedBox(height: 10),
          DetailSection(
            sectionHeader: "Refresh Token",
            onDetailValueTap: () {
              var route = MaterialPageRoute(
                builder: (_) {
                  String formatted = prettyJson(
                    context.read<AuthCubit>().state.user.refreshToken,
                    indent: 8,
                  );
                  return TokenDetailView(
                    detailViewTitle: "Refresh Token",
                    formattedString: formatted,
                  );
                },
              );
              Navigator.push(context, route);
            },
            onDetailValueCopyAction: () {
              Clipboard.setData(new ClipboardData(
                text: context.read<AuthCubit>().state.user.refreshToken,
              ));
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildUsernameSection(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //     decoration: BoxDecoration(
  //       color: AppColors.white.withOpacity(0.2),
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Icon(
  //           Icons.account_circle_sharp,
  //           size: Theme.of(context).textTheme.headline3.fontSize,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Username",
  //               style: Theme.of(context).textTheme.bodyText1,
  //             ),
  //             Text(context.read<AuthCubit>().state.user.username),
  //           ],
  //         ),
  //         FlatButton(
  //           padding: EdgeInsets.zero,
  //           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //           onPressed: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (_) {
  //                 return BlocProvider.value(
  //                   value: BlocProvider.of<AuthCubit>(context),
  //                   child: ProfileScreen(),
  //                 );
  //               }),
  //             );
  //           },
  //           child: Row(
  //             children: [
  //               Icon(Icons.person_outline_rounded),
  //               Text(
  //                 "View User Details",
  //                 style: Theme.of(context).textTheme.bodyText2.copyWith(
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildUserWelcomeWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<AuthCubit>(context),
              child: ProfileScreen(),
            );
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      TextSpan(text: "Hey, "),
                      TextSpan(
                        text: "${context.read<AuthCubit>().state.user.userInfo.preferredUsername}!",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold, color: AppColors.wso2),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "You have successfully logged in.",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Here are your login details",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Icon(
              Icons.account_circle_sharp,
              size: Theme.of(context).textTheme.headline3.fontSize,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          tooltip: "Logout",
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
        )
      ],
      centerTitle: true,
      title: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Text(
            "Flutter Authentication Sample".toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
