import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String valorantBaseUrl =
      dotenv.env['valorantBaseUrl'] ?? "No hay apiKey";
}
