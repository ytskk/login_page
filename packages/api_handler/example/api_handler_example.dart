import 'dart:math';

import 'package:api_handler/api_handler.dart';

void main() async {
  try {
    final weather = await getWeather();

    print('Weather: $weather');
  } on ApiNetworkException catch (e) {
    print(e);
  }
}

Future<int> getWeather() async {
  final random = Random();
  return await ApiHandler.get(() async {
    if (random.nextBool()) {
      throw ApiNetworkDioException(error: {
        'code': 404,
        'message': 'Not found',
      });
    }

    return 1;
  });
}
