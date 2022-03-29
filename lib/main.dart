import 'package:flutter/material.dart';
import 'auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    runApp(MyApp());

  }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      theme:ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      routes: const <String, WidgetBuilder> {
        /*     '/dashboard': (BuildContext context) => new DashboardFirstTime(),
      '/mainQUiz' : (BuildContext context) => new MainQuiz("main"),*/

      },
    );

  }
}




