import 'package:flutter/material.dart';
import 'package:photo_editor/screens/adjust_screen.dart';
import 'package:photo_editor/screens/crop_screen.dart';
import 'package:photo_editor/screens/filter_screen.dart';
import 'package:photo_editor/screens/home_screen.dart';
import 'package:photo_editor/screens/sticker_screen.dart';
import 'package:photo_editor/screens/text_screen.dart';
import 'package:provider/provider.dart';
import 'providers/app_image_provider.dart';
import 'package:photo_editor/screens/start_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppImageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Editor',
      theme: ThemeData(
        scaffoldBackgroundColor:Color(0xff212121),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor:Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always
        ),
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => const StartScreen(),
        '/home': (_) => const HomeScreen(),
        '/crop': (_) => const CropScreen(),
        '/filter': (_) => const FilterScreen(),
        '/adjust': (_) => const AdjustScreen(),
        '/sticker': (_) => const StickerScreen(),
        '/text': (_) => const TextScreen(),
      },
      initialRoute: '/',
    );
  }
}


