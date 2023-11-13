import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';
import 'package:shop_it/ui/common/design_system/widgets/loading_indicator.dart';
import 'package:shop_it/ui/common/widgets/search_widget.dart';
import 'package:shop_it/ui/views/users/widgets/user_widget.dart';
import 'package:stacked/stacked.dart';

import 'users_viewmodel.dart';

class UsersView extends StackedView<UsersViewModel> {
  UsersView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UsersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: AppText.headingTwo(
            allTranslations.text("title_select_user").toString()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: <Widget>[
              SearchWidget(
                  placeholder:
                      allTranslations.text("label_search_users").toString(),
                  onFieldSubmitted: (value) => viewModel.searchUsers(value),
                  trailingTapped: () {
                    viewModel.getUsers();
                  }),
              (!viewModel.isListEmpty && !viewModel.isBusy)
                  ? buildContentView(viewModel)
                  : (viewModel.isBusy)
                      ? Container()
                      : emptyView(),
              viewModel.isBusy
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: AppLoadingIndicator(),
                      ))
                  : viewModel.hasError
                      ? Container()
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(UsersViewModel viewModel) {
    super.onViewModelReady(viewModel);

    viewModel.getUsers();
  }

  @override
  UsersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersViewModel();

  buildContentView(UsersViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView.builder(
          key: UniqueKey(),
          shrinkWrap: true,
          itemCount: viewModel.users.length,
          itemBuilder: (context, itemIndex) {
            User item = viewModel.users[itemIndex];
            return UserWidget(
                user: item, onTap: () => viewModel.selectAndReturn(item));
          }),
    );
  }

  emptyView() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppText.headingThree(
            allTranslations.text("users_list_no_data_title").toString(),
          ),
          verticalSpaceSmall,
          AppText.body(
            allTranslations.text("users_list_no_data_desc").toString(),
          ),
        ],
      ),
    );
  }
}
