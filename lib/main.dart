import 'package:app_db/ui/screens/countries.dart';
import 'package:app_db/ui/screens/home.dart';
import 'package:app_db/ui/screens/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        
      ),
      
      routes: {
        "/" : (context)=> const HomeScreen(title: "Home",),
        "countries" : (context) => const CountriesScreen(),
        "profile" : (context) => const ProfileScreen(),
      },
      initialRoute: "/",
    );
  }
}

