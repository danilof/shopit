import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/services/environment_service.dart';
import 'package:shop_it/ui/common/design_system/design_system_view.dart';
import 'package:shop_it/ui/views/products/products_view.dart';
import 'package:shop_it/ui/views/user_profile/user_profile_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({super.key});

  DateTime? currentBackPressTime;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: viewModel.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: getViewForIndex(viewModel.currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: getBottomNavigationItems(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {}

  List<BottomNavigationBarItem> getBottomNavigationItems() {
    List<BottomNavigationBarItem> menuItems = [];
    menuItems.add(BottomNavigationBarItem(
        label: allTranslations.text("label_menu_products"),
        icon: const Icon(Icons.list)));
    menuItems.add(BottomNavigationBarItem(
      label: allTranslations.text("label_menu_cart"),
      icon: const Icon(Icons.shopping_cart),
    ));
    menuItems.add(
      BottomNavigationBarItem(
        label: allTranslations.text("label_menu_profile"),
        icon: const Icon(Icons.info_outline),
      ),
    );
    if (EnvironmentService.isDevelopment) {
      menuItems.add(
        BottomNavigationBarItem(
          label: allTranslations.text("label_menu_ds"),
          icon: const Icon(Icons.description),
        ),
      );
    }
    return menuItems;
  }

  Widget getViewForIndex(int index) {
    return IndexedStack(
      index: index,
      children: const [
        ProductsView(),
        ProductsView(),
        UserProfileView(),
        DesignSystemView()
      ],
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: allTranslations.text("exit_warning")!);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
