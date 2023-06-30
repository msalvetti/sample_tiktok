import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

import '../../../domain/entities/videos_post.dart';
import '../videos/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            FullScreenPlayer(
              videoUrl: videoPost.videoUrl,
              caption: videoPost.caption,
            ),

            //VIDEO Player + gradiente
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
            //Botones
          ],
        );
      },
    );
  }
}
