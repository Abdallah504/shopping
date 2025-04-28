import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/constant.dart';
import '../../data/local/sphelpere.dart';
import '../../data/online/repo.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final Repository repository;
  static AppCubit get(context) => BlocProvider.of(context);
  AppCubit(this.repository) : super(AppInitial());
  bool dark = false;
  bool lang = false;

  void ChnageTheme(bool them){
    setThem(them);
    emit(NewTheme());
    ReadTheme();

  }
  void ChnageLang(bool language,String code)async{
    lang = language;
    langCode=code;
    await setAppLang(lang);
    await setAppLangCode(langCode);
    emit(AppLang());
  }
  void ReadLang()async{
    lang = await getAppLang();
    langCode=await getAppLangCode();
    emit(AppLang());
  }


  void ReadTheme()async{
    dark = await getTheme();
    emit(AppTheme());
  }
}
