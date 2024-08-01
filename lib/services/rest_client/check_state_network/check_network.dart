import 'dart:io';

class CheckInternet {
  Future<bool> isConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
    return false;
  }
}
