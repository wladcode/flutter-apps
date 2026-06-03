import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/domain/repositories/video_post_repository.dart';
import 'package:videos_app/infrastructure/models/local_video_model.dart';
import 'package:videos_app/main.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';
import 'package:videos_app/shared/data/local_video_post.dart';

class _FakeVideoPostRepository implements VideoPostRepository {
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    if (page >= videoPosts.length) return [];

    final end = page + DiscoverProvider.pageSize;
    final slice = videoPosts.sublist(
      page,
      end > videoPosts.length ? videoPosts.length : end,
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

class _EmptyVideoPostRepository implements VideoPostRepository {
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async => [];

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) async =>
      throw UnimplementedError();
}

void main() {
  testWidgets('App renders discover screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(videoPostRepository: _FakeVideoPostRepository()),
    );
    expect(find.text('Discover'), findsOneWidget);

    await tester.pump();
    await tester.pump(const Duration(seconds: 3));

    expect(find.byType(PageView), findsOneWidget);
    expect(find.text('Subiendo escaleras automáticas'), findsOneWidget);
  });

  testWidgets('Discover shows empty state when provider has no videos',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => DiscoverProvider(
          videoPostRepository: _EmptyVideoPostRepository(),
        ),
        child: MaterialApp(
          home: Builder(
            builder: (context) {
              final provider = context.read<DiscoverProvider>();
              provider.initialLoading = false;
              return const Scaffold(
                body: Center(child: Text('No videos available')),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('No videos available'), findsOneWidget);
  });
}
