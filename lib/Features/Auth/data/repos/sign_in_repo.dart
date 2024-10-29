import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_flare/Core/Helper/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  final AuthServices _auth;
  final FirebaseFirestore _firestore;

  SignInRepo(this._auth, this._firestore);

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.loginUser(email, password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      rethrow; // Re-throw the exception to handle it in the Cubit
    }
  }

  Future<bool> isUserRegistered(String email) async {
    final DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(email).get();

    // Check if user document exists in Firestore
    return userSnapshot.exists;
  }

  Future handleGoogleSignIn() async {
    User? user = await _auth.signInWithGoogle();
    if (user != null) {
      bool? isRegistered = await isUserRegistered(user.email!);
      return isRegistered;
    }
  }
}
