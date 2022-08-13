import 'package:feliz_sabado/data/datasources/shared_preferences/shared_preferences_data_source.dart';
import 'package:feliz_sabado/data/repositories/shared_preferences/shared_preferences_repository_impl.dart';
import 'package:feliz_sabado/domain/usecases/get_current_theme.dart';
import 'package:feliz_sabado/presentation/providers/theme/theme_provider.dart';
import 'package:feliz_sabado/presentation/router.dart';
import 'package:feliz_sabado/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FelizSabadoApp extends StatelessWidget {
  const FelizSabadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPrefsRepository = SharedPreferencesRepositoryImpl(
      dataSource: SharedPreferencesDataSource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            getCurrentTheme: GetCurrentTheme(sharedPrefsRepository),
          ),
        )
      ],
      child: const _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kRouteHomePage,
      // TODO: Check if OnBoarding has viewed (prefs) Go to Home
      routes: AppRouter.routes,
      theme: AppTheme.buildTheme(context, theme.value!),
    );
  }
}
