import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> loginUser(
    {required String? email, required String? password}) async {
  return await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
}

Future<UserCredential> registerUser(
    {required String? email, required String? password}) async {
  return await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
}
