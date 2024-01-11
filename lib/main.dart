import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mata_kuliah/screens/addMataKuliah.dart';
import 'package:mata_kuliah/utils/firebase_options.dart';
import 'package:mata_kuliah/screens/homePage.dart';
import 'package:mata_kuliah/screens/forgotPassword.dart';
import 'package:mata_kuliah/screens/loginPage.dart';
import 'package:mata_kuliah/screens/register.dart';
import 'package:mata_kuliah/screens/splashScreen.dart';
import 'package:mata_kuliah/screens/landingPage.dart';
import 'package:mata_kuliah/screens/fileMataKuliah.dart';
import 'package:mata_kuliah/screens/tableMataKuliah.dart';
import 'utils/fire_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'landing': (context) => LandingPage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'forgot': (context) => ForgotPassPage(),
        'addMataKuliah': (context) => AddMataKuliah(),
        'tableMataKuliah': (context) => Tabelmatakuliah(),
        // 'fileMataKuliah': (context) => matakuliah(),
      },
    );
  }
}
