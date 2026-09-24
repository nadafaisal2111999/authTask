import 'package:injectable/injectable.dart';

import '../entity/user_entity.dart';
import '../repositories/auth_repository.dart';
@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);
  Future<UserEntity> call(String email, String password) async {
    return await authRepository.login(email: email, password: password);
  }
}