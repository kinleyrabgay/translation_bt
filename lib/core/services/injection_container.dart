import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translation_bt/src/splasher/data/datasource/splasher_local_ds.dart';
import 'package:translation_bt/src/splasher/data/repo/splasher_repo_implementation.dart';
import 'package:translation_bt/src/splasher/domain/repo/splasher_repo.dart';
import 'package:translation_bt/src/splasher/domain/usecases/cache_first_timer.dart';
import 'package:translation_bt/src/splasher/domain/usecases/check_first_timer.dart';
import 'package:translation_bt/src/splasher/presentation/cubit/splash_cubit.dart';

part 'injection_container.main.dart';
