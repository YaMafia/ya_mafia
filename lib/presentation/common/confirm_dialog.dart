import 'package:flutter/material.dart';
import 'package:ya_mafia/core/constants.dart';
import 'package:ya_mafia/core/theme/tailor_theme/my_theme.dart';
import 'package:ya_mafia/zgen/i18n/strings.g.dart';

Future<bool> confirmDialog(BuildContext context, {required String text}) async {
  bool check = false;

  /// почему не check = await showDialog(...)?
  /// Тоже не очень понятен смысл этой функции, как будто лучше описать отдельно виджет диалога и
  /// вызывать стандартный showDialog в местах где нужно вызывать сonfirmDialog сейчас
  ///
  /// class CustomDialog extends StatelessWidget { ... }
  ///
  /// Future<void> foo() async {
  ///   final result = await showDialog(context: context, builder: (_) => CustomDialog(...));
  /// }
  await showDialog(
    context: context,
    builder: (_) {
      return Builder(builder: (context) {
        return AlertDialog(
          backgroundColor: context.mainLight,
          title: Padding(
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding,
              top: appPadding,
            ),
            child: Text(
              text,
              style: context.dialogTitleStyle,
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return FilledButton.tonal(
                onPressed: () {
                  check = true;
                  Navigator.of(context).pop();
                },
                child: Text(
                  context.t.buttonText.confirm,
                  style: context.dialogActionStyle,
                ),
              );
            })
          ],
        );
      });
    },
  );

  return check;
}
