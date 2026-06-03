import 'package:videos_app/domain/datasources/video_post_datasource.dart';
import 'package:videos_app/domain/repositories/video_post_repository.dart';
import 'package:videos_app/domain/entities/video_post.dart';


class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;
  VideoPostRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) async {
    return videoPostDatasource.getFavoriteVideosByUser(userID);
  }
}