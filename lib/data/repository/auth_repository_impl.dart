import 'package:dartz/dartz.dart';
import 'package:learn_app/data/models/auth/create_user_req.dart';
import 'package:learn_app/data/models/songs/signin_user_req.dart';
import 'package:learn_app/domain/repository/auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either> signin(SigninUserReq signinUserReq) {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
