import 'package:spotube/domain/entities/track.dart';
import 'package:spotube/domain/repositories/music_source_repository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

// Using the existing isolated engine is a good way to avoid rewriting the Isolate logic
import 'package:spotube/services/youtube_engine/youtube_explode_engine.dart';


class PipedMusicRepositoryImpl implements MusicSourceRepository {
  // We can reuse the existing isolated engine to make the transition smoother
  final _engine = IsolatedYoutubeExplode.instance;

  @override
  Future<Track> getTrackDetails(String id) async {
    final video = await _engine.video(id);
    return _videoToTrack(video);
  }

  @override
  Future<List<Track>> getPlaylistTracks(String playlistId) {
    // TODO: Implement playlist fetching logic
    throw UnimplementedError();
  }

  @override
  Future<String> getAudioStreamUrl(Track track) async {
    final manifest = await _engine.manifest(track.id);
    // A simple logic to get the best audio quality
    final audio = manifest.audioOnly.withHighestBitrate();
    return audio.url.toString();
  }

  // A private helper to convert the YouTube API model to our domain model
  Track _videoToTrack(Video video) {
    return Track(
      id: video.id.value,
      title: video.title,
      artist: video.author,
      album: '', // YouTube doesn't have a concept of an album
      artworkUrl: video.thumbnails.highResUrl,
      duration: video.duration ?? Duration.zero,
    );
  }
}
