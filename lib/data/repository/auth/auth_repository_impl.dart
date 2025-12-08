import 'package:dartz/dartz.dart';
import 'package:learn_app/data/models/auth/create_user_req.dart';
import 'package:learn_app/data/models/auth/signin_user_req.dart';
import 'package:learn_app/data/sources/auth/auth_firebase_service.dart';
import 'package:learn_app/domain/repository/auth/auth.dart';
import 'package:learn_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
