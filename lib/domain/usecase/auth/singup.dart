import 'package:dartz/dartz.dart';
import 'package:learn_app/core/usecase/usecase.dart';
import 'package:learn_app/data/models/auth/create_user_req.dart';
import 'package:learn_app/domain/repository/auth/auth.dart';
import 'package:learn_app/service_locator.dart';

class SingupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
