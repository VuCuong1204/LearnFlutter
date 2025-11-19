import 'package:learn_app/core/usecase/usecase.dart';
import 'package:learn_app/domain/repository/song/song.dart';
import 'package:learn_app/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return sl<SongsRepository>().isFavoriteSong(params!);
  }
}
