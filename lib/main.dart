
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friday/pages/home_page.dart';
import 'package:friday/styles/app_colors.dart';
import 'package:friday/util/dark_theme_provider.dart';
import 'package:provider/provider.dart';
bool isDarkMode = false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: HomePage(isDarkChecked: (value) {
          },),
        ),);
  }

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.mainColor,
    primarySwatch: AppColors.mainColor,
    backgroundColor: Colors.white
    // Define other properties for the light theme.
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    primarySwatch: Colors.indigo,
    backgroundColor: Colors.black
    // Define other properties for the dark theme.
  );
}
