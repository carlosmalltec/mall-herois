class SplashController {
  Future<void> verificationAuth({
    required Function() onSuccess,
    required Function() onError,
  }) async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      onSuccess();
    }).onError((e, s) {
      onError();
    });
  }
}
