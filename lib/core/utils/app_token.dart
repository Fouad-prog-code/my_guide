import 'dart:convert';

class AppToken {
  static String? getRoleFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      final Map<String, dynamic> data = json.decode(decoded);

      return data["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"];
    } catch (e) {
      return null;
    }
  }

  static String? getFullNameFromToken(String token) {
    try {
      // 1. تقسيم التوكين (الجزء الأوسط هو الـ Payload)

      final parts = token.split('.');
      if (parts.length != 3) return null;

      // 2. فك التشفير
      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      // 3. تحويل النص لـ JSON
      final Map<String, dynamic> data = json.decode(decoded);

      // 4. إرجاع القيمة المرتبطة بـ "FullName"
      return data['FullName'];
    } catch (e) {
      // في حال حدوث خطأ أو كان التوكين غير صالح
      return null;
    }
  }

  static String? getUserNameFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));

      final Map<String, dynamic> data = json.decode(decoded);

      // هذا هو المفتاح المعتمد في التوكين الخاص بك لاسم المستخدم
      return data["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"];
    } catch (e) {
      return null;
    }
  }
}
