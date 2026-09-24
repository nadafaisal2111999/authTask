
 import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';
@injectable
class LogoutUsecase {
  AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<void> call() async {
    await authRepository.logout();
  }
}