import 'package:flutter/material.dart';

import '../util/indicator.dart';

mixin Loading {
  Future<void> loadingFLow(
    BuildContext context, {
    required Future<void> Function() function,
    void Function()? afterAsync,
    void Function(Exception error)? errorAsync,
    required Widget? customLoadingWidget,
    required Color? loadingBackgroundColor,
  }) async {
    // show loading modal
    _showLoading(
      context,
      customLoadingWidget: customLoadingWidget,
      loadingBackgroundColor: loadingBackgroundColor,
    );

    try {
      // await async function
      await function();

      // pop loading modal
      if (context.mounted) {
        Navigator.pop(context);
      }

      // if there is afterAsync function,
      // call it after async function is done
      if (afterAsync != null) afterAsync();
    } on Exception catch (e) {
      // pop loading modal
      if (context.mounted) {
        Navigator.pop(context);
      }

      // if there is errorAsync function,
      // call it when error occurred
      errorAsync?.call(e);
    }
  }

  void _showLoading(
    BuildContext context, {
    Widget? customLoadingWidget,
    Color? loadingBackgroundColor,
  }) {
    final indicator = customLoadingWidget ?? const DefaultIndicator();

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: loadingBackgroundColor ??
          Theme.of(context).colorScheme.primary.withOpacity(0.25),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: indicator,
        );
      },
    );
  }
}
