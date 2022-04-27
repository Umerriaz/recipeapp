import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipeapp/Screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ad_provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdProvider>(create: (context) => AdProvider())
      ],
      child: MaterialApp(
      title: 'Biryani Recipe App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    )
    );
  }
}
