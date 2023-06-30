import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    // espera 2 segundos y cargar videos
    //  await Future.delayed(const Duration(seconds: 2));

    /*  final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
*/
    final newVideos = await videoPostRepository.getTrendingVideosByPage(0);
    videos.addAll(newVideos);

    for (var i = 0; i < videos.length; ++i) {
      var o = videos[i];
      print("Caption: ${o.caption}");
      print("url: ${o.videoUrl}"); //assets/videos/1.mp4
    }
    initialLoading = false;
    notifyListeners();
  }
}
