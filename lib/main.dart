import 'package:demo_ui/constants.dart';
import 'package:demo_ui/provider/app_provider.dart';
import 'package:demo_ui/provider/auth_provider.dart';
import 'package:demo_ui/services/local/cache_helper.dart';
import 'package:demo_ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  token = CacheHelper.getData('token') ?? '';
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      fontFamily: 'Mooli',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: pColor,
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData, // Use the defined theme here
      home: const SplashScreen(),
    );
  }
}
