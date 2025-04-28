import 'package:dio/dio.dart';
import 'package:shopping/view-model/data/online/dio-helper.dart';
import 'package:shopping/view-model/data/online/endpoints.dart';

abstract class Repository {
  Future<Response?>categoriesListData();
}

class RepoImplementation implements Repository{
  final DioHelper? dioHelper;
  RepoImplementation({required this.dioHelper,});

  @override
  Future<Response?> categoriesListData() async{
   return await dioHelper?.getData(url: categoriesList);
  }
}