import 'package:videos_app/config/constants/video_feed_constants.dart';
import 'package:videos_app/domain/datasources/video_post_datasource.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/infrastructure/models/local_video_model.dart';
import 'package:videos_app/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final start = page;
    final end = start + VideoFeedConstants.pageSize;
    if (start >= videoPosts.length) return [];

    final slice = videoPosts.sublist(
      start,
      end > videoPosts.length ? videoPosts.length : end,
    );

    return slice
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
  }

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) async {
    throw UnimplementedError();
  }
}