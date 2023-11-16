import 'package:flutter/material.dart';
import 'package:shop_it/app/localization/all_translations.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class CartSummary extends StatelessWidget {
  final int numOfProducts;
  final int total;

  const CartSummary(
      {super.key, required this.numOfProducts, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 80,
      width: screenWidth(context) - 30,
      color: Colors.grey.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.body(allTranslations.text("label_products").toString()),
              AppText.body("x$numOfProducts"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headingTwo(
                  allTranslations.text("label_total").toString()),
              AppText.headingTwo("$total€"),
            ],
          ),
        ],
      ),
    );
  }
}
