import 'package:get_it/get_it.dart';
import 'package:learn_app/data/repository/auth/auth_repository_impl.dart';
import 'package:learn_app/data/repository/song/song_repository_impl.dart';
import 'package:learn_app/data/sources/auth/auth_firebase_service.dart';
import 'package:learn_app/data/sources/songs/song_firebase_service.dart';
import 'package:learn_app/domain/repository/auth/auth.dart';
import 'package:learn_app/domain/repository/song/song.dart';
import 'package:learn_app/domain/usecase/auth/get_user.dart';
import 'package:learn_app/domain/usecase/auth/signin.dart';
import 'package:learn_app/domain/usecase/auth/singup.dart';
import 'package:learn_app/domain/usecase/song/add_or_remove_favorite_song.dart';
import 'package:learn_app/domain/usecase/song/get_favorite_songs.dart';
import 'package:learn_app/domain/usecase/song/get_news_songs.dart';
import 'package:learn_app/domain/usecase/song/get_play_list.dart';
import 'package:learn_app/domain/usecase/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<SingupUseCase>(
    SingupUseCase(),
  );

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );

  sl.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );

  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
    AddOrRemoveFavoriteSongUseCase(),
  );

  sl.registerSingleton<IsFavoriteSongUseCase>(
    IsFavoriteSongUseCase(),
  );

  sl.registerSingleton<GetFavoriteSongsUseCase>(
    GetFavoriteSongsUseCase(),
  );
}
