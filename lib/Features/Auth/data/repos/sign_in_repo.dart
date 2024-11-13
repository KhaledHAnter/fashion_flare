import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Core/Helper/auth_services/auth_result.dart';
import '../../../../Core/Helper/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  final AuthServices _auth;
  final FirebaseFirestore _firestore;

  SignInRepo(this._auth, this._firestore);

  Future<AuthResult> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.loginUser(email, password);
      return AuthResult.success(userCredential.user);
      // return userCredential.user;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return const AuthResult.error('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        return const AuthResult.error('Wrong password provided.');
      } else if (error.code == 'invalid-email') {
        return const AuthResult.error('The email address is badly formatted.');
      } else if (error.code == 'invalid-credential') {
        return const AuthResult.error(
            'Email and password do not match. Please try again.');
      } else {
        return const AuthResult.error('An unexpected error occurred.');
      }
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
