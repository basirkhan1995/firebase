import 'package:firebase_app/FirebaseServices/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final auth = FirebaseServices();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user?.email??""),
            TextButton(
                onPressed: (){
                  auth.signOut().then((_){

                  });
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
