import 'package:fpdart/fpdart.dart';
import 'package:aural_flow/core/errors/failures.dart';
import 'package:aural_flow/features/search/domain/entities/track_entity.dart';

abstract class SearchRepository {
  /// Busca canciones basadas en un término de búsqueda.
  Future<Either<Failure, List<TrackEntity>>> searchTracks(String query);

  /// Obtiene sugerencias de búsqueda.
  Future<Either<Failure, List<String>>> getSearchSuggestions(String query);
}
