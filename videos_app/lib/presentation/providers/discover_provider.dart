import 'package:flutter/material.dart';
import 'package:videos_app/config/constants/video_feed_constants.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;
  static const int pageSize = VideoFeedConstants.pageSize;

  bool initialLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;
  final List<VideoPost> _videos = [];
  int _loadedOffset = 0;

  DiscoverProvider({required this.videoPostRepository});

  List<VideoPost> get videos => List.unmodifiable(_videos);

  Future<void> loadNextPage() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    notifyListeners();

    final newVideos =
        await videoPostRepository.getTrendingVideosByPage(_loadedOffset);

    _videos.addAll(newVideos);
    _loadedOffset += newVideos.length;
    hasMore = newVideos.length == pageSize;
    initialLoading = false;
    isLoadingMore = false;
    notifyListeners();
  }
}
