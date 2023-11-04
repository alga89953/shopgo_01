import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:shopgo_01/features/app/splash_screen/splash_screen.dart';
import 'package:shopgo_01/features/user_auth/presentation/pages/home_page.dart';
import 'package:shopgo_01/features/user_auth/presentation/pages/login_page.dart';
import 'package:shopgo_01/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDaE4FZGfOLmDLAR2GNMMhaFEgR6tBfVRU",
        appId: "1:658853456442:web:2b9aa63c264a71ae62e303",
        messagingSenderId: "658853456442",
        projectId: "shopgo-2dfc6",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
