import 'dart:ui' as ui show ImageFilter;

import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_button.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart' '';

class ProductGlassDetail extends StatelessWidget {
  const ProductGlassDetail(
      {super.key, required this.product, required this.onTapAddToCart});

  final Product product;
  final void Function() onTapAddToCart;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20)),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: screenHeight(context) / 2.2,
          width: 250,
          padding: const EdgeInsets.all(8),
          color: Colors.white.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headingThree(
                product.title,
                textOverflow: TextOverflow.visible,
                color: Colors.black,
              ),
              AppText.body(
                product.description,
                textOverflow: TextOverflow.visible,
                color: Colors.black,
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText.headingOne(
                    "${(product.price - product.price * (product.discountPercentage / 100)).ceil().toString()}€",
                    textOverflow: TextOverflow.visible,
                    color: Colors.black,
                  ),
                  horizontalSpaceTiny,
                  const Spacer(),
                  SizedBox(
                    width: 120,
                    height: 35,
                    child: AppButton.colored(
                      onTap: onTapAddToCart,
                      title: "Add to cart",
                      color: kcPrimaryColorGreen,
                    ),
                  ),
                ],
              ),
              AppText.body(
                allTranslations.text("label_in_stock").toString(),
                color: kcPrimaryColorGreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
