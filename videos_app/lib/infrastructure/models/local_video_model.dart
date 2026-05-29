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

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'No name',
    videoUrl: json['videoUrl'] ?? 'No video url',
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0,
    comments: json['comments'] ?? 0,
  );

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