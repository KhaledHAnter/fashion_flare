import 'package:fashion_flare/Widgets/app_text.dart';
import 'package:fashion_flare/Widgets/cutom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingAppBar extends StatelessWidget {
  const CustomFloatingAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.visible = true,
  });

  final String title;
  final IconData icon;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        visible
            ? CustomIconButton(
                onTap: () => Navigator.pop(context),
                icon: icon,
              )
            : const SizedBox(),
        const Spacer(),
        AppText(
          text: title,
          size: 26.sp,
          weight: FontWeight.w700,
        ),
        const Spacer(),
      ],
    );
  }
}
