import 'package:flutter/material.dart';
import 'notes_list_screen.dart';
import 'signup_screen.dart'; // si tu as une page d'inscription

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      //  Ici tu peux ajouter la vérification avec SQLite ou API
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotesListScreen()),
      );
    }
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Connexion", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Veuillez entrer votre nom" : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Mot de passe"),
                obscureText: true,
                validator: (value) => value!.isEmpty
                    ? "Veuillez entrer votre mot de passe"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text("Connexion")),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _goToSignUp,
                child: const Text("Créer un compte"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
