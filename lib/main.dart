import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/Screens/Signup.dart';
import 'package:recipe/Screens/login-screen.dart';
import 'Screens/HomePage.dart';
import 'Screens/screens.dart';
import 'package:provider/provider.dart';
import 'DataModel/authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers:[
Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),

        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe Guide',
        theme: ThemeData(
    textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,      ),
        home: AuthenticationWrapper(),
        routes: {
          '/loginscreen': (context) => LoginScreen(),
          'ForgotPassword': (context) => ForgotPassword(),
          'CreateNewAccount': (context) => CreateNewAccount(),
          'HomePage': (context) => MyHomePage(),
         'Signup': (context) => Signup(),

        },    ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MyHomePage();
    }
    return LoginScreen();
  }
}