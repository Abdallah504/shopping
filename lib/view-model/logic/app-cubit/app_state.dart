part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
final class AppLang extends AppState{}
final class NewTheme extends AppState{}
final class AppTheme extends AppState{}