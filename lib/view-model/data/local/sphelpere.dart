
import '../../core/di.dart';
import 'cachehelper.dart';



Future<bool> setAppLang(bool langg) async {
  return await di<CacheHelper>().put('langg', langg);
}

Future getAppLang() async {
  return await di<CacheHelper>().get('langg');
}
Future<bool> setAppLangCode(String code) async {
  return await di<CacheHelper>().put('code', code);
}

Future getAppLangCode() async {
  return await di<CacheHelper>().get('code');
}

Future<bool> setThem(bool theme) async {
  return await di<CacheHelper>().put('theme', theme);
}




Future getTheme() async {
  return await di<CacheHelper>().get('theme');
}
