import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/Widget/toast.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'the email address in use');
      } else {
        showToast(message: 'An error occured is  : ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid user');
      } else {
        showToast(message: 'An error occured is  : ${e.code}');
      }
      return null;
    }
  }
}
