
  import 'package:firebase_app/FirebaseServices/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{
   final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<AuthResult> signIn({required email, required password})async{
     try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
       return AuthResult(isSuccess: true);
     }catch(e){
       return AuthResult(error: e.toString());
     }
   }

   //Logout
   Future<void> signOut()async{
     await _auth.signOut();
   }

  }