import 'package:dartz/dartz.dart';
import 'package:learn_app/core/usecase/usecase.dart';
import 'package:learn_app/domain/repository/auth/auth.dart';
import 'package:learn_app/service_locator.dart';

class GetUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }
}
