
// import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../data/local/cachehelper.dart';
import '../data/online/dio-helper.dart';
import '../data/online/repo.dart';
import '../logic/app-cubit/app_cubit.dart';






GetIt di = GetIt.instance..allowReassignment = true;

Future init() async {
  final sp = await SharedPreferences.getInstance();
  //await Firebase.initializeApp();
  di.registerFactory<SharedPreferences>(
        () => sp,
  );
  di.registerFactory<CacheHelper>(
        () => CacheImplementation(
      di<SharedPreferences>(),
    ),
  );
  di.registerFactory<DioHelper>(
        () => DioImplementation(),
  );

  di.registerFactory<Repository>(
        () => RepoImplementation(
      dioHelper: di<DioHelper>(),
          cacheHelper: di<CacheHelper>(),
    ),
  );

  di.registerFactory<AppCubit>(
        () => AppCubit(di<Repository>()),
  );


}
