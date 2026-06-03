import 'package:flutter/material.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/infrastructure/models/local_video_model.dart';
import 'package:videos_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  static const int pageSize = 3;

  bool initialLoading = true;
  bool isLoadingMore = false;
  final List<VideoPost> _videos = [];
  int _loadedPages = 0;

  List<VideoPost> get videos => List.unmodifiable(_videos);

  bool get hasMore => _loadedPages * pageSize < videoPosts.length;

  Future<void> loadNextPage() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    notifyListeners();

    final start = _loadedPages * pageSize;
    final end = (start + pageSize).clamp(0, videoPosts.length);
    final slice = videoPosts.sublist(start, end);

    final newVideos = slice
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    _videos.addAll(newVideos);
    _loadedPages++;
    initialLoading = false;
    isLoadingMore = false;
    notifyListeners();
  }
}
