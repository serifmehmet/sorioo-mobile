import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const kDialogDefaultKey = Key('dialog-default-key');

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'TAMAM',
}) async {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => context.pop(false),
            ),
          TextButton(
            onPressed: () => context.pop(true),
            key: kDialogDefaultKey,
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(title: Text(title), content: content != null ? Text(content) : null, actions: <Widget>[
      if (cancelActionText != null)
        CupertinoDialogAction(
          child: Text(cancelActionText),
          onPressed: () => context.pop(false),
        ),
      CupertinoDialogAction(
        onPressed: () => context.pop(true),
        key: kDialogDefaultKey,
        child: Text(defaultActionText),
      ),
    ]),
  );
}

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(context: context, title: title, content: exception.toString(), defaultActionText: 'TAMAM');
