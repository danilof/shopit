import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_button.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_viewmodel.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  const UserProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceLarge,
            CircleAvatar(
              backgroundImage: NetworkImage(viewModel.currentUser.image),
              minRadius: 60,
              maxRadius: 60,
            ),
            verticalSpaceSmall,
            AppText.headingOne(
                "${viewModel.currentUser.firstName} ${viewModel.currentUser.lastName}"),
            AppText.body(viewModel.currentUser.email),
            verticalSpaceLarge,
            SizedBox(
              width: screenWidth(context) / 2,
              child: AppButton.outline(
                color: Colors.orange,
                leading: const Icon(
                  Icons.logout,
                  color: Colors.orange,
                ),
                title: allTranslations.text("action_logout").toString(),
                onTap: viewModel.logout,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  UserProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserProfileViewModel();
}
