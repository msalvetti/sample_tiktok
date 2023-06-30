import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';

import '../../shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDatasource {
  List<VideoPost> videos = [];

  @override
  Future<List<VideoPost>> getFavoritesVideosByUser(String userID) {
    // TODO: implement getFavoritesVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
