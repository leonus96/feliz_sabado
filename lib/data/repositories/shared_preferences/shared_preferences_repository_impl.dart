import 'dart:ui';

import 'package:feliz_sabado/data/datasources/shared_preferences/shared_preferences_data_source.dart';
import 'package:feliz_sabado/domain/repositories/shared_preferences/shared_preferences_repository.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferencesDataSource dataSource;

  const SharedPreferencesRepositoryImpl({required this.dataSource});

  @override
  Future<Brightness> getCurrentTheme() => dataSource.getCurrentTheme();
}
