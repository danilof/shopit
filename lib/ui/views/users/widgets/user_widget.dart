import 'package:flutter/material.dart';
import 'package:shop_it/models/models.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_card.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user, required this.onTap});

  final User user;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: AppText.body("${user.firstName} ${user.lastName}"),
          subtitle: AppText.caption(user.email),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.image),
            minRadius: 50,
            maxRadius: 50,
          ),
        ),
      ),
    );
  }
}
