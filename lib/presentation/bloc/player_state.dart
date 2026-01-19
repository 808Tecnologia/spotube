part of 'player_bloc.dart';

abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerPlaying extends PlayerState {
  final Track track;

  PlayerPlaying({required this.track});
}

class PlayerPaused extends PlayerState {
  final Track track;

  PlayerPaused({required this.track});
}

class PlayerStopped extends PlayerState {}

class PlayerError extends PlayerState {
  final String message;

  PlayerError(this.message);
}
