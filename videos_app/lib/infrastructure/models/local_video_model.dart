import 'package:videos_app/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;
  final int comments;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
    this.comments = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) {
    final videoUrl = json['videoUrl'];
    if (videoUrl is! String || videoUrl.isEmpty) {
      throw FormatException('Invalid or missing videoUrl in video post');
    }

    return LocalVideoModel(
      name: _parseString(json['name'], fallback: 'No name'),
      videoUrl: videoUrl,
      likes: _parseInt(json['likes']),
      views: _parseInt(json['views']),
      comments: _parseInt(json['comments']),
    );
  }

  static String _parseString(Object? value, {required String fallback}) {
    if (value is String && value.isNotEmpty) return value;
    return fallback;
  }

  static int _parseInt(Object? value) {
    if (value is int) return value;
    if (value is double) return value.round();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'videoUrl': videoUrl,
        'likes': likes,
        'views': views,
        'comments': comments,
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
        comments: comments,
      );
}
