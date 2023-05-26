import 'package:cache_client/cache_client.dart';

void main() async {
  final ICacheClient cacheClient = InMemoryCacheClient();

  await cacheClient.write(
    key: 'numbers',
    value: [1, 2, 2, 1, 1, 2, 1],
  );
  await cacheClient.write(
    key: 'string',
    value: 'Hello, world!',
  );

  final numbers = await cacheClient.read<List<int>>(key: 'numbers');
  final string = await cacheClient.read<String>(key: 'string');

  print('numbers: $numbers');
  print('string: $string');
}
