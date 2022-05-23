import 'package:exam_prep/app/flavor.dart';
import 'package:exam_prep/data/app_db/app_db.dart';
import 'package:exam_prep/data/app_db/app_db_impl.dart';
import 'package:exam_prep/data/app_pref/shared_app_pref.dart';
import 'package:exam_prep/data/app_pref/shared_app_pref_impl.dart';
import 'package:exam_prep/repository/user_repository/user_repository.dart';
import 'package:exam_prep/repository/user_repository/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.asNewInstance();

class AppInjector {
  factory AppInjector() => _singleton;

  AppInjector._internal();

  Flavor? _flavor;

  Flavor? get flavor => _flavor;

  static final AppInjector _singleton = AppInjector._internal();

  Future<void> configure(Flavor flavor) async {
    _flavor = flavor;

    await _initRepos();
  }

  Future<void> _initRepos() async {
    // SharedPreferences
    final appsPrefs = SharedAppPrefsImpl();
    await appsPrefs.initialise();
    locator.registerSingleton<AppPrefs>(appsPrefs);

    /// User Repository
    locator.registerSingleton<UserRepository>(
      UserRepositoryImpl(
        appPrefsClient: locator(),
      ),
    );

    /// DbHelper;
    final appDb = AppDbImpl(
      userRepository: locator(),
    );
    await appDb.initialise();
    locator.registerSingleton<AppDb>(appDb);
  }
}
