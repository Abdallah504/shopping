import 'dart:ui';

import 'package:flutter/material.dart';

import '../logic/app-cubit/app_cubit.dart';

class AppColors{
  Color orange = Colors.orange;
  Color black = Colors.black;
  Color white = Colors.white;

}
dynamic langCode;
AppCubit appCubit(context) => AppCubit.get(context);
