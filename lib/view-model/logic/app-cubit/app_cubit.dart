import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  static AppCubit get(context) => BlocProvider.of(context);
  AppCubit() : super(AppInitial());
}
