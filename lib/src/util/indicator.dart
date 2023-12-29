
import 'package:flutter/material.dart';

class DefaultIndicator extends StatelessWidget {
  const DefaultIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 3,
    );
  }
}
