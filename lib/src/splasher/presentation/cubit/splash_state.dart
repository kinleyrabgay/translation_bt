part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class CachingFirstTimer extends SplashState {
  const CachingFirstTimer();
}

class CheckingFirstTimer extends SplashState {
  const CheckingFirstTimer();
}

class UserCached extends SplashState {
  const UserCached();
}

class SplasherStatus extends SplashState {
  const SplasherStatus({required this.isFirstTimer});

  final bool isFirstTimer;

  @override
  List<bool> get props => [isFirstTimer];
}

class SplashingError extends SplashState {
  const SplashingError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
