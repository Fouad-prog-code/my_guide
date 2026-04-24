import 'package:flutter/material.dart';
import 'package:my_guide/core/utils/app_styles.dart';

class DialogUtils {
  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // يمنع إغلاق الدايلوج عند الضغط خارجه
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: const [
            Icon(Icons.error_outline, color: Colors.red),
            SizedBox(width: 8),
            Text("Error"),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              "OK",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  static void showMessage({
    required BuildContext context,
    required String msg,
    String? title,
    String? postActionName,
    Function? postAction,
    String? nagtActionName,
    Function? nagtAction,
    bool isLoading = false,
  }) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            postAction?.call();
            if (postAction == null) {
              Navigator.pop(context);
            }
          },
          child: Text(postActionName),
        ),
      );
    }
    if (nagtActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            nagtAction?.call();
          },
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                )
              : Text(nagtActionName),
        ),
      );
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Text(msg, style: AppStyles.regural16Black),
          title: title != null
              ? Text(title, style: AppStyles.blod20Black)
              : SizedBox(),
          actions: actions,
        );
      },
    );
  }
}
