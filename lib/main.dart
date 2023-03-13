import 'package:flutter/material.dart';
import 'package:life_quotes_app/views/screen/categories.dart';
import 'package:life_quotes_app/views/screen/homepage.dart';
import 'package:life_quotes_app/views/screen/infopage.dart';
import 'package:life_quotes_app/views/screen/quotespage.dart';
import 'package:life_quotes_app/views/screen/splash_quotes_page.dart';
import 'package:life_quotes_app/views/screen/splashscreen.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isVisited = prefs.getBool('Visited') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isVisited == false) ? 'splash_quotes_page' : 'splash_screen',
      routes: {
        'splash_quotes_page': (context) => SplashQuotesPage(),
        'splash_screen': (context) => SplashScreen(),
        '/': (context) => HomePage(),
        'categories': (context) => CategoriyPage(),
        'quotes_page': (context) => QuotesPage(),
        'details_page': (context) => DetailsPage(),
      },
    ),
  );
}
