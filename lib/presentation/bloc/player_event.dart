part of 'player_bloc.dart';

abstract class PlayerEvent {}

class PlayTrack extends PlayerEvent {
  final Track track;

  PlayTrack(this.track);
}

class PauseTrack extends PlayerEvent {}

class ResumeTrack extends PlayerEvent {}
