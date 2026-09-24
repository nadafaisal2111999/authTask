
 import 'package:injectable/injectable.dart';

import '../entity/user_entity.dart';
import '../repositories/auth_repository.dart';
@injectable
class SignupUseCase {
  AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  Future<UserEntity> call(String email, String password) async {
    return await authRepository.signUp(email: email, password: password);
  }
}