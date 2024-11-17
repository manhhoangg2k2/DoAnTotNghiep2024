import '../repository/auth_repository.dart';
import '../repository/main_repository.dart';
import 'app_module.dart';

Future<void> repoConfigDI() async {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<MainRepository>(() => MainRepositoryImpl());
}