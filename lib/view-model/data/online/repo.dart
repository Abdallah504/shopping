import 'package:dio/dio.dart';
import 'package:shopping/view-model/data/online/dio-helper.dart';
import 'package:shopping/view-model/data/online/endpoints.dart';

import '../local/cachehelper.dart';

abstract class Repository {
  Future<Response?>categoriesListData();
  Future<Response?>categoriesProductList({required String categoryName});
  Future<Response?>prodDetailData({required int id});
}

class RepoImplementation implements Repository{
  final DioHelper? dioHelper;
  final CacheHelper? cacheHelper;
  RepoImplementation({required this.dioHelper,required this.cacheHelper,});

  @override
  Future<Response?> categoriesListData() async{
   return await dioHelper?.getData(url: categoriesList);
  }

  @override
  Future<Response?> categoriesProductList({required String categoryName}) async{
    return await dioHelper?.getData(url: '$categoryProd/$categoryName');
  }

  @override
  Future<Response?> prodDetailData({required int id})async {
    return await dioHelper?.getData(url: '$prodDetail/$id');
  }
}