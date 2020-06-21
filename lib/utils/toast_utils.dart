import 'package:bot_toast/bot_toast.dart';

class ToastUtils {
  ToastUtils._();

  static void show(String message) {
    BotToast.showText(text: message);
  }

  static void showToast(String message) {
    BotToast.showText(text: message);
  }
}
