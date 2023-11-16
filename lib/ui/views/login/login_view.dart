import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_button.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              width: 200,
            ),
            verticalSpaceSmall,
            AppText.headline(allTranslations.text("label_app_name").toString()),
            verticalSpaceLarge,
            AppButton.selectable(
                title: viewModel.selectedUser != null
                    ? allTranslations.text("label_selected_user").toString()
                    : allTranslations.text("label_select_user").toString(),
                subTitle: viewModel.selectedUser != null
                    ? "${viewModel.selectedUser!.firstName} ${viewModel.selectedUser!.lastName}"
                    : allTranslations.text("label_no_user_selected"),
                validatorText: viewModel.selectedUser != null
                    ? ""
                    : viewModel.selectedUserValidator,
                onTap: () async {
                  await viewModel.selectUser();
                }),
            verticalSpaceMedium,
            AppButton.colored(
              title: allTranslations.text("action_login").toString(),
              onTap: viewModel.login,
              busy: viewModel.isBusy,
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
