import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterauth/ui/theme/app_colors.dart';

class DetailSection extends StatelessWidget {
  final String sectionHeader;
  final VoidCallback onDetailValueCopyAction;
  final VoidCallback onDetailValueTap;
  final List<Widget> detailFragments;

  const DetailSection({
    Key key,
    @required this.sectionHeader,
    @required this.onDetailValueTap,
    this.detailFragments,
    this.onDetailValueCopyAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: this.onDetailValueTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailHeader(context),
            _buildChildren(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChildren(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detailFragments != null && detailFragments.length > 0) ...[
            ...detailFragments.map((e) {
              return Column(
                children: [e, const SizedBox(height: 10)],
              );
            })
          ],
        ],
      ),
    );
  }

  Widget _buildDetailHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionHeader,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
        ),
        if (onDetailValueCopyAction != null) ...[
          GestureDetector(
            onTap: () {
              EasyLoading.showToast('Copied to clipboard!');
              this.onDetailValueCopyAction();
            },
            child: Icon(
              Icons.copy_rounded,
              color: AppColors.wso2,
              size: Theme.of(context).textTheme.bodyText1.fontSize,
            ),
          )
        ]
      ],
    );
  }
}

class DetailFragment extends StatelessWidget {
  final String title;
  final String content;

  const DetailFragment({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          this.content,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
