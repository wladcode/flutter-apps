import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';
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

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);

    final provider = context.read<DiscoverProvider>();
    if (page >= widget.videos.length - 2 && provider.hasMore) {
      provider.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingMore = context.watch<DiscoverProvider>().isLoadingMore;

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.videos.length,
          onPageChanged: _onPageChanged,
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
        ),
        if (isLoadingMore)
          const Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
      ],
    );
  }
}
