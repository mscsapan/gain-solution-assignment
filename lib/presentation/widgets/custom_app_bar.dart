import 'package:flutter/material.dart';

import '../utils/constraints.dart';
import '../utils/utils.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isShowBackButton = true,
    this.isCenterText,
    this.height,
    this.customWidget,
    this.textSize = 22.0,
    this.fontWeight = FontWeight.w500,
    this.textColor = blackColor,
    this.bgColor = whiteColor,
    this.actions
  });

  final String title;
  final bool isShowBackButton;
  final bool? isCenterText;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color? bgColor;
  final double? height;
  final Widget? customWidget;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return customWidget?? AppBar(
      automaticallyImplyLeading: isShowBackButton,
      backgroundColor: whiteColor,
      // backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      centerTitle: isCenterText ?? true,
      title: CustomText(
        text: title,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Utils.vSize(height ?? 60.0));
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.maybePop(context),
      child: Container(
        height: Utils.vSize(48.0),
        width: Utils.hSize(48.0),
        alignment: Alignment.center,
        margin: Utils.only(right: 30.0),
        decoration: BoxDecoration(
          borderRadius: Utils.borderRadius(),
          border: Border.all(color: grayColor.withValues(alpha:0.5)),
        ),
        child: Padding(
          padding: Utils.only(left: 8.0),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
