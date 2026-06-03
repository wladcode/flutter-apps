import 'package:flutter/material.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/presentation/widgets/shared/video_buttons.dart';
import 'package:videos_app/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatefulWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  State<VideoScrollableView> createState() => _VideoScrollableViewState();
}

class _VideoScrollableViewState extends State<VideoScrollableView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.videos.length,
      onPageChanged: (page) => setState(() => _currentPage = page),
      itemBuilder: (context, index) {
        final videoPost = widget.videos[index];
        return Stack(
          key: ValueKey('video_$index'),
          children: [
            SizedBox.expand(
              child: FullscreenPlayer(
                key: ValueKey(videoPost.videoUrl),
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
                isActive: index == _currentPage,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(videoPost: videoPost),
            ),
          ],
        );
      },
    );
  }
}
