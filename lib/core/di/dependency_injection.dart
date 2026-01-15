import 'package:get_it/get_it.dart';
import 'package:spotube/core/feature_toggle/feature_toggle_service.dart';
import 'package:spotube/data/repositories_impl/piped_music_repository_impl.dart';
import 'package:spotube/domain/repositories/music_source_repository.dart';

final getIt = GetIt.instance;

/// Sets up the dependency injection container.
///
/// This function should be called once at the start of the application.
Future<void> setupDependencies() async {
  // Register services
  getIt.registerLazySingleton(() => FeatureToggleService());

  // Register repositories based on feature toggles
  final featureToggleService = getIt<FeatureToggleService>();

  if (featureToggleService.isPremiumEnabled) {
    // In the future, register the premium repository here.
    // For now, we'll throw an error or default to the free one.
    // getIt.registerLazySingleton<MusicSourceRepository>(() => PremiumMusicRepositoryImpl());
    throw UnimplementedError('Premium repository not implemented yet');
  } else {
    // Register the free/default music source repository.
    getIt.registerLazySingleton<MusicSourceRepository>(() => PipedMusicRepositoryImpl());
  }
}
