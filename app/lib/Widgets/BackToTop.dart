import 'package:app/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';

class BackToTop extends StatelessWidget {
  Widget child;
  BackToTop({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollWrapper(
      promptTheme: PromptButtonTheme(color: primaryColor),
      promptAlignment: Alignment.bottomRight,
      enabledAtOffset: 100,
      alwaysVisibleAtOffset: true,
      builder: ((context, properties) => child),
    );
  }
}
