import 'package:dartz/dartz.dart';
import 'package:learn_app/core/usecase/usecase.dart';
import 'package:learn_app/domain/repository/song/song.dart';
import 'package:learn_app/service_locator.dart';

class GetPlayListUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongsRepository>().getPlayList();
  }
}
