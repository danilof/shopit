import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_it/app/app.logger.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartViewModel extends BaseViewModel {
  final log = getLogger("ShoppingCartViewModel");

  void checkOut() {
    Fluttertoast.showToast(
        msg: "Not implemented...", backgroundColor: kcMediumGreyColor);
  }
}
