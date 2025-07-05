import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/view/widgets/video/fullscreen_player.dart';
import 'package:toktik/view/widgets/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            //videoplayer + gradient
            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            //buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}
