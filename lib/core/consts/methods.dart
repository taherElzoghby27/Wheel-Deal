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
