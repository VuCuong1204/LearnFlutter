import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_app/data/models/songs/songs.dart';
import 'package:learn_app/domain/entities/songs/songs.dart';
import 'package:learn_app/domain/usecase/song/is_favorite_song.dart';
import 'package:learn_app/service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSong();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      late bool isFavorite;
      var user = firebaseAuth.currentUser;
      String uID = user!.uid;

      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uID)
          .collection('Favorites')
          .where(
            'songId',
            isEqualTo: songId,
          )
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(uID)
            .collection('Favorites')
            .add(
          {
            'songId': songId,
            'addedDate': Timestamp.now(),
          },
        );
        isFavorite = true;
      }

      return Right(isFavorite);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy(
            'releaseDate',
            descending: true,
          )
          .limit(3)
          .get();

      for (var elemenet in data.docs) {
        var songModel = SongModel.fromJson(elemenet.data());
        bool isFavorite = await sl<IsFavoriteSongUseCase>()
            .call(params: elemenet.reference.id);
        songModel.isFavorite = isFavorite;
        songModel.songId = elemenet.reference.id;
        songs.add(
          songModel.toEntity(),
        );
      }

      return right(songs);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return const Left('An error occurred, Please try  again');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy(
            'releaseDate',
            descending: true,
          )
          .get();

      for (var elemenet in data.docs) {
        var songModel = SongModel.fromJson(elemenet.data());

        bool isFavorite = await sl<IsFavoriteSongUseCase>().call(
          params: elemenet.reference.id,
        );
        songModel.isFavorite = isFavorite;
        songModel.songId = elemenet.reference.id;
        songs.add(
          songModel.toEntity(),
        );
      }

      return right(songs);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }

      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getUserFavoriteSong() async {
    try {
      List<SongEntity> favoriteSong = [];
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      String uID = user!.uid;
      QuerySnapshot favoriteSnapshot = await firebaseFirestore
          .collection('User')
          .doc(uID)
          .collection('Favorites')
          .get();

      for (var elemenet in favoriteSnapshot.docs) {
        String songId = elemenet['songId'];
        var song =
            await firebaseFirestore.collection('Songs').doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.isFavorite = true;
        songModel.songId = songId;
        favoriteSong.add(songModel.toEntity());
      }

      return Right(favoriteSong);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      String uID = user!.uid;

      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uID)
          .collection('Favorites')
          .where(
            'songId',
            isEqualTo: songId,
          )
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
