
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled2/features/auth/data/model/user_model.dart';

 @injectable

class AuthRemoteDataSource {
  FirebaseAuth firebaseAuth;
  AuthRemoteDataSource(this.firebaseAuth);

  Future<UserModel> login({required String email, required String password})  async {
final credential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
 return UserModel.fromFireBaseUser(credential.user!);

}
 Future<UserModel> signUp({required String email, required String password}) async {
   final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserModel.fromFireBaseUser(credential.user!);
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
    Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
}
}