// import 'package:flutter/material.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
//
// class ThemeCubit extends HydratedCubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.light);
//
//   changeTheme(){
//     if (state == ThemeMode.light) {
//       emit(ThemeMode.dark);
//     } else {
//       emit(ThemeMode.light);
//     }
//   }
//
//   @override
//   ThemeMode? fromJson(Map<String, dynamic> json) {
//     try {
//       return (json['theme'] as String).toThemeMode;
//     } catch (_) {
//       throw UnimplementedError();
//     }
//   }
//
//   @override
//   Map<String, dynamic>? toJson(ThemeMode state) => {'theme': state.toString()};
// }
// extension ThemeModeExtension on String {
//   ThemeMode get toThemeMode =>
//       this == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light;
//
// }