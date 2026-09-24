
import '../entity/user_entity.dart';
abstract class AuthRepository {
Future<UserEntity> login({required String email, required String password});
Future<UserEntity> signUp({required String email, required String password});
Future <void> resetPassword({required String email});
Future <void> logout();
}













