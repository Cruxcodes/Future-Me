import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) {
        User? user = userCredential.user;
        if (user != null) {
          // After creating the user, update the user's profile with the username
          user.updateDisplayName(username).then((_) {
            // Username updated successfully
            print('User created with username: ${user.displayName}');
            print('Email: ${user.email}');
            // Any additional operations after successful user creation
          }).catchError((error) {
            // Handle errors while updating the username
            print('Error updating username: $error');
          });
        }
      }).catchError((error) {
        // Handle createUserWithEmailAndPassword errors
        print('Error creating user: $error');
      });
    } catch (err) {}
  }

  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var data = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return data;
    } catch (e) {
      print('Error in signing in: $e');
      return e;
    }
  }

  Future<dynamic> signOut() async {
    return _auth.signOut();
  }
}
