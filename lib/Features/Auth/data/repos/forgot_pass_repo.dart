import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Core/Helper/auth_services/auth_result.dart';
import '../../../../Core/Helper/auth_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassRepo {
  final AuthServices _auth;
  final FirebaseFirestore _firestore;

  ForgotPassRepo(this._auth, this._firestore);

  Future<bool> isUserRegistered(String email) async {
    final DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(email).get();

    // Check if user document exists in Firestore
    return userSnapshot.exists;
  }

  Future<AuthResult> sendResetPasswordEmail(String email) async {
    bool isRegistered = await isUserRegistered(email);
    if (isRegistered) {
      try {
        await _auth.resetPassword(email);
        return const AuthResult.success('Password reset email sent.');
        // return userCredential.user;
      } on FirebaseAuthException catch (error) {
        return AuthResult.error(
            'An unexpected error occurred. ${error.message}');
      }
    } else {
      return const AuthResult.error(
          'No user found for that email. Pleasqe register first.');
    }
  }
}
