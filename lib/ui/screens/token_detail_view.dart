import 'package:flutter/material.dart';
import 'package:flutterauth/ui/theme/app_colors.dart';

class TokenDetailView extends StatelessWidget {
  final String detailViewTitle;
  final String formattedString;

  const TokenDetailView({
    Key key,
    this.formattedString,
    this.detailViewTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.detailViewTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            formattedString,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    );
  }
}
