
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';
@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<void> call(String email) async {
    await authRepository.resetPassword(email: email);
  }
}