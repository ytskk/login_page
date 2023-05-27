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

  await cacheClient.write(
    key: 'timestamped',
    value: CacheEntity('Hello, world!'),
  );

  final numbers = await cacheClient.read<List<int>>(key: 'numbers');
  final string = await cacheClient.read<String>(key: 'string');
  final timestamped = await cacheClient.read<CacheEntity>(
    key: 'timestamped',
  );

  print('numbers: $numbers');
  print('string: $string');
  print('timestamped: $timestamped');
}
