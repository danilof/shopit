import 'package:flutter/material.dart';
import 'package:shop_it/ui/common/design_system/app_colors.dart';
import 'package:shop_it/ui/common/design_system/ui_helpers.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_button.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_input_field.dart';
import 'package:shop_it/ui/common/design_system/widgets/app_text.dart';

class DesignSystemView extends StatelessWidget {
  const DesignSystemView({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            verticalSpaceLarge,
            AppText.headline(
              "App Design System",
              color: kcMediumGreyColor,
            ),
            AppText.body(
              "Visible ONLY in development",
              color: kcMediumGreyColor,
            ),
            verticalSpaceMedium,
            ...textWidgets,
            ...inputFields,
            ...buttonWidgets,
            verticalSpaceLarge,
            AppText.headline(
              'Cards',
              color: Colors.orange,
            ),
            verticalSpaceMedium,
            Card(
                child: Container(
                  height: 200,
                )),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  List<Widget> get textWidgets => [
    verticalSpaceLarge,
     AppText.headline(
      'Text Styles',
      color: Colors.orange,
    ),
    verticalSpaceMedium,
     AppText.headline('Heading One'),
    verticalSpaceMedium,
     AppText.subheading('This will be a sub title1 to the headling'),
    verticalSpaceMedium,
     AppText.body('Body Text that will be used for the general body'),
    verticalSpaceMedium,
     AppText.body(
        'Body Text that will be used for the general body in the multiple rows', textOverflow: TextOverflow.visible,),
    verticalSpaceMedium,
     AppText.caption(
        'This will be the caption usually for smaller details'),
    //verticalSpaceMedium,
  ];

  List<Widget> get buttonWidgets => [
    verticalSpaceLarge,
    AppText.headline(
      'Buttons',
      color: Colors.orange,
    ),
    verticalSpaceMedium,
    AppText.body('Normal'),
    verticalSpaceSmall,
    const AppButton(
      title: 'SIGN IN',
    ),
    verticalSpaceSmall,
    AppText.body('Colored'),
    verticalSpaceSmall,
    const AppButton.colored(
      title: 'COLORED',
      color: Colors.red,
    ),
    verticalSpaceSmall,
    AppText.body('Disabled'),
    verticalSpaceSmall,
    const AppButton(
      title: 'SIGN IN',
      disabled: true,
    ),
    verticalSpaceSmall,
    AppText.body('Busy'),
    verticalSpaceSmall,
    const AppButton(
      title: 'SIGN IN',
      busy: true,
    ),
    verticalSpaceSmall,
    AppText.body('Outline'),
    verticalSpaceSmall,
    const AppButton.outline(
      title: 'Select location',
      leading: Icon(
        Icons.send,
        color: kcPrimaryColor,
      ),
    ),
    verticalSpaceMedium,
  ];

  List<Widget> get inputFields => [
    verticalSpaceLarge,
    AppText.headline(
      'Input Fields',
      color: Colors.orange,
    ),
    verticalSpaceSmall,
    AppText.body('Normal'),
    verticalSpaceSmall,
    AppInputField(
      placeholder: 'Enter Password', controller: null,
    ),
    verticalSpaceSmall,
    AppText.body('With value'),
    verticalSpaceSmall,
    AppInputField(
      initialValue: "Initial value...",
      placeholder: 'Enter Password',
      controller: null,
    ),
    verticalSpaceSmall,
    AppText.body('With multiline'),
    verticalSpaceSmall,
    AppInputField.multiline(
      initialValue: "Initial value...",
      placeholder: 'Enter Password',
      controller: null,
    ),
    verticalSpaceSmall,
    AppText.body('disabled'),
    verticalSpaceSmall,
    AppInputField.multiline(
      enabled: false,
      initialValue: "Initial value...",
      placeholder: 'Enter Password',
      controller: null,
    ),
    verticalSpaceSmall,
    AppText.body('Leading Icon'),
    verticalSpaceSmall,
    AppInputField(
      leading: const Icon(
        Icons.reset_tv,
        color: kcPrimaryColor,
      ),
      placeholder: 'Enter TV Code', controller: null,
    ),
    verticalSpaceSmall,
    AppText.body('Trailing Icon'),
    verticalSpaceSmall,
    AppInputField(
      controller: null,
        trailing: const Icon(Icons.clear_outlined),
        placeholder: 'Search for...')
  ];
}