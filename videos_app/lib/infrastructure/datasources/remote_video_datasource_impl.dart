import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:videos_app/config/constants/api_constants.dart';
import 'package:videos_app/config/constants/video_feed_constants.dart';
import 'package:videos_app/domain/datasources/video_post_datasource.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/infrastructure/models/local_video_model.dart';

class RemoteVideoDatasourceImpl implements VideoPostDatasource {
  final http.Client _client;
  final Uri trendingVideosUri;

  static const String _assetFallbackPath = 'assets/api/trending.json';

  List<Map<String, dynamic>>? _cachedPosts;

  RemoteVideoDatasourceImpl({
    http.Client? client,
    Uri? trendingVideosUri,
  })  : _client = client ?? http.Client(),
        trendingVideosUri =
            trendingVideosUri ?? Uri.parse(ApiConstants.trendingVideosUrl);

  Future<List<Map<String, dynamic>>> _loadPosts() async {
    if (_cachedPosts != null) return _cachedPosts!;

    try {
      _cachedPosts = await _fetchFromNetwork();
    } catch (_) {
      _cachedPosts = await _fetchFromAssetFallback();
    }
    return _cachedPosts!;
  }

  Future<List<Map<String, dynamic>>> _fetchFromNetwork() async {
    final response = await _client.get(trendingVideosUri);
    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load videos (${response.statusCode}): ${response.reasonPhrase}',
      );
    }
    return _parsePostsJson(response.body);
  }

  Future<List<Map<String, dynamic>>> _fetchFromAssetFallback() async {
    final jsonString = await rootBundle.loadString(_assetFallbackPath);
    return _parsePostsJson(jsonString);
  }

  List<Map<String, dynamic>> _parsePostsJson(String body) {
    final decoded = json.decode(body);
    if (decoded is! List) {
      throw const FormatException('Expected a JSON array of video posts');
    }
    return decoded
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    final posts = await _loadPosts();
    final start = page;
    final end = start + VideoFeedConstants.pageSize;

    if (start >= posts.length) return [];

    final slice = posts.sublist(
      start,
      end > posts.length ? posts.length : end,
    );

    return slice
        .map((json) => LocalVideoModel.fromJson(json).toVideoPostEntity())
        .toList();
  }

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) async {
    throw UnimplementedError();
  }
}
