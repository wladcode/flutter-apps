import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videos_app/config/theme/app_theme.dart';
import 'package:videos_app/domain/repositories/video_post_repository.dart';
import 'package:videos_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:videos_app/infrastructure/datasources/remote_video_datasource_impl.dart';
import 'package:videos_app/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:videos_app/presentation/providers/discover_provider.dart';
import 'package:videos_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.videoPostRepository});

  /// Optional override for tests or custom wiring.
  final VideoPostRepository? videoPostRepository;

  @override
  Widget build(BuildContext context) {
    final repository = videoPostRepository ??
        VideoPostRepositoryImpl(
          // Swap to LocalVideoDatasourceImpl() for offline asset videos.
          videoPostDatasource: LocalVideoDatasourceImpl(),
        );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoPostRepository: repository)..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Videos App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}