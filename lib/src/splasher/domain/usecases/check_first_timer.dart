import 'package:translation_bt/core/usecases/usecase.dart';
import 'package:translation_bt/core/utils/typedefs.dart';
import 'package:translation_bt/src/splasher/domain/repo/splasher_repo.dart';

class CheckFirstTimer extends UsecaseWithoutParams<bool> {
  const CheckFirstTimer(this._repo);

  final SplasherRepository _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkFirstTimer();
}
