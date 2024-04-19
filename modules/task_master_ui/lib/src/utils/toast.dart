
import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

///
void showErrorSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}

///
void showSuccessSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    Overlay.of(context),
    displayDuration: const Duration(seconds: 1),
    CustomSnackBar.success(
      message: message,
    ),
  );
}
