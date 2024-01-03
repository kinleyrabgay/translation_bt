import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:translation_bt/src/splasher/domain/usecases/cache_first_timer.dart';
import 'package:translation_bt/src/splasher/domain/usecases/check_first_timer.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckFirstTimer checkFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkFirstTimer = checkFirstTimer,
        super(const SplashInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckFirstTimer _checkFirstTimer;

  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(SplashingError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> checkFirstTimer() async {
    emit(const CheckingFirstTimer());
    final result = await _checkFirstTimer();

    result.fold(
      (failure) => emit(const SplasherStatus(isFirstTimer: true)),
      (status) => emit(SplasherStatus(isFirstTimer: status)),
    );
  }
}
