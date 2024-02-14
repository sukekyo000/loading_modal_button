import 'package:flutter/material.dart';

import '../../loading_modal_button.dart';
import '../loading/loading.dart';

class DefaultButtonWithModal extends StatelessWidget with Loading {
  const DefaultButtonWithModal({
    super.key,
    required this.onPressed,
    this.afterAsync,
    this.errorAsync,
    required this.buttonChild,
    this.buttonType = ButtonType.elevated,
    this.buttonStyle,
    required this.customLoadingWidget,
  });
  final Future<void> Function() onPressed;
  final void Function()? afterAsync;
  final void Function(Exception error)? errorAsync;
  final Widget buttonChild;
  final ButtonType buttonType;
  final ButtonStyle? buttonStyle;

  final Widget? customLoadingWidget;

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          style: buttonStyle ?? Theme.of(context).elevatedButtonTheme.style,
          child: buttonChild,
          onPressed: () async {
            await showLoadingFlow(context);
          },
        );
      case ButtonType.outlined:
        return OutlinedButton(
          style: buttonStyle ?? Theme.of(context).outlinedButtonTheme.style,
          child: buttonChild,
          onPressed: () async {
            await showLoadingFlow(context);
          },
        );
      case ButtonType.text:
        return TextButton(
          style: buttonStyle ?? Theme.of(context).textButtonTheme.style,
          child: buttonChild,
          onPressed: () async {
            await showLoadingFlow(context);
          },
        );
    }
  }

  Future<void> showLoadingFlow(BuildContext context) async {
    await loadingFLow(
      context,
      function: onPressed,
      afterAsync: afterAsync,
      errorAsync: errorAsync,
      customLoadingWidget: customLoadingWidget,
    );
  }
}
