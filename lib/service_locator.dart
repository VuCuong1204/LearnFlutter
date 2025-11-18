import 'package:get_it/get_it.dart';
import 'package:learn_app/domain/repository/auth.dart';
import 'package:learn_app/domain/usecase/auth/signin.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepository(),
  );
}
