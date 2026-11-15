import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/app_providers.dart';
import 'screens/app_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = SharedPreferencesAsync();
  final themeProvider = ThemeProvider(preferences);
  await themeProvider.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const FlavoristaApp(),
    ),
  );
}

class FlavoristaApp extends StatelessWidget {
  const FlavoristaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) => MaterialApp(
        title: 'Flavorista',
        debugShowCheckedModeBanner: false,
        themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE56B45)),
          scaffoldBackgroundColor: const Color(0xFFFFFAF7),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFFAF7),
            foregroundColor: Color(0xFF30241F),
            elevation: 0,
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE56B45),
            brightness: Brightness.dark,
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
