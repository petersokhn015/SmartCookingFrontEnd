import 'package:app/Utils/AppColors.dart';
import 'package:app/Utils/Strings.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColorTheme,
      child: Center(child: Image(image: AssetImage(appLogo))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
