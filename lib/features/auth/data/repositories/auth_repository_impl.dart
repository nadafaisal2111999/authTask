import 'package:injectable/injectable.dart';
import 'package:untitled2/features/auth/domain/entity/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository) // هنا بنحط اسم الـ Interface
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final userModel =  await authRemoteDataSource.login(email: email, password: password);
    return userModel.toEntity();
  }

  @override
  Future<void> logout() async {
    final result = await authRemoteDataSource.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    final result = await authRemoteDataSource.resetPassword(email: email);
  }

  @override
  Future<UserEntity> signUp({required String email, required String password}) async {
    final userModel = await authRemoteDataSource.signUp(email: email, password: password);
    return userModel.toEntity();
  }
}