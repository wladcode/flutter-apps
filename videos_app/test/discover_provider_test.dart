import 'package:flutter_test/flutter_test.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';

void main() {
  test('loadNextPage paginates without duplicating', () async {
    final provider = DiscoverProvider();

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
    final provider = DiscoverProvider();

    while (provider.hasMore) {
      await provider.loadNextPage();
    }

    await provider.loadNextPage();

    expect(provider.videos.length, 8);
    expect(provider.isLoadingMore, isFalse);
  });
}
