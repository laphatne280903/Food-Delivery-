import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get curent user
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  //Sign in
  Future<UserCredential> signInWithEmailPassword(String email, String password) async{
    //try sign user in
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }

  }
  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async{
    //try sign user in
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
}
  //logout
  Future<void> logOutAccount() async {
    try{
      return await _firebaseAuth.signOut();
    } on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }

  //Notify login/signup errors

}