import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotube/core/di/dependency_injection.dart';
import 'package:spotube/domain/entities/track.dart';
import 'package:spotube/domain/repositories/music_source_repository.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final MusicSourceRepository _musicSourceRepository;

  PlayerBloc()
      : _musicSourceRepository = getIt<MusicSourceRepository>(),
        super(PlayerInitial()) {
    on<PlayTrack>((event, emit) async {
      try {
        emit(PlayerLoading());
        final streamUrl = await _musicSourceRepository.getAudioStreamUrl(event.track);
        // Here, we would interact with the actual audio player service
        // For now, we'll just emit the playing state
        emit(PlayerPlaying(track: event.track));
      } catch (e) {
        emit(PlayerError('Failed to play track: ${e.toString()}'));
      }
    });

    on<PauseTrack>((event, emit) async {
      // TODO: Interact with audio player service to pause
      if (state is PlayerPlaying) {
        emit(PlayerPaused(track: (state as PlayerPlaying).track));
      }
    });

    on<ResumeTrack>((event, emit) async {
      // TODO: Interact with audio player service to resume
      if (state is PlayerPaused) {
        emit(PlayerPlaying(track: (state as PlayerPaused).track));
      }
    });
  }
}
