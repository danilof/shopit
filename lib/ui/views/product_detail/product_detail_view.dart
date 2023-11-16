import 'package:flutter/material.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/views/product_detail/widgets/product_gallery.dart';
import 'package:shop_it/ui/views/product_detail/widgets/product_glass_detail.dart';
import 'package:stacked/stacked.dart';

import 'product_detail_viewmodel.dart';

class ProductDetailView extends StackedView<ProductDetailViewModel> {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget builder(
    BuildContext context,
    ProductDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            ProductImageGallery(
              images: product.images,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ProductGlassDetail(
                product: product,
                onTapAddToCart: () => viewModel.addToCart(product),
              ),
            ),
          ],
        ));
  }

  @override
  ProductDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductDetailViewModel();
}
