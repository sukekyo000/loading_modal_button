import 'package:flutter/material.dart';

import '../util/indicator.dart';

mixin Loading {
  Future<void> loadingFLow(
    BuildContext context, {
    required Future<void> Function() function,
    void Function()? afterAsync,
    required Widget? customLoadingWidget,
  }) async {
    // show loading modal
    _showLoading(
      context,
      customLoadingWidget: customLoadingWidget,
    );

    // await async function
    await function();

    // pop loading modal when async function is done
    if (context.mounted) {
      Navigator.pop(context);
    }

    // if there is afterAsync function,
    // call it after async function is done
    if (afterAsync != null) afterAsync();
  }

  void _showLoading(
    BuildContext context, {
    Widget? customLoadingWidget,
  }) {
    final indicator = customLoadingWidget ?? const DefaultIndicator();

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Center(
          child: indicator,
        );
      },
    );
  }
}
