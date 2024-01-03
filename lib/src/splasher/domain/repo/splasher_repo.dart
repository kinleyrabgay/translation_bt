import 'package:translation_bt/core/utils/typedefs.dart';

abstract class SplasherRepository {
  const SplasherRepository();

  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkFirstTimer();
}
