import 'package:flutter/material.dart';

import '../loading/loading.dart';
import 'style/icon_button_style.dart';

class IconButtonWithModal extends StatelessWidget with Loading {
  const IconButtonWithModal({
    super.key,
    required this.onPressed,
    this.afterAsync,
    required this.iconChild,
    this.style = const IconButtonWithModalStyle(),
    required this.customLoadingWidget,
  });
  final Future<void> Function() onPressed;
  final void Function()? afterAsync;
  final Widget iconChild;
  final IconButtonWithModalStyle style;
  final Widget? customLoadingWidget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconChild,
      onPressed: () async {
        await loadingFLow(
          context,
          function: onPressed,
          afterAsync: afterAsync,
          customLoadingWidget: customLoadingWidget,
        );
      },
      iconSize: style.iconSize,
      visualDensity: style.visualDensity,
      padding: style.padding,
      alignment: style.alignment,
      splashRadius: style.splashRadius,
      color: style.color,
      focusColor: style.focusColor,
      hoverColor: style.hoverColor,
      highlightColor: style.highlightColor,
      splashColor: style.splashColor,
      disabledColor: style.disabledColor,
      mouseCursor: style.mouseCursor,
      focusNode: style.focusNode,
      autofocus: style.autoFocus,
      tooltip: style.tooltip,
      enableFeedback: style.enableFeedback,
      constraints: style.constraints,
      style: style.style,
      isSelected: style.isSelected,
      selectedIcon: style.selectedIcon,
    );
  }
}
