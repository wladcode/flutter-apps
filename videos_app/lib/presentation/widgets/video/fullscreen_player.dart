import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videos_app/presentation/widgets/video/video_background.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  final bool isActive;
  final VoidCallback? onDoubleTap;

  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
    this.isActive = true,
    this.onDoubleTap,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeFuture;
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setLooping(true)
      ..setVolume(0);
    _initializeFuture = _controller.initialize();
    if (widget.isActive) _controller.play();
  }

  @override
  void didUpdateWidget(FullscreenPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _controller.dispose();
      _controller = VideoPlayerController.asset(widget.videoUrl)
        ..setLooping(true)
        ..setVolume(0);
      _initializeFuture = _controller.initialize();
      if (widget.isActive) _controller.play();
    } else if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() => _showOverlay = true);
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showOverlay = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.white70, size: 48),
                const SizedBox(height: 8),
                Text('Error loading video',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          );
        }

        return GestureDetector(
          onTap: _togglePlayPause,
          onDoubleTap: widget.onDoubleTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
              VideoBackground(),
              if (_showOverlay)
                Center(
                  child: AnimatedOpacity(
                    opacity: _showOverlay ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.play_arrow
                          : Icons.pause,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 64,
                    ),
                  ),
                ),
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
