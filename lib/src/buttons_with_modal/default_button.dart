import 'package:flutter/material.dart';

import '../../loading_modal_button.dart';
import '../loading/loading.dart';

class DefaultButtonWithModal extends StatelessWidget with Loading {
  const DefaultButtonWithModal({
    super.key,
    required this.onPressed,
    this.afterAsync,
    required this.buttonChild,
    this.buttonType = ButtonType.elevated,
    this.buttonStyle,
    required this.customLoadingWidget,
  });
  final Future<void> Function() onPressed;
  final void Function()? afterAsync;

  final Widget buttonChild;
  final ButtonType buttonType;
  final ButtonStyle? buttonStyle;

  final Widget? customLoadingWidget;

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          style: buttonStyle,
          child: buttonChild,
          onPressed: () async {
            await showLoadingFlow(context);
          },
        );
      case ButtonType.outlined:
        return OutlinedButton(
          style: buttonStyle,
          child: buttonChild,
          onPressed: () async {
            await showLoadingFlow(context);
          },
        );
      case ButtonType.text:
        return TextButton(
          style: buttonStyle,
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
      customLoadingWidget: customLoadingWidget,
    );
  }
}
