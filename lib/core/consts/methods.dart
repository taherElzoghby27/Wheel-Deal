import 'package:dio/dio.dart';

import '../helper/flutter_secure_storage.dart';
import 'strings.dart';

FormData convertMapToFormData(Map<String, dynamic> data) {
  return FormData.fromMap(data);
}

saveTokenLocal(String token) async {
  await FlutterSecureStorageEncrypted.writeData(
    StringsEn.token,
    token,
  );
}

Future<String?> readFromCache(String key) async {
  return await FlutterSecureStorageEncrypted.readData(
    key,
  );
}

// EGP 2847354 -> EGP 2,847,354
String handlePrice(int number) {
  String num = number.toString();
  String newNum = '';
  for (int i = num.length - 1; i >= 0; i--) {
    newNum = num[i] + newNum;
    if ((i + 1) % 3 == 0) {
      newNum = ',$newNum';
    }
  }
  newNum = 'EGP $newNum';
  return newNum;
}
