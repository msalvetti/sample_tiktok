import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/videos_post.dart';

import '../../domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;

  VideoPostRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoritesVideosByUser(String userID) {
    // TODO: implement getFavoritesVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
