// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';

class AdaptiveControls extends StatelessWidget {
  const AdaptiveControls({
    Key? key,
    required this.allowSkippingInLiveMode,
  }) : super(key: key);

  final bool allowSkippingInLiveMode;
  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return const MaterialControls();

      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return const MaterialDesktopControls();

      case TargetPlatform.iOS:
        return CupertinoControls(
          backgroundColor: const Color.fromRGBO(41, 41, 41, 0.7),
          iconColor: const Color.fromARGB(255, 200, 200, 200),
          allowSkippingInLiveMode: allowSkippingInLiveMode,
        );
      default:
        return const MaterialControls();
    }
  }
}
