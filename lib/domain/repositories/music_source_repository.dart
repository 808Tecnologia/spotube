import 'package:spotube/domain/entities/track.dart';

/// Abstract repository for fetching music data from a source.
///
/// This contract is agnostic to the actual source of the music (e.g., YouTube,
/// Spotify, a premium SaaS service, local files). The core application only
/// interacts with this interface.
abstract class MusicSourceRepository {
  /// Fetches the details for a single track by its unique ID.
  Future<Track> getTrackDetails(String id);

  /// Fetches all the tracks within a given playlist.
  Future<List<Track>> getPlaylistTracks(String playlistId);

  /// Gets the actual streamable URL for a given track.
  /// This is what the audio player will use to play the song.
  Future<String> getAudioStreamUrl(Track track);
}
