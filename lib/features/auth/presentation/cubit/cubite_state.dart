
import 'package:untitled2/features/auth/domain/entity/user_entity.dart';

abstract class AuthState {}
class InitialState extends AuthState{}
class loadingState extends AuthState{}
class erorrState extends AuthState{
  String error;
  erorrState(this.error) ;
}
class sucsessState extends AuthState{
  UserEntity user;
  sucsessState(this.user) ;
}
