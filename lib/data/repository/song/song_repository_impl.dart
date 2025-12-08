import 'package:dartz/dartz.dart';
import 'package:learn_app/data/sources/songs/song_firebase_service.dart';
import 'package:learn_app/domain/repository/song/song.dart';
import 'package:learn_app/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSong();
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }
}
