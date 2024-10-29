import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  final AuthServices _auth;

  SignInRepo(this._auth);

  Future handleGoogleSignIn() async {
    User? user = await _auth.signInWithGoogle();
    if (user != null) {
      bool? isRegistered = await isUserRegistered(user.email!);
      return isRegistered;
    }
  }

  Future<bool> isUserRegistered(String email) async {
    final DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    // Check if user document exists in Firestore
    return userSnapshot.exists;
  }
}
