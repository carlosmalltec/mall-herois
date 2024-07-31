import 'package:oktoast/oktoast.dart';

import './toast_error_widget.dart';
import './toast_success_widget.dart';
import './toast_warning_widget.dart';

class Toast {
  Toast._();
  static void showToastSuccess({
    String? title,
    String? description,
    Duration? duration,
  }) =>
      showToastWidget(
        ToastSuccessWidget(
          title: title ?? 'título da mensagem',
          description: description ?? 'descrição da mensagem',
        ),
        duration: duration ?? const Duration(seconds: 5),
      );

  static void showToastError({
    String? title,
    String? description,
    Duration? duration,
  }) =>
      showToastWidget(
        ToastErrorWidget(
          title: title ?? 'título da mensagem',
          description: description ?? 'descrição da mensagem',
        ),
        duration: duration ?? const Duration(seconds: 5),
      );
  static void showToastWarning({
    String? title,
    String? description,
    Duration? duration,
  }) =>
      showToastWidget(
        ToastWarningWidget(
          title: title ?? 'título da mensagem',
          description: description ?? 'descrição da mensagem',
        ),
        duration: duration ?? const Duration(seconds: 5),
      );
}
