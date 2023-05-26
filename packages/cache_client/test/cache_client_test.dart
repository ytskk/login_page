import 'package:cache_client/cache_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'In memory cache client',
    () {
      test('Write and read test', () async {
        final ICacheClient cacheClient = InMemoryCacheClient();

        await cacheClient.write(
          key: 'hello_world',
          value: 'Hello, world',
        );
        await cacheClient.write(
          key: 'answer_to_life',
          value: 42,
        );

        final helloWorld = await cacheClient.read<String>(key: 'hello_world');
        final answerToLife = await cacheClient.read<int>(key: 'answer_to_life');
        final errorKey = await cacheClient.read(key: 'error_key');

        expect(helloWorld, 'Hello, world');
        expect(answerToLife, 42);
        expect(errorKey, isNull);
      });
    },
  );
}
