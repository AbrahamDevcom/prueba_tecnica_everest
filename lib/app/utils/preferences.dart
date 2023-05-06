import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static String _tokenPush = '';
  static bool _isDarkmode = false;
  static int _gender = 1;
  static bool _isFirstTime = true;
  static String _idSession = '';
  static String _userName = '';
  static String _password = '';
  static String _tokenMisCuentas = '';
  static String _tokenPaymentGateway = '';
  static bool _itIsRegistered = false;
  static bool _forceOpenTurn = true;
  static bool _turnOpen = false;
  static int _notification = 0;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // static set paymentsResponse(PaymentsResponse paymentsResponse) {
  //   _paymentsResponse = paymentsResponse;
  //   _prefs.setString('paymentsResponse', paymentsResponse.toJson());
  // }

  // static PaymentsResponse get paymentsResponse {
  //   _paymentsResponse = PaymentsResponse.fromJson(_prefs.getString('paymentsResponse') ?? "{}");
  //   return _paymentsResponse;
  // }

  static String get tokenPush {
    return _prefs.getString('tokenPush') ?? _tokenPush;
  }

  static set tokenPush(String tokenPush) {
    _tokenPush = tokenPush;
    _prefs.setString('tokenPush', _tokenPush);
  }

  static bool get itIsRegistered {
    return _prefs.getBool('itIsRegistered') ?? _itIsRegistered;
  }

  static set itIsRegistered(bool itIsRegistered) {
    _itIsRegistered = itIsRegistered;
    _prefs.setBool('itIsRegistered', itIsRegistered);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  //get value from shared preferences
  static Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? "";
  }
}
