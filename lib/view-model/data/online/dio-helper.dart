
import 'package:dio/dio.dart';



abstract class DioHelper {


  Future<Response> getData({required String url});


}

class DioImplementation extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 200),
      queryParameters: {

      },
      validateStatus: (statusCode){
        if(statusCode == null){
          return false;
        }
        if(statusCode == 422){ // your http status code
          return true;
        }else{
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ),
  );



  @override
  Future<Response> getData({
    String? url
  }) async {
    dio.options.headers = {
      'accept': 'application/json'
    };

    return await dio.get(
        url!
    );
  }


}
