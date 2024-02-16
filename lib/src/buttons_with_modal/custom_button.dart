import 'package:flutter/material.dart';

import '../loading/loading.dart';

class CustomLoadingButtonWithModal extends StatelessWidget with Loading {
  const CustomLoadingButtonWithModal({
    super.key,
    required this.onPressed,
    this.afterAsync,
    this.errorAsync,
    this.customWidget,
    required this.customLoadingWidget,
    this.loadingBackgroundColor,
    this.validation,
  });
  final Future<void> Function() onPressed;

  final void Function()? afterAsync;

  final void Function(Exception error)? errorAsync;

  final Widget? customWidget;

  final Widget? customLoadingWidget;

  final Color? loadingBackgroundColor;

  final bool? validation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: customWidget,
      onTap: () async {
        loadingFLow(
          context,
          function: onPressed,
          afterAsync: afterAsync,
          errorAsync: errorAsync,
          customLoadingWidget: customLoadingWidget,
          loadingBackgroundColor: loadingBackgroundColor,
          validation: validation,
        );

        if (afterAsync != null) afterAsync!();
      },
    );
  }
}
