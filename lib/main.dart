import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'notes_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //  supprime le bandeau "debug"
      title: 'Note App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login', //  page de démarrage
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/notes': (context) => const NotesListScreen(),
      },
    );
  }
}
