/// Represents a single, unified track entity within the domain layer.
///
/// This class is pure and has no dependencies on external models or APIs.
/// It serves as the single source of truth for what a "track" is in the application.
class Track {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String artworkUrl;
  final Duration duration;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.artworkUrl,
    required this.duration,
  });
}
