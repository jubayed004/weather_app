import 'dart:async';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isResendEnabled = true.obs;
  RxInt start = 30.obs;
  Timer? _timer;

  void resendCode() {
    isResendEnabled.value = false;
    start.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        isResendEnabled.value = true;
        _timer?.cancel();
      } else {
        start.value--;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
