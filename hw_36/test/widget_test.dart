import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hw_36/core/di/injection_container.dart';
import 'package:hw_36/core/network/dio_client.dart';
import 'package:hw_36/data/database/app_database.dart';
import 'package:hw_36/domain/usecases/get_posts.dart';

void main() {
  tearDown(() async {
    await GetIt.instance.reset();
  });

  test('DI регистрирует ключевые типы без открытия БД', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    expect(GetIt.instance.isRegistered<DioClient>(), isTrue);
    expect(GetIt.instance.isRegistered<AppDatabase>(), isTrue);
    expect(GetIt.instance.isRegistered<GetPosts>(), isTrue);
  });
}
