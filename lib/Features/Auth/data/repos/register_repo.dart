import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Core/Helper/auth_services/auth_result.dart';
import '../../../../Core/Helper/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo {
  final AuthServices _auth;
  final FirebaseFirestore _firestore;

  RegisterRepo(this._auth, this._firestore);

  Future<AuthResult> registerWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.registerUser(email, password);
      return AuthResult.success(userCredential.user);
      // return userCredential.user;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return const AuthResult.error('The password is too weak.');
      } else if (error.code == 'email-already-in-use') {
        return const AuthResult.error(
            'Email address already in use. Please sign in.');
      } else if (error.code == 'operation-not-allowed') {
        return const AuthResult.error(
            'This operation is not allowed. Please contact support.');
      } else if (error.code == 'too-many-requests') {
        return const AuthResult.error('Too many attempts. Try again later.');
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
