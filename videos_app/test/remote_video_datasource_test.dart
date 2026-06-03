import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:videos_app/infrastructure/datasources/remote_video_datasource_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getTrendingVideosByPage returns paginated posts from HTTP', () async {
    final client = MockClient((request) async {
      expect(request.url.path, endsWith('trending.json'));
      return http.Response(
        '''
        [
          {"name": "A", "videoUrl": "https://example.com/a.mp4", "likes": 1, "views": 2, "comments": 3},
          {"name": "B", "videoUrl": "https://example.com/b.mp4", "likes": 4, "views": 5, "comments": 6},
          {"name": "C", "videoUrl": "https://example.com/c.mp4", "likes": 7, "views": 8, "comments": 9},
          {"name": "D", "videoUrl": "https://example.com/d.mp4", "likes": 10, "views": 11, "comments": 12}
        ]
        ''',
        200,
      );
    });

    final datasource = RemoteVideoDatasourceImpl(
      client: client,
      trendingVideosUri: Uri.parse('https://example.com/trending.json'),
    );

    final page1 = await datasource.getTrendingVideosByPage(0);
    expect(page1.length, 3);
    expect(page1.first.caption, 'A');

    final page2 = await datasource.getTrendingVideosByPage(3);
    expect(page2.length, 1);
    expect(page2.first.caption, 'D');

    final empty = await datasource.getTrendingVideosByPage(10);
    expect(empty, isEmpty);
  });

  test('falls back to bundled JSON when network request fails', () async {
    final client = MockClient((_) async => http.Response('Not found', 404));

    final datasource = RemoteVideoDatasourceImpl(
      client: client,
      trendingVideosUri: Uri.parse('https://example.com/trending.json'),
    );

    final videos = await datasource.getTrendingVideosByPage(0);
    expect(videos, isNotEmpty);
    expect(videos.first.videoUrl, startsWith('https://'));
  });
}
