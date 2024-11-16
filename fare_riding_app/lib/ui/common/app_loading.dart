import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'app_colors.dart';

class AppLoadingIndicator {
  static bool _isShowing = false;
  static late OverlayEntry _overlayEntry;

  static void show(BuildContext context) {
    if (_isShowing) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black26,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulse,
              colors: [AppColors.primary],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry);
    _isShowing = true;
  }

  static void hide() {
    if (!_isShowing) return;

    _isShowing = false;
    _overlayEntry.remove();
  }
}
