import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/loading_indicator.dart';
import 'package:shop_it/ui/common/widgets/empty_view.dart';
import 'package:shop_it/ui/common/widgets/search_widget.dart';
import 'package:shop_it/ui/views/products/widgets/product_item.dart';
import 'package:stacked/stacked.dart';

import 'products_viewmodel.dart';

class ProductsView extends StackedView<ProductsViewModel> {
  const ProductsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductsViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SearchWidget(
                      placeholder: allTranslations
                          .text("label_search_products")
                          .toString(),
                      onFieldSubmitted: (value) =>
                          viewModel.searchProducts(value),
                      trailingTapped: () {
                        viewModel.getProducts();
                      }),
                ),
                horizontalSpaceMedium,
                GestureDetector(
                    onTap: viewModel.toggleView,
                    child: viewModel.isListModeActive
                        ? const Icon(Icons.grid_view_rounded)
                        : const Icon(Icons.list))
              ],
            ),
            (!viewModel.isListEmpty && !viewModel.isBusy)
                ? buildContentView(viewModel)
                : (viewModel.isBusy)
                    ? Container()
                    : EmptyView(
                        title: allTranslations
                            .text("products_list_no_data_title")
                            .toString(),
                        description: allTranslations
                            .text("products_list_no_data_desc")
                            .toString()),
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
    );
  }

  buildContentView(ProductsViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: GridView.builder(
        key: UniqueKey(),
        shrinkWrap: true,
        itemCount: viewModel.products.length,
        itemBuilder: (context, itemIndex) {
          Product item = viewModel.products[itemIndex];
          return ProductItem(
            product: item,
            onTap: () => viewModel.goToSelectedProduct(item),
            onAddToCart: () => viewModel.addToCart(item),
            isList: viewModel.isListModeActive,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: viewModel.isListModeActive ? 1 : 2,
          childAspectRatio: viewModel.isListModeActive ? 1.4 : 0.7,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ProductsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getProducts();
  }

  @override
  ProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductsViewModel();
}
