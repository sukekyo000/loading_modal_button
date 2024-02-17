import 'package:flutter/material.dart';
import 'package:loading_modal_button/src/buttons_with_modal/icon_button.dart';

import 'buttons_with_modal/custom_button.dart';
import 'buttons_with_modal/style/icon_button_style.dart';
import 'util/button_style.dart';
import 'util/indicator.dart';
import 'buttons_with_modal/default_button.dart';

class LoadingModalButton extends StatelessWidget {
  const LoadingModalButton({
    super.key,
    required this.onPressed,
    this.afterAsync,
    this.errorAsync,
    this.buttonChild = const Text('Default Value'),
    this.buttonType = ButtonType.elevated,
    this.buttonStyle,
    this.iconChild,
    this.iconButtonWithModalStyle = const IconButtonWithModalStyle(),
    this.customWidget,
    this.customLoadingWidget,
    this.loadingBackgroundColor,
    this.validation,
  });

  /// after button tapped, loading modal will show
  /// until [onPressed] async function is done
  final Future<void> Function() onPressed;

  /// after onPressed async function is done,
  /// afterAsync function will be called
  /// if error occurred, afterAsync function will not be called
  final void Function()? afterAsync;

  /// if error occurred, errorAsync function will be called
  final void Function(Exception error)? errorAsync;

  /// button child for [ElevatedButton], [OutlinedButton], [TextButton]
  final Widget buttonChild;

  /// enable usage buttons are [ElevatedButton], [OutlinedButton], [TextButton]
  /// default is [ElevatedButton]
  final ButtonType buttonType;

  /// button style for [ElevatedButton], [OutlinedButton], [TextButton]
  final ButtonStyle? buttonStyle;

  /// icon child for [IconButton].
  /// if iconChild is not null,
  /// [buttonChild], [buttonType], [buttonStye], [customWidget] will be ignored
  final Widget? iconChild;

  /// icon button style for [IconButton]
  final IconButtonWithModalStyle iconButtonWithModalStyle;

  /// you can make custom Widget for button,
  /// but only support is onTap of [GestureDetector] widget.
  ///
  /// if customWidget is not null,
  /// [buttonChild], [buttonType], [buttonStye],
  /// [iconChild], [iconButtonWithModalStyle] will be ignored
  final Widget? customWidget;

  /// you can make custom indicator for loading modal
  /// default is [DefaultIndicator]
  final Widget? customLoadingWidget;

  /// you can change loading modal background color
  final Color? loadingBackgroundColor;

  /// if validation is false, will not call [onPressed], [afterAsync], [errorAsync]
  final bool Function()? validation;

  @override
  Widget build(BuildContext context) {
    if (customWidget != null) {
      return CustomLoadingButtonWithModal(
        onPressed: onPressed,
        afterAsync: afterAsync,
        errorAsync: errorAsync,
        customWidget: customWidget!,
        customLoadingWidget: customLoadingWidget,
        loadingBackgroundColor: loadingBackgroundColor,
        validation: validation,
      );
    }

    if (iconChild != null) {
      return IconButtonWithModal(
        onPressed: onPressed,
        afterAsync: afterAsync,
        iconChild: iconChild!,
        style: iconButtonWithModalStyle,
        customLoadingWidget: customLoadingWidget,
        loadingBackgroundColor: loadingBackgroundColor,
        validation: validation,
      );
    }

    return DefaultButtonWithModal(
      onPressed: onPressed,
      afterAsync: afterAsync,
      errorAsync: errorAsync,
      buttonChild: buttonChild,
      buttonStyle: buttonStyle,
      buttonType: buttonType,
      customLoadingWidget: customLoadingWidget,
      loadingBackgroundColor: loadingBackgroundColor,
      validation: validation,
    );
  }
}
