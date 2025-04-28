
// import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';


import '../data/online/dio-helper.dart';
import '../data/online/repo.dart';
import '../logic/app-cubit/app_cubit.dart';






GetIt di = GetIt.instance..allowReassignment = true;

Future init() async {

  di.registerFactory<DioHelper>(
        () => DioImplementation(),
  );

  di.registerFactory<Repository>(
        () => RepoImplementation(
      dioHelper: di<DioHelper>()
    ),
  );

  di.registerFactory<AppCubit>(
        () => AppCubit(),
  );


}
