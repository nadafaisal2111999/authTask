import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'cubite_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUsecase logoutUseCase;
  final SignupUseCase signupUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit(
      this.signupUseCase,
      this.loginUseCase,
      this.logoutUseCase,
      this.resetPasswordUseCase,
      ) : super(InitialState());

  Future<void> login(String email, String password) async {
    emit(loadingState());
    try {
      final user = await loginUseCase(email, password);
      emit(sucsessState(user));
    } catch (e) {
      emit(erorrState(e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(loadingState());
    try {
      final user = await signupUseCase(email, password);
      emit(sucsessState(user));
    } catch (e) {
      emit(erorrState(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(loadingState());
    try {
      await resetPasswordUseCase(email);
      // ممكن تعمل State خاصة بتأكيد إرسال الإيميل
    } catch (e) {
      emit(erorrState(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(loadingState());
    try {
      await logoutUseCase();
      emit(InitialState());
    } catch (e) {
      emit(erorrState(e.toString()));
    }
  }
}