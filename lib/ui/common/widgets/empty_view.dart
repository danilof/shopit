import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppText.headingThree(
            title,
          ),
          verticalSpaceSmall,
          AppText.body(
            description,
            textOverflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
