
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/user_entity.dart';

 class UserModel {
  String? email;
  String? Uid;
  UserModel({ this.email,  this.Uid});

  factory UserModel.fromFireBaseUser(User user){
    return UserModel(
        email: user.email,
        Uid: user.uid);

  }
  UserEntity toEntity() {
    return UserEntity(
        email: email,
        Uid: Uid
    );
  }
}