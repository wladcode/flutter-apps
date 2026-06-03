import 'package:flutter_test/flutter_test.dart';
import 'package:videos_app/domain/entities/video_post.dart';
import 'package:videos_app/domain/repositories/video_post_repository.dart';
import 'package:videos_app/infrastructure/models/local_video_model.dart';
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

void main() {
  test('loadNextPage paginates without duplicating', () async {
    final provider = DiscoverProvider(
      videoPostRepository: _FakeVideoPostRepository(),
    );

    await provider.loadNextPage();
    expect(provider.videos.length, DiscoverProvider.pageSize);
    expect(provider.hasMore, isTrue);

    await provider.loadNextPage();
    expect(provider.videos.length, DiscoverProvider.pageSize * 2);

    await provider.loadNextPage();
    expect(provider.videos.length, 8);
    expect(provider.hasMore, isFalse);

    await provider.loadNextPage();
    expect(provider.videos.length, 8);
  });

  test('loadNextPage when exhausted does nothing', () async {
    final provider = DiscoverProvider(
      videoPostRepository: _FakeVideoPostRepository(),
    );

    while (provider.hasMore) {
      await provider.loadNextPage();
    }

    await provider.loadNextPage();

    expect(provider.videos.length, 8);
    expect(provider.isLoadingMore, isFalse);
  });
}
