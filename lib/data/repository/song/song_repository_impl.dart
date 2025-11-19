import 'package:dartz/dartz.dart';
import 'package:learn_app/domain/repository/song/song.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) {
    // TODO: implement addOrRemoveFavoriteSong
    throw UnimplementedError();
  }

  @override
  Future<Either> getNewsSongs() {
    // TODO: implement getNewsSongs
    throw UnimplementedError();
  }

  @override
  Future<Either> getPlayList() {
    // TODO: implement getPlayList
    throw UnimplementedError();
  }

  @override
  Future<Either> getUserFavoriteSongs() {
    // TODO: implement getUserFavoriteSongs
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavoriteSong(String songId) {
    // TODO: implement isFavoriteSong
    throw UnimplementedError();
  }

}