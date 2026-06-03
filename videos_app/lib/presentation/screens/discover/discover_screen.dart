import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';
import 'package:videos_app/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    final videos = discoverProvider.videos;
    final initialLoading = discoverProvider.initialLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
      ),
      body: initialLoading
          ? const Center(child: CircularProgressIndicator())
          : videos.isEmpty
              ? const Center(
                  child: Text('No videos available'),
                )
              : VideoScrollableView(videos: videos),
    );
  }
}
