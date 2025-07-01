import 'package:firebase_app/FirebaseServices/services.dart';
import 'package:firebase_app/Views/home.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _auth = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                spacing: 8,
                children: [
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hint: Text("Email")),
                  ),

                  TextFormField(
                    controller: password,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hint: Text("Password")),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final result = await _auth.signIn(
                          email: email.text,
                          password: password.text,
                        );
                        if (result.isSuccess == true) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                        }
                        if (result.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result.error ?? "")),
                          );
                        }
                      }
                    },
                    child: Text("LOGIN"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
