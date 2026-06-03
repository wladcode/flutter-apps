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
  VideoPlayerController? _controller;
  Future<void>? _initializeFuture;
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) _ensureController();
  }

  @override
  void didUpdateWidget(FullscreenPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _disposeController();
      if (widget.isActive) _ensureController();
    } else if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _ensureController();
      } else {
        _disposeController();
      }
    }
  }

  VideoPlayerController _createController(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return VideoPlayerController.networkUrl(Uri.parse(url));
    }
    return VideoPlayerController.asset(url);
  }

  void _ensureController() {
    if (_controller != null) {
      if (widget.isActive && _controller!.value.isInitialized) {
        _controller!.play();
      }
      return;
    }

    final controller = _createController(widget.videoUrl)
      ..setLooping(true)
      ..setVolume(0);
    _controller = controller;
    _initializeFuture = controller.initialize().then((_) {
      if (mounted && widget.isActive) {
        controller.play();
      }
    });
    setState(() {});
  }

  void _disposeController() {
    _controller?.dispose();
    _controller = null;
    _initializeFuture = null;
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  void _togglePlayPause() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    setState(() => _showOverlay = true);
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) setState(() => _showOverlay = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return _InactivePlaceholder(caption: widget.caption);
    }

    return FutureBuilder<void>(
      key: ValueKey(widget.videoUrl),
      future: _initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Stack(
            fit: StackFit.expand,
            children: [
              const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              ),
            ],
          );
        }

        if (snapshot.hasError) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.white70, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      'Error loading video',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        widget.videoUrl,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption),
              ),
            ],
          );
        }

        final controller = _controller!;
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
                  width: controller.value.size.width,
                  height: controller.value.size.height,
                  child: VideoPlayer(controller),
                ),
              ),
              VideoBackground(),
              if (_showOverlay)
                Center(
                  child: AnimatedOpacity(
                    opacity: _showOverlay ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
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

class _InactivePlaceholder extends StatelessWidget {
  final String caption;

  const _InactivePlaceholder({required this.caption});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: Colors.black),
        VideoBackground(),
        Positioned(
          bottom: 50,
          left: 20,
          child: _VideoCaption(caption: caption),
        ),
      ],
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
