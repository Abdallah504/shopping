import 'package:dio/dio.dart';
import 'package:shopping/view-model/data/online/dio-helper.dart';
import 'package:shopping/view-model/data/online/endpoints.dart';

import '../local/cachehelper.dart';

abstract class Repository {
  Future<Response?>categoriesListData();
}

class RepoImplementation implements Repository{
  final DioHelper? dioHelper;
  final CacheHelper? cacheHelper;
  RepoImplementation({required this.dioHelper,required this.cacheHelper,});

  @override
  Future<Response?> categoriesListData() async{
   return await dioHelper?.getData(url: categoriesList);
  }
}