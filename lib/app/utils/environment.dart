import 'package:flutter/foundation.dart' show kDebugMode, kReleaseMode;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      //return '.env';
      //No tendremos una version de produccion
      return '.env.produccion';
    } else if (kDebugMode) {
      //return '.env';
      //No tendremos una version de desarrollo
      return '.env.develop';
    } else {
      return '.env';
    }
  }

  static String get apiMarvelURL {
    return dotenv.env['BASE_URL'] ?? '';
  }

  static String get publicKeyApi {
    return dotenv.env['PUBLIC_KEY'] ?? '';
  }

  static String get privateKeyApi {
    return dotenv.env['PRIVATE_KEY'] ?? '';
  }
}
